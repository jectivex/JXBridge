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
///
/// `FUNCTION`, `ASYNC_FUNCTION`:
///
///     ${PARAM_TYPES_LIST}: The generic parameter type(s). Use this in the function's generics list <...>
///     ${PARAM_LIST}: The parameters. For simple types, these are P0, P1, ...
///     ${PARAM_LABELED_LIST}: The parameters with labels: p0: P0, p1: P1, ...
///     ${PARAM_LABEL_LIST}: The parameter labels: p0, p1, ...
///     ${PARAM_CONVEY_TYPE_LIST}: The parameter types supplied to JXValue.convey()
///     ${PARAM_COUNT}: The number of paramters
///     ${PARAM_TUPLE_LIST}: Conveyed parameters are returned as a tuple p. A list of the tuple values: p.0, p.1, ...
///     ${PARAM_TUPLE}: Conveyed parameters are returned as a tuple p. This is either p or _ if there are no parameters
///     ${PARAM_COMMA}: Empty string if there are no parameters, otherwise ', '
///     ${RETURN_TYPES}: The generic return type(s). Use this in the member's generics list <...>
///     ${RETURN}: The return value. For simple values, this is R
///     ${RETURN_CONVEY}: The return value supplied to JXContext.convey(). Assumes the local value name is 'r'
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
        subs.append(Self.propertySubstitution())
        if closureSupport {
            for cp in 0...maximumClosureParameters {
                subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp)))
                if optionalClosures {
                    subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, optional: true)))
                }
                if cp <= maximumThrowingClosureParameters {
                    subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, throwing: true)))
                    if optionalClosures {
                        subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, throwing: true, optional: true)))
                    }
                }
            }
        }
        return subs
    }
    
    private func functionAritySubstitutions(closureSupport: Bool) -> [[String: String]] {
        var subs: [[String: String]] = []
        for p in 0...maximumFunctionParameters {
            subs.append(Self.functionSubstitution(arity: p))
            if closureSupport && p > 0 {
                for cp in 0...maximumClosureParameters {
                    subs.append(Self.functionSubstitution(arity: p, closureInfo: ClosureInfo(arity: cp)))
                    if optionalClosures {
                        subs.append(Self.functionSubstitution(arity: p, closureInfo: ClosureInfo(arity: cp, optional: true)))
                    }
                    if cp <= maximumThrowingClosureParameters {
                        subs.append(Self.functionSubstitution(arity: p, closureInfo: ClosureInfo(arity: cp, throwing: true)))
                        if optionalClosures {
                            subs.append(Self.functionSubstitution(arity: p, closureInfo: ClosureInfo(arity: cp, throwing: true, optional: true)))
                        }
                    }
                }
            }
        }
        return subs
    }
    
    private static func applySubstitutions(_ subs: [String: String], to input: String) -> String {
        var subbed = input
        for entry in subs {
            subbed = subbed.replacingOccurrences(of: entry.key, with: entry.value)
        }
        return subbed
    }
    
    private static func propertySubstitution(closureInfo: ClosureInfo? = nil) -> [String: String] {
        guard let closureInfo else {
            return [
                "${VALUE_TYPES}": "V",
                "${VALUE}": "V",
                "${VALUE_CONVEY}": "v",
                "${VALUE_CONVEY_TYPE}": "V.self",
                "${VALUE_FROMCONVEYED}": "v"
            ]
        }
        return [
            "${VALUE_TYPES}": parameterList(mode: .type, arity: closureInfo.arity, base: "C", includeReturn: true),
            "${VALUE}": closureInfo.type,
            "${VALUE_CONVEY}": closureInfo.convey("v"),
            "${VALUE_CONVEY_TYPE}": closureInfo.conveyType,
            "${VALUE_FROMCONVEYED}": closureInfo.fromConveyed("v")
        ]
    }
    
    private static func functionSubstitution(arity: Int, closureInfo: ClosureInfo? = nil) -> [String: String] {
        guard let closureInfo else {
            return [
                "${PARAM_TYPES_LIST}": parameterList(mode: .type, arity: arity),
                "${PARAM_LIST}": parameterList(mode: .type, arity: arity),
                "${PARAM_LABELED_LIST}": parameterList(mode: .labeled, arity: arity),
                "${PARAM_LABEL_LIST}": parameterList(mode: .label, arity: arity),
                "${PARAM_CONVEY_TYPE_LIST}": parameterList(mode: .conveyType, arity: arity),
                "${PARAM_COUNT}": "\(arity)",
                "${PARAM_TUPLE_LIST}": parameterList(mode: .tuple, arity: arity),
                "${PARAM_TUPLE}": arity > 0 ? "p" : "_",
                "${PARAM_COMMA}": arity > 0 ? ", " : "",
                "${RETURN_TYPES}": "R",
                "${RETURN}": "R",
                "${RETURN_CONVEY}": "r"
            ]
        }
        let closureComma = (arity > 1) ? ", " : ""
        return [
            "${PARAM_TYPES_LIST}": "\(parameterList(mode: .type, arity: arity, trimLast: true))\(closureComma)\(parameterList(mode: .type, arity: closureInfo.arity, base: "C", includeReturn: true))",
            "${PARAM_LIST}": "\(parameterList(mode: .type, arity: arity, trimLast: true))\(closureComma)\(closureInfo.type)",
            "${PARAM_LABELED_LIST}": "\(parameterList(mode: .labeled, arity: arity, trimLast: true))\(closureComma)p\(arity - 1): \(closureInfo.type)",
            "${PARAM_LABEL_LIST}": parameterList(mode: .label, arity: arity),
            "${PARAM_CONVEY_TYPE_LIST}": "\(parameterList(mode: .conveyType, arity: arity, trimLast: true))\(closureComma)\(closureInfo.conveyType)",
            "${PARAM_COUNT}": "\(arity)",
            "${PARAM_TUPLE_LIST}": "\(parameterList(mode: .tuple, arity: arity, trimLast: true))\(closureComma)\(closureInfo.fromConveyed("p", tupleArity: arity))",
            "${PARAM_TUPLE}": arity > 0 ? "p" : "_",
            "${PARAM_COMMA}": arity > 0 ? ", " : "",
            "${RETURN_TYPES}": "R",
            "${RETURN}": "R",
            "${RETURN_CONVEY}": "r"
        ]
    }
    
    struct ClosureInfo {
        var arity: Int
        var throwing = false
        var optional = false
        
        var type: String {
            let closureTypes = parameterList(mode: .type, arity: arity, base: "C")
            var type: String
            if throwing {
                type = "((\(closureTypes)) throws -> CR)"
            } else {
                type = "((\(closureTypes)) -> CR)"
            }
            if optional {
                type += "?"
            }
            return type
        }
        
        var conveyType: String {
            let closureTypesWithReturn = parameterList(mode: .type, arity: arity, base: "C", includeReturn: true)
            var type: String
            if throwing {
                type = "JXClosure.Throwing\(arity)<\(closureTypesWithReturn)>"
            } else {
                type = "JXClosure.Arity\(arity)<\(closureTypesWithReturn)>"
            }
            if optional {
                type = "Optional<\(type)>.self"
            } else {
                type = "\(type).self"
            }
            return type
        }
        
        func convey(_ name: String, tupleArity: Int = 0) -> String {
            let p: String
            if tupleArity <= 0 {
                p = name
            } else {
                p = "\(name).\(tupleArity)"
            }
            let type: String
            if throwing {
                type = "JXClosure.Throwing\(arity)"
            } else {
                type = "JXClosure.Arity\(arity)"
            }
            return "\(type)(\(p))"
        }
        
        func fromConveyed(_ name: String, tupleArity: Int = 0) -> String {
            let p: String
            if tupleArity <= 1 {
                p = name
            } else {
                p = "\(name).\(tupleArity - 1)"
            }
            if optional {
                return "\(p)?.closure"
            } else {
                return "\(p).closure"
            }
        }
    }
    
    enum ParameterListMode {
        case type
        case conveyType
        case labeled
        case label
        case tuple
    }
    
    private static func parameterList(mode: ParameterListMode, arity: Int, base: String = "P", trimLast: Bool = false, includeReturn: Bool = false) -> String {
        let toArity = trimLast ? arity - 1 : arity
        var string = ""
        for i in 0..<toArity {
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
            if includeReturn || i < (toArity - 1) {
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
}

extension ArityGeneratorError {
    static func unterminatedComment(startMarker: String) -> ArityGeneratorError {
        return ArityGeneratorError(message: "Unterminated arity comment starting with '\(startMarker)'")
    }
}

#endif
