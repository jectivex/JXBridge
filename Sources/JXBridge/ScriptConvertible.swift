//
//  ScriptConvertible.swift
//
//  Created by Abe White on 8/25/22.
//

import Foundation

/**
 Convert this type to/from simple script values.
 */
public protocol ScriptConvertible {
    /**
     Convert the given script value to an instance of this type, returning nil
     if no conversion is possible.
     */
    static func fromScript(_ value: Any) -> Any?

    /**
     Convert this instance to its script value, returning nil if no conversion
     is possible.
     */
    var toScript: Any? { get }
}

#if canImport(ObjectiveC)

/**
 Convert ObjectiveC types to/from simple script values.
 */
@objc public protocol JXScriptConvertible: NSObjectProtocol {
    /**
     Convert the given script value to an instance of this type, returning nil
     if no conversion is possible.
     */
    @objc static func fromScript(_ value: Any) -> Any?

    /**
     Convert this instance to its script value, returning nil if no conversion
     is possible.
     */
    @objc var toScript: Any? { get }
}

#endif

extension Decodable {
    static func sb_fromScript(_ value: Any) throws -> Any {
        let data = try PropertyListSerialization.data(fromPropertyList: value, format: .binary, options: 0)
        let decoder = PropertyListDecoder()
        var format = PropertyListSerialization.PropertyListFormat.binary
        return try decoder.decode(self, from: data, format: &format)
    }
}

extension Encodable {
    var sb_toScript: Any {
        get throws {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .binary
            let data = try encoder.encode(self)
            return try PropertyListSerialization.propertyList(from: data, format: nil)
        }
    }
}
