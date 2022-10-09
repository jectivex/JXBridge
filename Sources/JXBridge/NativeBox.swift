//
//  NativeBox.swift
//
//  Created by Abe White on 10/4/22.
//

import JXKit
import ScriptBridge

/// Access native properties and methods from JXKit.
protocol NativeBox {
    func get(property: JXValue) throws -> JXValue
    func set(property: JXValue, value: JXValue) throws
    func call(function: JXValue, arguments: JXValue) throws -> JXValue
}

extension NativeBox {
    /// Convert JavaScript values to native ones, including object references.
    static func processArguments(_ args: JXValue) throws -> [Any?] {
        return try args.array.map { try self.processArgument($0) }
    }

    /// Convert JavaScript values to native ones, including object references.
    static func processArgument(_ arg: JXValue) throws -> Any? {
        return try JXBValue(jxValue: arg).value
    }

    /// Convert native values to JavaScript ones, including object references.
    static func processReturn(_ ret: Any?, in context: JXContext, registry: JXBridgeRegistry) throws -> JXValue {
        return try JXBValue(ret, in: context, registry: registry).jxValue
    }
}


