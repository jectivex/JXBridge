#if canImport(Foundation)

import Foundation

/// Tool to generate all our arity variations for bridging Swift members.
///
/// This tool looks for comments of the form:
///
///     /*ARITY:<MEMBER> ... ARITY*/
///
/// Where `MEMBER` is one of the bridged member types below. The content within the comment is extracted and duplicated for all supported arities.
/// The content should use the placeholders described below.
///
/// `PROPERTY`, `ASYNC_PROPERTY`:
///
///     ${VALUE_TYPES}: The generic value type(s). Use this in the member's generics list <...>
///     ${VALUE}: The value. For simple values, this is V
///     ${VALUE_CONVEY}: The value supplied to JXContext.convey(). Assumes the local value name is 'v'
///     ${VALUE_CONVEY_TYPE}: The type to pass to JXValue.convey(to:) for the value
///     ${VALUE_FROMCONVEYED}: The value passed to the setter after being conveyed from the JXValue. Assumes the conveyed value is 'v'
class ArityGenerator {
    static let arityCommentStart = "/*ARITY:"
    static let arityCommentEnd = "ARITY*/"
    
    enum Member: Int, CaseIterable {
        // List in desired output order
        case property
        case asyncProperty
        
        var string: String {
            // Make sure one member string isn't a prefix of another
            switch self {
            case .property:
                return "PROPERTY"
            case .asyncProperty:
                return "ASYNC_PROPERTY"
            }
        }
    }
    
    /// The maximum function arity to generate. Deafults to 8.
    var maximumFunctionParameters = 8
    
    /// The maximum number of parameters of the trailing closure variants to generate. Defaults to 2.
    var maximumClosureParameters = 2
    
    /// The maximum number of parameters of the trailing throwing closure variants to generate. Defaults to -1 to disable throwing closure support.
    var maximumThrowingClosureParameters = 0 //~~~
    
    /// Whether to generate trailing closure parameter support for async vars and functions. Defaults to false.
    var asyncMembersSupportClosures = false
    
    private let source: String
    private let input: String
    private var inputs: [Member: [String]] = [:]
    private var outputs: [Member: [String]] = [:]
    
    /// Construct the generator.
    ///
    /// - Parameters:
    ///   - source: The name of the source file.
    ///   - input: The content of the source file.
    init?(source: String, input: String) throws {
        self.source = source
        self.input = input
        for member in Member.allCases {
            let memberInputs = try inputs(for: member)
            if !memberInputs.isEmpty {
                inputs[member] = memberInputs
            }
        }
        if inputs.isEmpty {
            return nil
        }
    }
    
    /// Return the output containing the generated arity variants, for writing to a source file.
    func generate() throws -> String {
        if let propertyInputs = inputs[.property] {
            outputs[.property] = generateArity(propertyInputs, substitutions: propertyAritySubstitutions(closureSupport: true))
        }
        if let asyncPropertyInputs = inputs[.asyncProperty] {
            outputs[.asyncProperty] = generateArity(asyncPropertyInputs, substitutions: propertyAritySubstitutions(closureSupport: asyncMembersSupportClosures))
        }
        return output()
    }
    
    private func output() -> String {
        var output = "// THIS FILE IS AUTO GENERATED FROM \(source). DO NOT EDIT\n"
        output.append("//\n//\t\tswift package plugin generate-arity \(source)\n")
        output.append("\nimport JXKit\n")
        let sortedMembers = outputs.keys.sorted { $0.rawValue < $1.rawValue }
        for member in sortedMembers {
            output.append("\n// \(member.string)\n")
            output.append(outputs[member]!.joined(separator: "\n"))
        }
        return output
    }
    
    private func inputs(for member: Member) throws -> [String] {
        var inputs: [String] = []
        var range = input.startIndex..<input.endIndex
        while true {
            let startMarker = Self.arityCommentStart + member.string
            guard let markerRange = input.range(of: startMarker, range: range) else {
                break
            }
            guard let endRange = input.range(of: Self.arityCommentEnd, range: markerRange.upperBound..<input.endIndex) else {
                throw ArityGeneratorError.unterminatedComment(startMarker: startMarker)
            }
            
            let memberRange = markerRange.upperBound..<endRange.lowerBound
            inputs.append(String(input[memberRange]))
            range = endRange.upperBound..<input.endIndex
        }
        return inputs
    }
    
    private func generateArity(_ arityInputs: [String], substitutions: [[String: String]]) -> [String] {
        var arityOutputs: [String] = []
        for arityInput in arityInputs {
            arityOutputs += substitutions.map { Self.applySubstitutions($0, to: arityInput) }
        }
        return arityOutputs
    }
    
    private func propertyAritySubstitutions(closureSupport: Bool) -> [[String: String]] {
        var subs: [[String: String]] = []
        subs.append([
            "${VALUE_TYPES}": "V",
            "${VALUE}": "V",
            "${VALUE_CONVEY}": "v",
            "${VALUE_CONVEY_TYPE}": "V.self",
            "${VALUE_FROMCONVEYED}": "v"
        ])
        if closureSupport {
            for i in 0...maximumClosureParameters {
                let parameterTypesWithReturn = Self.parameterTypes(i, base: "C", includeReturn: true)
                let parameterTypes = Self.parameterTypes(i, base: "C")
                subs.append([
                    "${VALUE_TYPES}": parameterTypesWithReturn,
                    "${VALUE}": "((\(parameterTypes)) -> CR)",
                    "${VALUE_CONVEY}": "JXClosure.Arity\(i)(v)",
                    "${VALUE_CONVEY_TYPE}": "JXClosure.Arity\(i)<\(parameterTypesWithReturn)>.self",
                    "${VALUE_FROMCONVEYED}": "v.closure"
                ])
                if i <= maximumThrowingClosureParameters {
                    subs.append([
                        "${VALUE_TYPES}": parameterTypesWithReturn,
                        "${VALUE}": "((\(parameterTypes)) throws -> CR)",
                        "${VALUE_CONVEY}": "JXClosure.Throwing\(i)(v)",
                        "${VALUE_CONVEY_TYPE}": "JXClosure.Throwing\(i)<\(parameterTypesWithReturn)>.self",
                        "${VALUE_FROMCONVEYED}": "v.closure"
                    ])
                }
            }
        }
        return subs
    }
    
    private static func parameterTypes(_ arity: Int, base: String = "P", includeReturn: Bool = false) -> String {
        var string = ""
        for i in 0..<arity {
            string.append("\(base)\(i)")
            if includeReturn || i < (arity - 1) {
                string.append(", ")
            }
        }
        if includeReturn {
            if base != "P" {
                string.append(base)
            }
            string.append("R")
        }
        return string
    }
    
    private static func applySubstitutions(_ subs: [String: String], to input: String) -> String {
        var subbed = input
        for entry in subs {
            subbed = subbed.replacingOccurrences(of: entry.key, with: entry.value)
        }
        return subbed
    }
}

extension ArityGeneratorError {
    static func unterminatedComment(startMarker: String) -> ArityGeneratorError {
        return ArityGeneratorError(message: "Unterminated arity comment starting with '\(startMarker)'")
    }
}

#endif
