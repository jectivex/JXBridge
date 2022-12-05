#if canImport(Foundation)

import Foundation

let arityCommentStart = "/*ARITY:"
let arityCommentEnd = "ARITY*/"
let propertyMarker = "PROPERTY"

/// Tool to generate all our arity variations for bridging Swift members.
struct ArityGenerator {
    private let input: String
    private var propertyInputs: [String] = []
    
    init?(input: String) throws {
        self.input = input
        propertyInputs += try arityInputs(for: propertyMarker)
        if propertyInputs.isEmpty {
            return nil
        }
    }
    
    func generate() throws -> String {
        return propertyInputs.joined(separator: "\n")
    }
    
    private func arityInputs(for marker: String) throws -> [String] {
        var arityInputs: [String] = []
        var range = input.startIndex..<input.endIndex
        while true {
            let startMarker = arityCommentStart + marker
            guard let markerRange = input.range(of: startMarker, range: range) else {
                break
            }
            guard let endRange = input.range(of: arityCommentEnd, range: markerRange.upperBound..<input.endIndex) else {
                throw ArityGeneratorError.unterminatedComment(startMarker: startMarker)
            }
            
            let arityRange = markerRange.upperBound..<endRange.lowerBound
            arityInputs.append(String(input[arityRange]))
            range = endRange.upperBound..<input.endIndex
        }
        return arityInputs
    }
}

extension ArityGeneratorError {
    static func unterminatedComment(startMarker: String) -> ArityGeneratorError {
        return ArityGeneratorError(message: "Unterminated arity comment starting with '\(startMarker)'")
    }
}

#endif
