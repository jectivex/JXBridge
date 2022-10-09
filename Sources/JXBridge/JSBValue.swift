//
//  JXBValue.swift
//
//  Created by Abe White on 9/29/22.
//

import Foundation
import ScriptBridge
import JXKit

/**
 A JavaScript value.
 */
public struct JXBValue {
    public let jxValue: JXValue

    init(jxValue: JXValue) {
        self.jxValue = jxValue
    }

    init(_ value: Any?, in context: JXContext, registry: JXBridgeRegistry) throws {
        self.jxValue = try Self._jxValue(for: value, in: context, registry: registry)
    }

    private static func _jxValue(for value: Any?, in context: JXContext, registry: JXBridgeRegistry) throws -> JXValue {
        guard let value else {
            return context.null()
        }
        if let jxValue = value as? JXValue {
            return jxValue
        }
        // TODO: Reconcile all my type conversion code
        if let bool = value as? Bool {
            return context.boolean(bool)
        }
        if let string = value as? String {
            return context.string(string)
        }
        if let int = value as? Int {
            return context.number(Double(int))
        }
        if let double = value as? Double {
            return context.number(double)
        }
        if let int64 = value as? Int64 {
            return context.number(Double(int64))
        }
        if let float = value as? Float {
            return context.number(Double(float))
        }
        if let date = value as? Date {
            return try context.date(date)
        }
        let valueType = type(of: value)
        if registry.hasJXBridge(for: valueType) {
            let typeBridge = try registry.typeBridge(for: valueType)
            // Construct with a special argument to avoid creating a new native
            // instance on construction, then inject our value instance
            let obj = try context.eval("new \(typeBridge.typeName)('\(CodeGenerator.nativePropertyName)')")
            let instanceBox = InstanceBox(value, bridge: typeBridge, registry: registry)
            let nativeBox = context.object(peer: instanceBox)
            try obj.setProperty(CodeGenerator.nativePropertyName, nativeBox)
            return obj
        }
        if let array = value as? [Any?] {
            return try context.array(array.map { try _jxValue(for: $0, in: context, registry: registry) })
        }
        if let dict = value as? [String: Any?] {
            let object = context.object()
            for entry in dict {
                try object.setProperty(entry.key, _jxValue(for: entry.value, in: context, registry: registry))
            }
        }
        throw JXBridgeErrors.cannotConvertToScript("", "", value)
    }

    public var isNull: Bool {
        return self.jxValue.isNull
    }

    public var isUndefined: Bool {
        return self.jxValue.isUndefined
    }

    // TODO: Add remaining base types
    public var int: Int {
        get throws {
            let double = try self.jxValue.numberValue
            return Int(double)
        }
    }

    public var string: String {
        get throws {
            return try self.jxValue.stringValue
        }
    }

    public var value: Any? {
        get throws {
            return try Self._value(of: self.jxValue)
        }
    }

    private static func _value(of jxValue: JXValue) throws -> Any? {
        if jxValue.isNull || jxValue.isUndefined {
            return nil
        }
        guard let type = jxValue.type else {
            return nil // TODO
        }
        switch type {
        case .boolean:
            return jxValue.booleanValue
        case .number:
            return try jxValue.numberValue
        case .date:
            return try jxValue.dateValue
        case .buffer:
            return nil // TODO
        case .string:
            return try jxValue.stringValue
        case .array:
            return try jxValue.array.map { try _value(of: $0) }
        case .object:
            let nativeProperty = try jxValue[CodeGenerator.nativePropertyName]
            if let instanceBox = nativeProperty.peer as? InstanceBox {
                return instanceBox.instance
            }
            // Treat as dictionary
            return try jxValue.properties.reduce(into: [String: Any?]()) { result, property in
                result[property] = try _value(of: try jxValue[property])
            }
        case .symbol:
            return nil // TODO
        }
    }
}
