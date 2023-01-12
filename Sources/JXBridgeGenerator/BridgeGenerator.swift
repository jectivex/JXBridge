import Foundation
#if os(macOS) || os(Linux)
import SwiftParser
import SwiftSyntax

// TODO: Generics, customization by comments

/// Generate default bridge builders by analyzing Swift source.
///
///     swift package plugin generate-bridges -o <output file> <-d <input dir> | file>+
@main public class BridgeGenerator {
    static func main() throws {
        let arguments = CommandLine.arguments
        guard !arguments.isEmpty else {
            print(usage())
            return
        }
        try run(Array(arguments[1...]))
    }

    /// Run the bridge generator on the given arguments.
    public static func run(_ arguments: [String]) throws {
        guard let (files, outputFile) = try processArguments(arguments) else {
            print(usage())
            return
        }
        let generator = BridgeGenerator()
        let output = try generator.process(files: files)
        print("Writing output to \(outputFile)...")
        try output.write(toFile: outputFile, atomically: true, encoding: .utf8)
    }

    private static func usage() -> String {
        return "swift package plugin generate-bridges -o <output file> <-d <input dir> | file>+"
    }

    private static func processArguments(_ arguments: [String]) throws -> (files: [String], outputFile: String)? {
        var files: [String] = []
        var directories: [String] = []
        var outputFile: String?
        var skipValue = false
        for i in 0..<arguments.count {
            guard !skipValue else {
                skipValue = false
                continue
            }
            if arguments[i] == "-o" && i < (arguments.count - 1) {
                outputFile = arguments[i + 1]
                skipValue = true
            } else if arguments[i] == "-d" && i < (arguments.count - 1) {
                directories.append(arguments[i + 1])
                skipValue = true
            } else {
                files.append(arguments[i])
            }
        }
        guard let outputFile else {
            return nil
        }
        for directory in directories {
            files += try findInputFiles(in: directory)
        }
        return (files, outputFile)
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

    var typeInfos: [String: TypeInfo] = [:]

    private func process(files: [String]) throws -> String {
        for file in files {
            print("Processing file \(file.split(separator: "/").last!)...")
            let start = CFAbsoluteTimeGetCurrent()
            let source = try String(contentsOfFile: file)
            let endSource = CFAbsoluteTimeGetCurrent()
            let syntax = Parser.parse(source: source)
            let endParse = CFAbsoluteTimeGetCurrent()
            let visitor = SwiftVisitor(generator: self)
            visitor.walk(syntax)
            let end = CFAbsoluteTimeGetCurrent()
            print("\(end - start)s total, \(endParse - endSource)s parse, \(end - endParse)s process")
        }
        print("Generating bridging code...")
        let code = generate()
        //print(code)
        return code
    }

    private func generate() -> String {
        let bridgingTypeInfoCode = typeInfos.values
            .sorted { $0.qualifiedName < $1.qualifiedName }
            .compactMap { generate(for: $0) }
        return """
// THIS FILE IS AUTO-GENERATED
import JXBridge

\(bridgingTypeInfoCode.joined(separator: "\n\n"))
"""
    }

    private func generate(for typeInfo: TypeInfo) -> String? {
        guard !typeInfo.hasBridgeBuilder && typeInfo.type != .unknown else {
            return nil
        }

        let prefix = "\n        builder"
        var superclassDeclaration = ""
        var functionType = typeInfo.type == .class ? "class" : "static"
        if let superclassSpecifier = superclassSpecifier(for: typeInfo) {
            superclassDeclaration = "\(prefix).superclass(\(superclassSpecifier))"
            functionType = "override class"
        }

        // If this type does not explicitly declare JXBridging conformance and does not have a known
        // JXBridging superclass, we can skip it
        guard typeInfo.hasJXBridging || !superclassDeclaration.isEmpty else {
            return nil
        }

        let memberDeclarations = Self.fixupMembers(of: typeInfo)
            .sorted { t1, t2 in
                guard t1.type.rawValue != t2.type.rawValue else {
                    return t1.name < t2.name
                }
                return t1.type.rawValue < t2.type.rawValue
            }
            .flatMap { Self.generate(for: $0, in: typeInfo, prefix: prefix) }
            .joined()
        return """
extension \(typeInfo.qualifiedName) {
    \(typeInfo.visibility) \(functionType) func jxBridgeBuilder() -> JXBridgeBuilder<\(typeInfo.qualifiedName)> {
        let builder = JXBridgeBuilder(type: \(typeInfo.qualifiedName).self, namespace: jxNamespace)\(superclassDeclaration)\(memberDeclarations)
        return builder
    }
}
"""
    }

    private func superclassSpecifier(for typeInfo: TypeInfo) -> String? {
        if typeInfo.hasJXSuperclass {
            return "jxSuperclass"
        }
        guard let extends = typeInfo.extends else {
            return nil
        }
        if typeInfos.keys.contains(extends) {
            return "\(extends).self"
        }
        // If given name isn't known, try qualified names up to the nesting of this type
        let typePath = typeInfo.qualifiedName.split(separator: ".").dropLast()
        for i in 0..<typePath.count {
            let qualifiedExtends = typePath[0...i].joined(separator: ".") + "." + extends
            if typeInfos.keys.contains(qualifiedExtends) {
                return "\(qualifiedExtends).self"
            }
        }
        return nil
    }

    private static func fixupMembers(of typeInfo: TypeInfo) -> [MemberInfo] {
        var fixupMembers: [MemberInfo] = []
        var functionInfoKeyIndexes: [FunctionInfoKey: Int] = [:]
        var functionConflictIndexes: IndexSet = []
        var hasConstructor = false

        // When we detect functions that have the same name and parameter count, warn the user,
        // exclude the duplicate, and mark the original for removal to avoid generating ambiguous code
        let fixupFunction: (MemberInfo, FunctionInfoKey) -> Void = { function, key in
            if let conflictIndex = functionInfoKeyIndexes[key] {
                functionConflictIndexes.insert(conflictIndex)
                warnOverloadedFunction(function, in: typeInfo)
            } else {
                functionInfoKeyIndexes[key] = fixupMembers.count
                fixupMembers.append(function)
            }
        }

        for memberInfo in typeInfo.members {
            // We exclude overrides because we might not know enough about the base implementation.
            // For example, this might be an override of one version of a function that is overloaded
            // such that we would generate ambiguous code
            guard !memberInfo.isOverride else {
                continue
            }
            guard !memberInfo.isJXProtocolMember(in: typeInfo) else {
                continue
            }
            switch memberInfo.type {
            case .defaultConstructor:
                fallthrough
            case .constructor:
                hasConstructor = true
                let key = FunctionInfoKey(name: "init", parameterCount: memberInfo.parameters.count, isInstance: false)
                fixupFunction(memberInfo, key)
            case .property:
                fixupMembers.append(memberInfo)
            case .function:
                fallthrough
            case .mutatingFunction:
                let key = FunctionInfoKey(name: memberInfo.name, parameterCount: memberInfo.parameters.count, isInstance: true)
                fixupFunction(memberInfo, key)
            case .classProperty:
                fallthrough
            case .staticProperty:
                fixupMembers.append(memberInfo)
            case .classFunction:
                fallthrough
            case .staticFunction:
                let key = FunctionInfoKey(name: memberInfo.name, parameterCount: memberInfo.parameters.count, isInstance: false)
                fixupFunction(memberInfo, key)
            }
        }
        if !hasConstructor {
            fixupMembers.append(MemberInfo(name: "init", type: .defaultConstructor, visibility: typeInfo.visibility))
        }
        return fixupMembers.enumerated().compactMap { item in
            return functionConflictIndexes.contains(item.offset) ? nil : item.element
        }
    }

    private struct FunctionInfoKey: Hashable {
        let name: String
        let parameterCount: Int
        let isInstance: Bool
    }

    private static func generate(for memberInfo: MemberInfo, in typeInfo: TypeInfo, prefix: String) -> [String] {
        guard memberInfo.isVisible(in: typeInfo) else {
            return []
        }

        switch memberInfo.type {
        case .defaultConstructor:
            return ["\(prefix).constructor { \(typeInfo.qualifiedName).init }"]
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

    private static func warnOverloadedFunction(_ function: MemberInfo, in typeInfo: TypeInfo) {
        print("warning: \(typeInfo.qualifiedName).\(function.name) will not be bridged because it has multiple conflicting implementations. Functions must have different names or parameter counts")
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
