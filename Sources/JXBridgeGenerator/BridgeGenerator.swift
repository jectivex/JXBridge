import Foundation
#if os(macOS) || os(Linux)
import SwiftParser
import SwiftSyntax

// TODO: Default constructor, conflicts in funcs overloaded by type, generics, customization by comments, customization in builder, emit warnings and errors

@main
public class BridgeGenerator {
    /// Expected arguments:
    ///
    ///     - Executable
    ///     - Target name
    ///     - Output file
    ///     - [Input files] or ["-d", Input directory]
    static func main() throws {
        let arguments = CommandLine.arguments
        guard arguments.count > 3 else {
            return
        }
        let target = arguments[1]
        let outputFile = arguments[2]

        let inputFiles: [String]
        if arguments[3] == "-d" {
            guard arguments.count > 4 else {
                return
            }
            inputFiles = try findInputFiles(in: arguments[4])
        } else {
            inputFiles = Array(arguments[3...])
        }

        let generator = BridgeGenerator(target: target)
        let output = try generator.process(files: inputFiles)
        try output.write(toFile: outputFile, atomically: true, encoding: .utf8)
    }

    private static func findInputFiles(in directory: String) throws -> [String] {
        let directoryURL = URL(fileURLWithPath: directory, isDirectory: true)
        guard let directoryEnumerator = FileManager.default.enumerator(at: directoryURL, includingPropertiesForKeys: [.isDirectoryKey], options: [.skipsHiddenFiles]) else {
            return []
        }
        var sourceFiles: [String] = []
        for case let fileURL as URL in directoryEnumerator {
            guard fileURL.pathExtension == "swift", let resourceValues = try? fileURL.resourceValues(forKeys: [.isDirectoryKey]), resourceValues.isDirectory != true else {
                continue
            }
            sourceFiles.append(fileURL.path)
        }
        return sourceFiles
    }

    let target: String
    var typeInfos: [String: TypeInfo] = [:]

    init(target: String) {
        self.target = target
    }

    func process(files: [String]) throws -> String {
        for file in files {
            print("Processing file \(file.split(separator: "/").last!)...")
            let start = CFAbsoluteTimeGetCurrent()
            let source = try String(contentsOfFile: file)
            let endSource = CFAbsoluteTimeGetCurrent()
            let syntax = Parser.parse(source: source)
            let endParse = CFAbsoluteTimeGetCurrent()
            let visitor = Visitor(generator: self)
            visitor.walk(syntax)
            let end = CFAbsoluteTimeGetCurrent()
            print("\(end - start)s total, \(endParse - endSource)s parse, \(end - endParse)s process")
        }
        let code = generate()
        print(code) //~~~
        return code
    }

    private func generate() -> String {
        let bridgingTypeInfoCode = typeInfos.values
            .sorted { $0.qualifiedName < $1.qualifiedName }
            .compactMap { generate(for: $0) }
        return """
// THIS FILE IS AUTO-GENERATED
import JXBridge

\(bridgingTypeInfoCode.joined(separator: "\n"))
"""
    }

    private func generate(for typeInfo: TypeInfo) -> String? {
        guard typeInfo.isBridging && !typeInfo.hasDefaultBridge && typeInfo.type != .unknown else {
            return nil
        }

        // When an ObjC runtime is available the JXBridge can figure out its own superclass via obj_getSuperclass.
        // We attempt to set the superclass explicitly for other environments, but we can only do so when we know
        // the superclass is in the same module. Otherwise we'd cause a compilation error for lack of proper import,
        // or if we tried to copy all imports from all the module files, we might have a name conflict
        var superclassDeclaration = ""
        let prefix = "\n            "
        if let extends = knownSuperclass(for: typeInfo) {
            superclassDeclaration = "\(prefix).superclass(\(extends).self)"
        }
        let memberDeclarations = typeInfo.members
            .sorted { t1, t2 in
                guard t1.type.rawValue != t2.type.rawValue else {
                    return t1.name < t2.name
                }
                return t1.type.rawValue < t2.type.rawValue
            }
            .flatMap { Self.generate(for: $0, in: typeInfo, prefix: prefix) }
            .joined()
        //~~~ static? class?
        return """
extension \(typeInfo.qualifiedName) {
    \(typeInfo.visibility) static func jxDefaultBridge() -> JXBridge {
        return JXBridgeBuilder(type: \(typeInfo.qualifiedName).self, namespace: jxNamespace)\(superclassDeclaration)\(memberDeclarations)
            .bridge
    }
}
"""
    }

    private func knownSuperclass(for typeInfo: TypeInfo) -> String? {
        guard let extends = typeInfo.extends else {
            return nil
        }
        if typeInfos.keys.contains(extends) {
            return extends
        }
        // If given name isn't known, try qualified name with the same path as the type
        guard let lastPathIndex = typeInfo.qualifiedName.lastIndex(of: ".") else {
            return nil
        }
        let qualifiedExtends = typeInfo.qualifiedName[..<lastPathIndex] + "." + extends
        return typeInfos.keys.contains(qualifiedExtends) ? qualifiedExtends : nil
    }

    private static func generate(for memberInfo: MemberInfo, in typeInfo: TypeInfo, prefix: String) -> [String] {
        guard memberInfo.isVisible(in: typeInfo) else {
            return []
        }

        switch memberInfo.type {
        case .constructor:
            return generateVariants(for: memberInfo).map { function in
                "\(prefix).constructor { \(generateFunctionCall(for: function, name: typeInfo.qualifiedName, startParameter: 0)) }"
            }
        case .property:
            return ["\(prefix).var.\(memberInfo.name) \(generatePropertyAccess(for: memberInfo, on: "$0", valueParameter: 1, isInstance: true))"]
        case .function:
            return generateVariants(for: memberInfo).map { function in
                "\(prefix).func.\(function.name) \(generateFunctionCall(for: function, name: "$0.\(function.name)", startParameter: 1))"
            }
        case .mutatingFunction:
            return generateVariants(for: memberInfo).map { function in
                "\(prefix).mutating.func.\(function.name) \(generateFunctionCall(for: function, name: "$0.\(function.name)", startParameter: 1))"
            }
        case .classProperty:
            return ["\(prefix).class.var.\(memberInfo.name) \(generatePropertyAccess(for: memberInfo, on: "$0", valueParameter: 1))"]
        case .classFunction:
            return generateVariants(for: memberInfo).map { function in
                "\(prefix).class.func.\(function.name) \(generateFunctionCall(for: function, name: "$0.\(function.name)", startParameter: 1))"
            }
        case .staticProperty:
            return ["\(prefix).static.var.\(memberInfo.name) \(generatePropertyAccess(for: memberInfo, on: typeInfo.qualifiedName, valueParameter: 0))"]
        case .staticFunction:
            return generateVariants(for: memberInfo).map { function in
                "\(prefix).static.func.\(function.name) \(generateFunctionCall(for: function, name: "\(typeInfo.qualifiedName).\(function.name)", startParameter: 0))"
            }
        }
    }

    private static func generatePropertyAccess(for property: MemberInfo, on target: String, valueParameter: Int, isInstance: Bool = false) -> String {
        guard !isInstance || property.isAsync || property.isThrows else {
            // Instance properties that are not async or throwing case use key paths
            return "{ \\.\(property.name) }"
        }

        let accessPrefix = generateAccessPrefix(for: property)
        let getter = "{ \(accessPrefix)\(target).\(property.name) }"
        guard property.hasSetter || !property.hasGetter else {
            // get-only
            return getter
        }
        return "\(getter) set: { \(target).\(property.name) = $\(valueParameter) }"
    }

    private static func generateVariants(for function: MemberInfo) -> [MemberInfo] {
        // For functions with parameters that have default values, create two variations: one with
        // all parameters required, and one that allows only the parameters without default values.
        // Trying to support all permutations would likely result in multiple methods with the same
        // name and parameter count, which we can't support (until we have a named parameters option)
        let parametersWithoutDefaults = function.parameters.filter { !$0.hasDefault }
        guard parametersWithoutDefaults.count != function.parameters.count else {
            return [function]
        }
        var variant = function
        variant.parameters = parametersWithoutDefaults
        return [function, variant]
    }

    private static func generateFunctionCall(for function: MemberInfo, name: String, startParameter: Int) -> String {
        let accessPrefix = generateAccessPrefix(for: function)
        let argumentList = generateArgumentList(for: function, startParameter: startParameter)
        return "{ \(accessPrefix)\(name)(\(argumentList)) }"
    }

    private static func generateArgumentList(for function: MemberInfo, startParameter: Int) -> String {
        return function.parameters.enumerated().map {
            let value = "$\($0.offset + startParameter)"
            return $0.element.name == "_" ? value : "\($0.element.name): \(value)"
        }.joined(separator: ", ")
    }

    private static func generateAccessPrefix(for memberInfo: MemberInfo) -> String {
        var prefix = ""
        if memberInfo.isThrows {
            prefix += "try "
        }
        if memberInfo.isAsync {
            prefix += "await "
        }
        return prefix
    }
}

private class Visitor: SyntaxVisitor {
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
            currentProperty?.name = node.identifier.text
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
                if typeName == "JXMarkerBridging" || typeName == "JXBridge.JXMarkerBridging" {
                    typeInfo.isBridging = true
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

#else

@main
public class BridgeGenerator {
    static func main() throws {
        throw BridgeGeneratorError(message: "Unsupported platform")
    }
}
#endif
