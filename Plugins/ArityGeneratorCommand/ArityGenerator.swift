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
        case function
        case asyncFunction
        
        var string: String {
            // Make sure one member string isn't a prefix of another
            switch self {
            case .property:
                return "PROPERTY"
            case .asyncProperty:
                return "ASYNC_PROPERTY"
            case .function:
                return "FUNCTION"
            case .asyncFunction:
                return "ASYNC_FUNCTION"
            }
        }
    }
    
    /// The maximum function arity to generate. Deafults to 8.
    var maximumFunctionParameters = 8
    
    /// The maximum number of parameters of the property closure variants and function trailing closure variants to generate. Defaults to 2.
    var maximumClosureParameters = 2
    
    /// The maximum number of parameters of the property throwing closure and function trailing throwing closure variants to generate. Defaults to -1 to disable throwing closure support.
    var maximumThrowingClosureParameters = 0 //~~~
    
    /// Whether to support optional closures. Defaults to true.
    var optionalClosures = true
    
    /// Whether to generate property closures and function trailing closure parameters for async vars and functions. Defaults to false.
    var asyncMemberClosures = false
    
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
            outputs[.asyncProperty] = generateArity(asyncPropertyInputs, substitutions: propertyAritySubstitutions(closureSupport: asyncMemberClosures))
        }
        if let functionInputs = inputs[.function] {
            outputs[.function] = generateArity(functionInputs, substitutions: functionAritySubstitutions(closureSupport: true))
        }
        if let asyncFunctionInputs = inputs[.asyncFunction] {
            outputs[.asyncFunction] = generateArity(asyncFunctionInputs, substitutions: functionAritySubstitutions(closureSupport: asyncMemberClosures))
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
            for cp in 0...maximumClosureParameters {
                let closureTypesWithReturn = Self.parameterList(mode: .type, arity: cp, base: "C", includeReturn: true)
                let closureTypes = Self.parameterList(mode: .type, arity: cp, base: "C")
                subs.append([
                    "${VALUE_TYPES}": closureTypesWithReturn,
                    "${VALUE}": "((\(closureTypes)) -> CR)",
                    "${VALUE_CONVEY}": "JXClosure.Arity\(cp)(v)",
                    "${VALUE_CONVEY_TYPE}": "JXClosure.Arity\(cp)<\(closureTypesWithReturn)>.self",
                    "${VALUE_FROMCONVEYED}": "v.closure"
                ])
                if optionalClosures {
                    subs.append([
                        "${VALUE_TYPES}": closureTypesWithReturn,
                        "${VALUE}": "((\(closureTypes)) -> CR)?",
                        "${VALUE_CONVEY}": "v == nil ? nil : JXClosure.Arity\(cp)(v!)",
                        "${VALUE_CONVEY_TYPE}": "Optional<JXClosure.Arity\(cp)<\(closureTypesWithReturn)>>.self",
                        "${VALUE_FROMCONVEYED}": "v?.closure"
                    ])
                }
                if cp <= maximumThrowingClosureParameters {
                    subs.append([
                        "${VALUE_TYPES}": closureTypesWithReturn,
                        "${VALUE}": "((\(closureTypes)) throws -> CR)",
                        "${VALUE_CONVEY}": "JXClosure.Throwing\(cp)(v)",
                        "${VALUE_CONVEY_TYPE}": "JXClosure.Throwing\(cp)<\(closureTypesWithReturn)>.self",
                        "${VALUE_FROMCONVEYED}": "v.closure"
                    ])
                    if optionalClosures {
                        subs.append([
                            "${VALUE_TYPES}": closureTypesWithReturn,
                            "${VALUE}": "((\(closureTypes)) throws -> CR)?",
                            "${VALUE_CONVEY}": "v == nil ? nil : JXClosure.Throwing\(cp)(v!)",
                            "${VALUE_CONVEY_TYPE}": "Optional<JXClosure.Throwing\(cp)<\(closureTypesWithReturn)>>.self",
                            "${VALUE_FROMCONVEYED}": "v?.closure"
                        ])
                    }
                }
            }
        }
        return subs
    }
    
    private func functionAritySubstitutions(closureSupport: Bool) -> [[String: String]] {
        var subs: [[String: String]] = []
        for p in 0...maximumFunctionParameters {
            subs.append([
                "${PARAM_TYPES_LIST}": Self.parameterList(mode: .type, arity: p),
                "${PARAM_LIST}": Self.parameterList(mode: .type, arity: p),
                "${PARAM_LABELED_LIST}": Self.parameterList(mode: .labeled, arity: p),
                "${PARAM_LABEL_LIST}": Self.parameterList(mode: .label, arity: p),
                "${PARAM_CONVEY_TYPE_LIST}": Self.parameterList(mode: .conveyType, arity: p),
                "${PARAM_COUNT}": "\(p)",
                "${PARAM_TUPLE_LIST}": Self.parameterList(mode: .tuple, arity: p),
                "${PARAM_TUPLE}": p > 0 ? "p" : "_",
                "${PARAM_COMMA}": p > 0 ? ", " : "",
                "${RETURN_TYPES}": "R",
                "${RETURN}": "R",
                "${RETURN_CONVEY}": "r"
            ])
            /*
            if closureSupport && p > 0 {
                let closureComma = (p > 1) ? ", " : ""
                for cp in 0...maximumClosureParameters {
                    let closureTypesWithReturn = Self.parameterTypes(cp, base: "C", includeReturn: true)
                    let closureTypes = Self.parameterTypes(cp, base: "C")
                    subs.append([
                        "${PARAM_TYPES_LIST}": Self.parameterTypes(p - 1) + closureComma + closureTypesWithReturn,
                        "${PARAM_LIST}": Self.parameterTypes(p),
                        "${PARAM_LABELED_LIST}": Self.parameterTypes(p),
                        "${PARAM_LABEL_LIST}": Self.parameterTypes(p),
                        "${PARAM_CONVEY_TYPE_LIST}": Self.parameterTypes(p),
                        "${PARAM_TUPLE_LIST}": Self.parameterTypes(p),
                        "${PARAM_TUPLE}": p > 0 ? "p" : "_",
                        "${PARAM_COMMA}": p > 0 ? ", " : "",
                        "${RETURN_TYPES}": "R",
                        "${RETURN}": "R",
                        "${RETURN_CONVEY}": "r"
                    ])
                    
                    
                    let parameterTypesWithReturn = Self.parameterTypes(cp, base: "C", includeReturn: true)
                    let parameterTypes = Self.parameterTypes(cp, base: "C")
                    subs.append([
                        "${VALUE_TYPES}": parameterTypesWithReturn,
                        "${VALUE}": "((\(parameterTypes)) -> CR)",
                        "${VALUE_CONVEY}": "JXClosure.Arity\(cp)(v)",
                        "${VALUE_CONVEY_TYPE}": "JXClosure.Arity\(cp)<\(parameterTypesWithReturn)>.self",
                        "${VALUE_FROMCONVEYED}": "v.closure"
                    ])
                    if optionalClosures {
                        subs.append([
                            "${VALUE_TYPES}": parameterTypesWithReturn,
                            "${VALUE}": "((\(parameterTypes)) -> CR)?",
                            "${VALUE_CONVEY}": "v == nil ? nil : JXClosure.Arity\(cp)(v!)",
                            "${VALUE_CONVEY_TYPE}": "Optional<JXClosure.Arity\(cp)<\(parameterTypesWithReturn)>>.self",
                            "${VALUE_FROMCONVEYED}": "v?.closure"
                        ])
                    }
                    if cp <= maximumThrowingClosureParameters {
                        subs.append([
                            "${VALUE_TYPES}": parameterTypesWithReturn,
                            "${VALUE}": "((\(parameterTypes)) throws -> CR)",
                            "${VALUE_CONVEY}": "JXClosure.Throwing\(cp)(v)",
                            "${VALUE_CONVEY_TYPE}": "JXClosure.Throwing\(cp)<\(parameterTypesWithReturn)>.self",
                            "${VALUE_FROMCONVEYED}": "v.closure"
                        ])
                        if optionalClosures {
                            subs.append([
                                "${VALUE_TYPES}": parameterTypesWithReturn,
                                "${VALUE}": "((\(parameterTypes)) throws -> CR)?",
                                "${VALUE_CONVEY}": "v == nil ? nil : JXClosure.Throwing\(cp)(v!)",
                                "${VALUE_CONVEY_TYPE}": "Optional<JXClosure.Throwing\(cp)<\(parameterTypesWithReturn)>>.self",
                                "${VALUE_FROMCONVEYED}": "v?.closure"
                            ])
                        }
                    }
                }
            }
             */
        }
        return subs
    }
    
    enum ParameterListMode {
        case type
        case conveyType
        case labeled
        case label
        case tuple
    }
    
    private static func parameterList(mode: ParameterListMode, arity: Int, base: String = "P", includeReturn: Bool = false) -> String {
        var string = ""
        for i in 0..<arity {
            switch mode {
            case .type:
                string.append("\(base)\(i)")
            case .conveyType:
                string.append("\(base)\(i).self")
            case .labeled:
                string.append("\(base.lowercased())\(i): \(base)\(i)")
            case .label:
                string.append("\(base.lowercased())\(i)")
            case .tuple:
                if arity > 1 {
                    string.append("\(base.lowercased()).\(i)")
                } else {
                    string.append(base.lowercased())
                }
            }
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
