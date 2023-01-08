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
/// `PROPERTY`, `ASYNC_PROPERTY`: Generate arity code for bridging properties.
///
///     ${VALUE_TYPES}: The generic value type(s). Use this in the member's generics list <...>
///     ${VALUE}: The value. For simple values, this is V
///     ${VALUE_CONVEY}: The value supplied to JXContext.convey(). Assumes the local value name is 'v'
///     ${VALUE_CONVEY_TYPE}: The type to pass to JXValue.convey(to:) for the value
///     ${VALUE_FROMCONVEYED}: The value passed to the setter after being conveyed from the JXValue. Assumes the conveyed value is 'v'
///
/// `FUNCTION`, `ASYNC_FUNCTION`: Generate arity code for bridging functions.
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
///
/// `INIT`: Generate arity code for bridging constructors.
///
///     ${PARAM_TYPES_LIST}: The generic parameter type(s). Use this in the function's generics list <...>
///     ${PARAM_TYPES_DEC}: Declaration of the generic parameter type(s). Use this as the function's generics list <...>
///     ${PARAM_LIST}: The parameters. For simple types, these are P0, P1, ...
///     ${PARAM_LABELED_LIST}: The parameters with labels: p0: P0, p1: P1, ...
///     ${PARAM_LABEL_LIST}: The parameter labels: p0, p1, ...
///     ${PARAM_CONVEY_TYPE_LIST}: The parameter types supplied to JXValue.convey()
///     ${PARAM_COUNT}: The number of paramters
///     ${PARAM_TUPLE_LIST}: Conveyed parameters are returned as a tuple p. A list of the tuple values: p.0, p.1, ...
///     ${PARAM_TUPLE}: Conveyed parameters are returned as a tuple p. This is either p or _ if there are no parameters
///     ${PARAM_COMMA}: Empty string if there are no parameters, otherwise ', '
///
/// `PARAM_SUPPORT`: Generate arity code for general parameter support.
///
///     ${PARAM_TYPES_DEC}: Declaration of the generic parameter type(s). Use this as the function's generics list <...>
///     ${PARAM_LIST}: The parameters. For simple types, these are P0, P1, ...
///     ${PARAM_ARGS_LIST}: Arguments to the function: _ p0: P0.Type, _ p1: P1.Type...
///     ${PARAM_CONVEY_ARGS_LIST}: Code to convey each parameter from the corresponding arg: args[0].convey(to: p0)...
///     ${PARAM_COMMA}: Empty string if there are no parameters, otherwise ', '
///     ${PARAM_TRY}: Empty string if there are no parameters, otherwise 'try '
///
/// `TUPLE_SUPPORT`: Generate arity code for general parameter support.
///
///     ${TUPLE_TYPES_LIST}: Declaration of the generic parameter type(s). Use this in the function's generics list <...>
///     ${TUPLE_LIST}: The tuple types. For simple types, these are T0, T1, ...
///     ${TUPLE_CONVEY_LIST}: Code to convey each tuple: convey(t.0), convey(t.1)...
///     ${TUPLE_CONVEY_ARRAY_LIST}: Code to convey an array JXValue: self[0].convey(to: T0.self)...
///     ${TUPLE_FROMCONVEYED}: Code to convert the tuple conveyed from the array list
///     ${TUPLE_COUNT}: The number of members in the tuple
///
/// `CLOSURE_SUPPORT`: Generate arity code for general closure support.
///
///     ${PARAM_TYPES_LIST}: The generic parameter type(s). Use this in the function's generics list <...>
///     ${PARAM_LIST}: The parameters. For simple types, these are P0, P1, ...
///     ${PARAM_LABEL_LIST}: The parameter labels: p0, p1, ...
///     ${PARAM_CONVEY_TYPE_LIST}: The parameter types supplied to JXValue.convey()
///     ${PARAM_COUNT}: The number of paramters
///     ${PARAM_TUPLE_LIST}: Conveyed parameters are returned as a tuple p. A list of the tuple values: p.0, p.1, ...
///     ${PARAM_TUPLE}: Conveyed parameters are returned as a tuple p. A list of the tuple values: p.0, p.1, ...
///     ${PARAM_COMMA}: Empty string if there are no parameters, otherwise ', '
///     ${RETURN_TYPES}: The generic return type(s). Use this in the member's generics list <...>
///     ${RETURN}: The return value. For simple values, this is R
///     ${RETURN_CONVEY}: The return value supplied to JXContext.convey(). Assumes the local value name is 'r'
///     ${RETURN_CONVEY_TYPE}: The return type supplied to JXValue.convey()
///     ${RETURN_FROMCONVEYED}: The value returned after being conveyed from the JXValue. Assumes the conveyed value is 'r'
class ArityGenerator {
    static let arityCommentStart = "/*ARITY:"
    static let arityCommentEnd = "ARITY*/"
    
    enum Option: String, CaseIterable {
        /// The maximum function arity to generate.
        case maximumFunctionParameters
        /// The maximum arity of the property tuple variants and function return closure variants to generate.
        case maximumTupleArity
        /// Whether to support optional tuples.
        case optionalTuples
        /// Whether to support properties that are tuples.
        case propertyTuples
        /// Whether to support return tuples in functions.
        case returnTuples
        /// Whether to support return tuples in functions with trailing closures.
        case returnTuplesWhenTrailingClosures
        /// The maximum `JXTuple` arity to generate.
        case maximumJXTupleArity
        /// The maximum number of parameters of the property closure variants and function trailing closure variants to generate.
        case maximumClosureParameters
        /// The maximum number of parameters of the property throwing closure and function trailing throwing closure variants to generate.
        case maximumThrowingClosureParameters
        /// Whether to support optional closures.
        case optionalClosures
        /// Whether to support properties that are closures.
        case propertyClosures
        /// Whether to support trailing closures in functions.
        case trailingClosures
        /// Whether to generate property closures and function trailing closure parameters for async vars and functions.
        case asyncMemberClosures
        /// The maximum `JXClosure` parameter arity to generate.
        case maximumJXClosureParameters
        /// Whether to only generate arities beyond the set of defaults.
        case beyondDefaults
        
        var `default`: Int {
            switch self {
            case .maximumFunctionParameters: return 6
            case .maximumTupleArity: return 2
            case .propertyTuples: return 0
            case .returnTuples: return 1
            case .returnTuplesWhenTrailingClosures: return 0
            case .maximumJXTupleArity: return 6
            case .optionalTuples: return 0
            case .maximumClosureParameters: return 1
            case .maximumThrowingClosureParameters: return -1
            case .optionalClosures: return 1
            case .propertyClosures: return 0
            case .trailingClosures: return 1
            case .asyncMemberClosures: return 0
            case .maximumJXClosureParameters: return 6
            case .beyondDefaults: return 0
            }
        }
        
        func value(in options: [Option: Int]) -> Int {
            return options[self] ?? self.default
        }
    }
    
    private enum Member: Int, CaseIterable {
        // List in desired output order
        case property
        case asyncProperty
        case constructor
        case function
        case asyncFunction
        case parameterSupport
        case tupleSupport
        case closureSupport
        
        var string: String {
            // Make sure one member string isn't a prefix of another
            switch self {
            case .property:
                return "PROPERTY"
            case .asyncProperty:
                return "ASYNC_PROPERTY"
            case .constructor:
                return "INIT"
            case .function:
                return "FUNCTION"
            case .asyncFunction:
                return "ASYNC_FUNCTION"
            case .parameterSupport:
                return "PARAM_SUPPORT"
            case .tupleSupport:
                return "TUPLE_SUPPORT"
            case .closureSupport:
                return "CLOSURE_SUPPORT"
            }
        }
    }
    
    private let input: String
    private let options: [Option: Int]
    private var inputs: [Member: [String]] = [:]
    private var outputs: [Member: [String]] = [:]
    
    /// Construct the generator.
    ///
    /// - Parameters:
    ///   - input: The content of the source file.
    ///   - options: Any options overrides.
    init?(input: String, options: [Option: Int] = [:]) throws {
        self.input = input
        self.options = options
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
            outputs[.property] = generateArity(propertyInputs) {
                propertyAritySubstitutions(options: $0, closureSupport: true)
            }
        }
        if let asyncPropertyInputs = inputs[.asyncProperty] {
            let closureSupport = Option.asyncMemberClosures.value(in: options) > 0
            outputs[.asyncProperty] = generateArity(asyncPropertyInputs) {
                propertyAritySubstitutions(options: $0, closureSupport: closureSupport)
            }
        }
        if let constructorInputs = inputs[.constructor] {
            outputs[.constructor] = generateArity(constructorInputs) {
                functionAritySubstitutions(options: $0, tupleSupport: false, closureSupport: true)
            }
        }
        if let functionInputs = inputs[.function] {
            outputs[.function] = generateArity(functionInputs) {
                functionAritySubstitutions(options: $0, tupleSupport: true, closureSupport: true)
            }
        }
        if let asyncFunctionInputs = inputs[.asyncFunction] {
            let closureSupport = Option.asyncMemberClosures.value(in: options) > 0
            outputs[.asyncFunction] = generateArity(asyncFunctionInputs) {
                functionAritySubstitutions(options: $0, tupleSupport: true, closureSupport: closureSupport)
            }
        }
        if let parameterSupportInputs = inputs[.parameterSupport] {
            outputs[.parameterSupport] = generateArity(parameterSupportInputs) {
                parameterSupportAritySubstitutions(options: $0)
            }
        }
        if let tupleSupportInputs = inputs[.tupleSupport] {
            outputs[.tupleSupport] = generateArity(tupleSupportInputs) {
                tupleSupportAritySubstitutions(options: $0)
            }
        }
        if let closureSupportInputs = inputs[.closureSupport] {
            outputs[.closureSupport] = generateArity(closureSupportInputs) {
                closureSupportAritySubstitutions(options: $0)
            }
        }
        return output()
    }
    
    private func output() -> String {
        let sortedMembers = outputs.keys.sorted { $0.rawValue < $1.rawValue }
        var output = ""
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
    
    private func generateArity(_ arityInputs: [String], substitutions: ([Option: Int]) -> [[String: String]]) -> [String] {
        var subs = substitutions(options)
        if Option.beyondDefaults.value(in: options) > 0 {
            // If we only want to generate output beyond what the defaults generate, we:
            // 1. Generate all outputs for the current options
            // 2. Generate outputs for the default options
            // 3. Dedupe
            let defaultOptions = Option.allCases.reduce(into: [Option: Int]()) { result, option in
                result[option] = option.default
            }
            let defaultSubs = substitutions(defaultOptions)
            subs = Self.removeSubstitutions(defaultSubs, from: subs)
        }
        var arityOutputs: [String] = []
        for arityInput in arityInputs {
            arityOutputs += subs.map { Self.applySubstitutions($0, to: arityInput) }
        }
        return arityOutputs
    }
    
    private func propertyAritySubstitutions(options: [Option: Int], closureSupport: Bool) -> [[String: String]] {
        let tupleArity = Option.maximumTupleArity.value(in: options)
        let includeTuples = tupleArity >= 2 && Option.propertyTuples.value(in: options) > 0
        let optionalTuples = includeTuples && Option.optionalTuples.value(in: options) > 0
        let closureArity = Option.maximumClosureParameters.value(in: options)
        let includeClosures = closureSupport && closureArity >= 0 && Option.propertyClosures.value(in: options) > 0
        let optionalClosures = includeClosures && Option.optionalClosures.value(in: options) > 0
        
        var subs: [[String: String]] = []
        subs.append(Self.propertySubstitution())
        if includeTuples {
            for t in 2...tupleArity {
                subs.append(Self.propertySubstitution(tupleInfo: TupleInfo(arity: t)))
                if optionalTuples {
                    subs.append(Self.propertySubstitution(tupleInfo: TupleInfo(arity: t, optional: true)))
                }
            }
        }
        if includeClosures {
            for cp in 0...closureArity {
                subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp)))
                if optionalClosures {
                    subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, optional: true)))
                }
                if cp <= Option.maximumThrowingClosureParameters.value(in: options) {
                    subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, throwing: true)))
                    if optionalClosures {
                        subs.append(Self.propertySubstitution(closureInfo: ClosureInfo(arity: cp, throwing: true, optional: true)))
                    }
                }
            }
        }
        return subs
    }
    
    private func functionAritySubstitutions(options: [Option: Int], tupleSupport: Bool, closureSupport: Bool) -> [[String: String]] {
        let tupleArity = Option.maximumTupleArity.value(in: options)
        let includeTuples = tupleArity >= 2 && tupleSupport && Option.returnTuples.value(in: options) > 0
        let optionalTuples = includeTuples && Option.optionalTuples.value(in: options) > 0
        let includeTuplesWhenClosures = includeTuples && Option.returnTuplesWhenTrailingClosures.value(in: options) > 0
        let closureArity = Option.maximumClosureParameters.value(in: options)
        let includeClosures = closureSupport && closureArity >= 0 && Option.trailingClosures.value(in: options) > 0
        let optionalClosures = includeClosures && Option.optionalClosures.value(in: options) > 0
        
        var subs: [[String: String]] = []
        for p in 0...Option.maximumFunctionParameters.value(in: options) {
            subs.append(Self.functionSubstitution(arity: p))
            if includeTuples {
                for t in 2...tupleArity {
                    subs.append(Self.functionSubstitution(arity: p, tupleInfo: TupleInfo(arity: t)))
                    if optionalTuples {
                        subs.append(Self.functionSubstitution(arity: p, tupleInfo: TupleInfo(arity: t, optional: true)))
                    }
                }
            }
            if includeClosures && p > 0 {
                // We ignore tupleArity < 2, so this loop's first iteration will be without tuples
                let closureTupleArity = includeTuplesWhenClosures ? tupleArity : 1
                for t in 1...closureTupleArity {
                    for ot in 0...(optionalTuples && t >= 2 ? 1 : 0) {
                        let tupleInfo = t >= 2 ? TupleInfo(arity: t, optional: ot > 0) : nil
                        for cp in 0...closureArity {
                            subs.append(Self.functionSubstitution(arity: p, tupleInfo: tupleInfo, closureInfo: ClosureInfo(arity: cp)))
                            if optionalClosures {
                                subs.append(Self.functionSubstitution(arity: p, tupleInfo: tupleInfo, closureInfo: ClosureInfo(arity: cp, optional: true)))
                            }
                            if cp <= Option.maximumThrowingClosureParameters.value(in: options) {
                                subs.append(Self.functionSubstitution(arity: p, tupleInfo: tupleInfo, closureInfo: ClosureInfo(arity: cp, throwing: true)))
                                if optionalClosures {
                                    subs.append(Self.functionSubstitution(arity: p, tupleInfo: tupleInfo, closureInfo: ClosureInfo(arity: cp, throwing: true, optional: true)))
                                }
                            }
                        }
                    }
                }
            }
        }
        return subs
    }
    
    private func parameterSupportAritySubstitutions(options: [Option: Int]) -> [[String: String]] {
        return (0...max(Option.maximumFunctionParameters.value(in: options), Option.maximumJXClosureParameters.value(in: options))).map {
            Self.parameterSupportSubstitution(arity: $0)
        }
    }
    
    private func tupleSupportAritySubstitutions(options: [Option: Int]) -> [[String: String]] {
        return (2...Option.maximumJXTupleArity.value(in: options)).map {
            Self.tupleSupportSubstitution(arity: $0)
        }
    }
    
    private func closureSupportAritySubstitutions(options: [Option: Int]) -> [[String: String]] {
        return (0...Option.maximumJXClosureParameters.value(in: options)).map {
            Self.closureSupportSubstitution(arity: $0)
        }
    }
    
    private static func applySubstitutions(_ subs: [String: String], to input: String) -> String {
        var subbed = input
        for entry in subs {
            subbed = subbed.replacingOccurrences(of: entry.key, with: entry.value)
        }
        return subbed
    }
    
    private static func removeSubstitutions(_ rmsubs: [[String: String]], from subs: [[String: String]]) -> [[String: String]] {
        // Maintain order for consistent output
        let rmSet = Set(rmsubs)
        var deduped: [[String: String]] = []
        for sub in subs {
            if !rmSet.contains(sub) {
                deduped.append(sub)
            }
        }
        return deduped
    }
    
    private static func propertySubstitution(tupleInfo: TupleInfo? = nil, closureInfo: ClosureInfo? = nil) -> [String: String] {
        if let tupleInfo {
            return [
                "${VALUE_TYPES}": parameterList(mode: .type, arity: tupleInfo.arity, base: "U"),
                "${VALUE}": tupleInfo.type,
                "${VALUE_CONVEY}": tupleInfo.convey("v"),
                "${VALUE_CONVEY_TYPE}": tupleInfo.conveyType,
                "${VALUE_FROMCONVEYED}": tupleInfo.fromConveyed("v")
            ]
        }
        if let closureInfo {
            return [
                "${VALUE_TYPES}": parameterList(mode: .type, arity: closureInfo.arity, base: "C", includeReturn: true),
                "${VALUE}": closureInfo.type,
                "${VALUE_CONVEY}": closureInfo.convey("v"),
                "${VALUE_CONVEY_TYPE}": closureInfo.conveyType,
                "${VALUE_FROMCONVEYED}": closureInfo.fromConveyed("v")
            ]
        }
        return [
            "${VALUE_TYPES}": "V",
            "${VALUE}": "V",
            "${VALUE_CONVEY}": "v",
            "${VALUE_CONVEY_TYPE}": "V.self",
            "${VALUE_FROMCONVEYED}": "v"
        ]
    }
    
    private static func functionSubstitution(arity: Int, tupleInfo: TupleInfo? = nil, closureInfo: ClosureInfo? = nil) -> [String: String] {
        let returnTypes: String
        let returnString: String
        let returnConvey: String
        if let tupleInfo {
            returnTypes = parameterList(mode: .type, arity: tupleInfo.arity, base: "U")
            returnString = tupleInfo.type
            returnConvey = tupleInfo.convey("r")
        } else {
            returnTypes = "R"
            returnString = "R"
            returnConvey = "r"
        }
        guard let closureInfo else {
            return [
                "${PARAM_TYPES_LIST}": parameterList(mode: .type, arity: arity),
                "${PARAM_TYPES_DEC}": arity > 0 ? "<\(parameterList(mode: .type, arity: arity))>" : "",
                "${PARAM_LIST}": parameterList(mode: .type, arity: arity),
                "${PARAM_LABELED_LIST}": parameterList(mode: .labeled, arity: arity),
                "${PARAM_LABEL_LIST}": parameterList(mode: .label, arity: arity),
                "${PARAM_CONVEY_TYPE_LIST}": parameterList(mode: .conveyType, arity: arity),
                "${PARAM_COUNT}": "\(arity)",
                "${PARAM_TUPLE_LIST}": parameterList(mode: .tuple, arity: arity),
                "${PARAM_TUPLE}": arity > 0 ? "p" : "_",
                "${PARAM_COMMA}": arity > 0 ? ", " : "",
                "${RETURN_TYPES}": returnTypes,
                "${RETURN}": returnString,
                "${RETURN_CONVEY}": returnConvey
            ]
        }
        let closureComma = (arity > 1) ? ", " : ""
        let paramTypesList = "\(parameterList(mode: .type, arity: arity, trimLast: true))\(closureComma)\(parameterList(mode: .type, arity: closureInfo.arity, base: "C", includeReturn: true))"
        return [
            "${PARAM_TYPES_LIST}": paramTypesList,
            "${PARAM_TYPES_DEC}": "<\(paramTypesList)>",
            "${PARAM_LIST}": "\(parameterList(mode: .type, arity: arity, trimLast: true))\(closureComma)\(closureInfo.type)",
            "${PARAM_LABELED_LIST}": "\(parameterList(mode: .labeled, arity: arity, trimLast: true))\(closureComma)p\(arity - 1): \(closureInfo.type)",
            "${PARAM_LABEL_LIST}": parameterList(mode: .label, arity: arity),
            "${PARAM_CONVEY_TYPE_LIST}": "\(parameterList(mode: .conveyType, arity: arity, trimLast: true))\(closureComma)\(closureInfo.conveyType)",
            "${PARAM_COUNT}": "\(arity)",
            "${PARAM_TUPLE_LIST}": "\(parameterList(mode: .tuple, arity: arity, trimLast: true))\(closureComma)\(closureInfo.fromConveyed("p", tupleArity: arity - 1))",
            "${PARAM_TUPLE}": arity > 0 ? "p" : "_",
            "${PARAM_COMMA}": arity > 0 ? ", " : "",
            "${RETURN_TYPES}": returnTypes,
            "${RETURN}": returnString,
            "${RETURN_CONVEY}": returnConvey
        ]
    }
    
    private static func parameterSupportSubstitution(arity: Int) -> [String: String] {
        return [
            "${PARAM_TYPES_DEC}": arity > 0 ? "<\(parameterList(mode: .type, arity: arity))>" : "",
            "${PARAM_LIST}": parameterList(mode: .type, arity: arity),
            "${PARAM_ARGS_LIST}": parameterList(mode: .args, arity: arity),
            "${PARAM_CONVEY_ARGS_LIST}": parameterList(mode: .argsConvey, arity: arity),
            "${PARAM_COMMA}": arity > 0 ? ", " : "",
            "${PARAM_TRY}": arity > 0 ? "try " : ""
        ]
    }
    
    private static func tupleSupportSubstitution(arity: Int) -> [String: String] {
        return [
            "${TUPLE_TYPES_LIST}": parameterList(mode: .type, arity: arity, base: "T"),
            "${TUPLE_LIST}": parameterList(mode: .type, arity: arity, base: "T"),
            "${TUPLE_CONVEY_LIST}": parameterList(mode: .tupleConvey, arity: arity, base: "T"),
            "${TUPLE_CONVEY_ARRAY_LIST}": parameterList(mode: .arrayConvey, arity: arity, base: "T"),
            "${TUPLE_FROMCONVEYED}": "t",
            "${TUPLE_COUNT}": "\(arity)"
        ]
    }
    
    private static func closureSupportSubstitution(arity: Int) -> [String: String] {
        return [
            "${PARAM_TYPES_LIST}": parameterList(mode: .type, arity: arity),
            "${PARAM_LIST}": parameterList(mode: .type, arity: arity),
            "${PARAM_LABEL_LIST}": parameterList(mode: .label, arity: arity),
            "${PARAM_CONVEY_TYPE_LIST}": parameterList(mode: .conveyType, arity: arity),
            "${PARAM_COUNT}": "\(arity)",
            "${PARAM_TUPLE_LIST}": parameterList(mode: .tuple, arity: arity),
            "${PARAM_TUPLE}": arity > 0 ? "p" : "_",
            "${PARAM_COMMA}": arity > 0 ? ", " : "",
            "${RETURN_TYPES}": "R",
            "${RETURN}": "R",
            "${RETURN_CONVEY}": "r",
            "${RETURN_CONVEY_TYPE}": "R.self",
            "${RETURN_FROMCONVEYED}": "r"
        ]
    }
    
    struct TupleInfo {
        var arity: Int
        var optional = false
        
        var type: String {
            let typeList = parameterList(mode: .type, arity: arity, base: "U")
            return optional ? "(\(typeList))?" : "(\(typeList))"
        }
        
        var conveyType: String {
            let typeList = parameterList(mode: .type, arity: arity, base: "U")
            let type = "JXTuple.Arity\(arity)<\(typeList)>"
            return optional ? "Optional<\(type)>.self" : "\(type).self"
        }
        
        func convey(_ name: String) -> String {
            return "JXTuple.Arity\(arity)(\(name))"
        }
        
        func fromConveyed(_ name: String) -> String {
            if optional {
                return "\(name)?.tuple"
            } else {
                return "\(name).tuple"
            }
        }
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
        
        func convey(_ name: String) -> String {
            let type: String
            if throwing {
                type = "JXClosure.Throwing\(arity)"
            } else {
                type = "JXClosure.Arity\(arity)"
            }
            return "\(type)(\(name))"
        }
        
        func fromConveyed(_ name: String, tupleArity: Int = 0) -> String {
            let p: String
            if tupleArity <= 0 {
                p = name
            } else {
                p = "\(name).\(tupleArity)"
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
        case args
        case argsConvey
        case arrayConvey
        case tupleConvey
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
            case .args:
                string.append("_ \(base.lowercased())\(i): \(base)\(i).Type")
            case .argsConvey:
                string.append("args[\(i)].convey(to: \(base.lowercased())\(i))")
            case .arrayConvey:
                string.append("self[\(i)].convey(to: \(base)\(i).self)")
            case .tupleConvey:
                string.append("convey(\(base.lowercased()).\(i))")
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
