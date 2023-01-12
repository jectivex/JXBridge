#if os(macOS) || os(Linux)
import SwiftSyntax

class SwiftVisitor: SyntaxVisitor {
    private let generator: BridgeGenerator
    private var typeInfoStack: [TypeInfo] = []
    private var currentExtensionVisibility: Visibility?
    private var currentProperty: MemberInfo?

    init(generator: BridgeGenerator) {
        self.generator = generator
        super.init(viewMode: .fixedUp)
    }

    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        let typeInfo = pushTypeInfo(name: node.identifier.text)
        typeInfo.type = .class
        Self.apply(modifiers: node.modifiers, inheritance: node.inheritanceClause, to: typeInfo, defaultVisibility: .internal, isExtendable: true)
        return .visitChildren
    }

    override func visitPost(_ node: ClassDeclSyntax) {
        popTypeInfo()
    }

    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        let typeInfo = pushTypeInfo(name: node.identifier.text)
        typeInfo.type = .struct
        Self.apply(modifiers: node.modifiers, inheritance: node.inheritanceClause, to: typeInfo, defaultVisibility: .internal, isExtendable: false)
        return .visitChildren
    }

    override func visitPost(_ node: StructDeclSyntax) {
        popTypeInfo()
    }

    // TODO: Actor support
//    override func visit(_ node: ActorDeclSyntax) -> SyntaxVisitorContinueKind {
//        let typeInfo = pushTypeInfo(name: node.identifier.text)
//        typeInfo.type = .actor
//        Self.apply(modifiers: node.modifiers, inheritance: node.inheritanceClause, to: typeInfo, defaultVisibility: .internal, isExtendable: true)
//        return .visitChildren
//    }
//
//    override func visitPost(_ node: ActorDeclSyntax) {
//        popTypeInfo()
//    }

    override func visit(_ node: ExtensionDeclSyntax) -> SyntaxVisitorContinueKind {
        guard let typeName = Self.typeName(from: node.extendedType) else {
            pushTypeInfo(name: "", record: false) // Will be immediately removed by visitPost
            return .skipChildren
        }
        let typeInfo = pushTypeInfo(name: typeName)
        Self.apply(modifiers: nil, inheritance: node.inheritanceClause, to: typeInfo, defaultVisibility: nil, isExtendable: false)
        currentExtensionVisibility = Self.visibility(from: node.modifiers)
        return .visitChildren
    }

    override func visitPost(_ node: ExtensionDeclSyntax) {
        popTypeInfo()
        currentExtensionVisibility = nil
    }

    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        pushTypeInfo(name: node.identifier.text, record: false)
        return .visitChildren
    }

    override func visitPost(_ node: EnumDeclSyntax) {
        popTypeInfo()
    }

    override func visit(_ node: VariableDeclSyntax) -> SyntaxVisitorContinueKind {
        guard !typeInfoStack.isEmpty else {
            return .skipChildren
        }
        var property = MemberInfo(name: "")
        property.type = .property
        Self.apply(modifiers: node.modifiers, to: &property, defaultVisibility: currentExtensionVisibility)
        if node.letOrVarKeyword.text == "let" {
            property.hasGetter = true // hasGetter && !hasSetter = get-only
        }
        currentProperty = property
        return .visitChildren
    }

    override func visitPost(_ node: VariableDeclSyntax) {
        if let typeInfo = currentTypeInfo, let currentProperty, !currentProperty.name.isEmpty {
            typeInfo.members.append(currentProperty)
        }
        self.currentProperty = nil
    }

    override func visit(_ node: IdentifierPatternSyntax) -> SyntaxVisitorContinueKind {
        if currentProperty?.name.isEmpty == true {
            let name = node.identifier.text
            currentProperty?.name = name
            if name == "jxSuperclass" {
                currentTypeInfo?.hasJXSuperclass = true
            }
        }
        return .skipChildren
    }

    override func visit(_ node: CodeBlockSyntax) -> SyntaxVisitorContinueKind {
        currentProperty?.hasGetter = true
        return .skipChildren
    }

    override func visit(_ node: AccessorDeclSyntax) -> SyntaxVisitorContinueKind {
        // There are bugs in the current library that mix up these keywords
        if node.asyncKeyword?.text == "async" || node.throwsKeyword?.text == "async" {
            currentProperty?.isAsync = true
        }
        if node.asyncKeyword?.text == "throws" || node.throwsKeyword?.text == "throws" {
            currentProperty?.isThrows = true
        }
        if node.accessorKind.text == "get" {
            currentProperty?.hasGetter = true
        } else if node.accessorKind.text == "set" {
            currentProperty?.hasSetter = true
        }
        return .skipChildren
    }

    override func visit(_ node: InitializerDeclSyntax) -> SyntaxVisitorContinueKind {
        guard let typeInfo = currentTypeInfo else {
            return .skipChildren
        }
        var function = MemberInfo(name: "init")
        function.type = .constructor
        Self.apply(modifiers: node.modifiers, to: &function, defaultVisibility: currentExtensionVisibility)
        Self.apply(signature: node.signature, to: &function)
        typeInfo.members.append(function)
        return .skipChildren
    }

    override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
        guard let typeInfo = currentTypeInfo else {
            return .skipChildren
        }
        var function = MemberInfo(name: node.identifier.text)
        function.type = .function
        Self.apply(modifiers: node.modifiers, to: &function, defaultVisibility: currentExtensionVisibility)
        Self.apply(signature: node.signature, to: &function)
        typeInfo.members.append(function)
        return .skipChildren
    }

    private var currentTypeInfo: TypeInfo? {
        return typeInfoStack.last
    }

    @discardableResult private func pushTypeInfo(name: String, record: Bool = true) -> TypeInfo {
        let baseName = typeInfoStack.last?.qualifiedName
        let qualifiedName = baseName == nil ? name : baseName! + "." + name
        let typeInfo = generator.typeInfos[qualifiedName] ?? TypeInfo(qualifiedName: qualifiedName)
        typeInfoStack.append(typeInfo)
        if record {
            generator.typeInfos[qualifiedName] = typeInfo
        }
        return typeInfo
    }

    private func popTypeInfo() {
        typeInfoStack.removeLast()
    }

    private static func apply(modifiers: ModifierListSyntax?, inheritance: TypeInheritanceClauseSyntax?, to typeInfo: TypeInfo, defaultVisibility: Visibility?, isExtendable: Bool) {
        if let visiblity = visibility(from: modifiers) {
            typeInfo.visibility = visiblity
        } else if let defaultVisibility {
            typeInfo.visibility = defaultVisibility
        }
        if let inheritance {
            for inheritedType in inheritance.inheritedTypeCollection.enumerated() {
                guard let typeName = Self.typeName(from: inheritedType.element.typeName) else {
                    continue
                }
                if typeName == "JXBridging" || typeName == "JXBridge.JXBridging" {
                    typeInfo.hasJXBridging = true
                } else if typeName == "JXModule" || typeName == "JXDynamicModule" || typeName == "JXBridge.JXModule" || typeName == "JXBridge.JXDynamicModule" {
                    typeInfo.hasJXModule = true
                } else if isExtendable && inheritedType.offset == 0 {
                    typeInfo.extends = typeName
                }
            }
        }
    }

    private static func apply(modifiers: ModifierListSyntax?, to memberInfo: inout MemberInfo, defaultVisibility: Visibility?) {
        guard let modifiers else {
            return
        }
        var hasVisibility = false
        for modifier in modifiers {
            let text = modifier.name.text
            switch text {
            case "static":
                if memberInfo.type == .property {
                    memberInfo.type = .staticProperty
                } else if memberInfo.type == .function {
                    memberInfo.type = .staticFunction
                }
            case "class":
                if memberInfo.type == .property {
                    memberInfo.type = .classProperty
                } else if memberInfo.type == .function {
                    memberInfo.type = .classFunction
                }
            case "mutating":
                if memberInfo.type == .function {
                    memberInfo.type = .mutatingFunction
                }
            case "override":
                memberInfo.isOverride = true
            default:
                if let visibility = Visibility(rawValue: text) {
                    hasVisibility = true
                    memberInfo.visibility = visibility
                }
            }
        }
        if !hasVisibility, let defaultVisibility {
            memberInfo.visibility = defaultVisibility
        }
    }

    private static func apply(signature: FunctionSignatureSyntax, to function: inout MemberInfo) {
        if signature.throwsOrRethrowsKeyword != nil {
            function.isThrows = true
        }
        if signature.asyncOrReasyncKeyword != nil {
            function.isAsync = true
        }
        for parameterSyntax in signature.input.parameterList {
            let parameter = ParameterInfo(name: parameterSyntax.firstName?.text ?? "_", hasDefault: parameterSyntax.defaultArgument != nil)
            function.parameters.append(parameter)
        }
    }

    private static func visibility(from modifiers: ModifierListSyntax?) -> Visibility? {
        guard let modifiers else {
            return nil
        }
        for modifier in modifiers {
            if let visibility = Visibility(rawValue: modifier.name.text) {
                return visibility
            }
        }
        return nil
    }

    private static func typeName(from syntax: TypeSyntax) -> String? {
        if let memberIdentifierSyntax = syntax.as(MemberTypeIdentifierSyntax.self) {
            guard let baseTypeName = typeName(from: memberIdentifierSyntax.baseType) else {
                return nil
            }
            return baseTypeName + "." + memberIdentifierSyntax.name.text
        } else if let simpleIdentifierSyntax = syntax.as(SimpleTypeIdentifierSyntax.self) {
            return simpleIdentifierSyntax.name.text
        } else {
            return nil
        }
    }
}
#endif
