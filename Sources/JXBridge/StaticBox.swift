//
//  StaticBox.swift
//
//  Created by Abe White on 7/31/22.
//

import JXKit
import ScriptBridge

class StaticBox: NativeBox {
    static func create(_ typeName: JXValue, registry: JXBridgeRegistry) throws -> StaticBox {
        let bridge = try registry.typeBridge(for: typeName.stringValue)
        return StaticBox(bridge: bridge, registry: registry)
    }
    
    init(bridge: JXBridge, registry: JXBridgeRegistry) {
        self.bridge = bridge
        self.registry = registry
    }

    let bridge: JXBridge
    let registry: JXBridgeRegistry

    func get(property: JXValue) throws -> JXValue {
        let ret: Any?
        let propertyName = try property.stringValue
        if self.bridge.hasClassProperty(for: propertyName, superclassRegistry: self.registry) {
            let propertyBridge = try self.bridge.classProperty(for: propertyName, superclassRegistry: self.registry)
            ret = try propertyBridge.get(for: self.bridge.type, registry: self.registry)
        } else {
            let propertyBridge = try self.bridge.staticProperty(for: propertyName, superclassRegistry: self.registry)
            ret = try propertyBridge.get(registry: self.registry)
        }
        return try Self.processReturn(ret, in: property.env, registry: self.registry)
    }

    func set(property: JXValue, value: JXValue) throws {
        let propertyName = try property.stringValue
        if self.bridge.hasClassProperty(for: propertyName, superclassRegistry: self.registry) {
            let propertyBridge = try self.bridge.classProperty(for: propertyName, superclassRegistry: self.registry)
            let _ = try propertyBridge.set(for: self.bridge.type, value: Self.processArgument(value), registry: self.registry)
        } else {
            let propertyBridge = try self.bridge.staticProperty(for: propertyName, superclassRegistry: self.registry)
            try propertyBridge.set(value: Self.processArgument(value), registry: self.registry)
        }
    }

    func call(function: JXValue, arguments args: JXValue) throws -> JXValue {
        let ret: Any?
        let functionName = try function.stringValue
        if self.bridge.hasClassFunction(for: functionName, superclassRegistry: self.registry) {
            let functionBridge = try self.bridge.classFunction(for: functionName, superclassRegistry: self.registry)
            let (_, result) = try functionBridge.call(for: self.bridge.type, with: Self.processArguments(args), registry: self.registry)
            ret = result
        } else {
            let functionBridge = try self.bridge.staticFunction(for: functionName, superclassRegistry: self.registry)
            ret = try functionBridge.call(with: Self.processArguments(args), registry: self.registry)
        }
        return try Self.processReturn(ret, in: function.env, registry: self.registry)
    }
}
