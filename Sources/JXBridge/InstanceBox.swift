//
//  InstanceBox.swift
//
//  Created by Abe White on 8/7/22.
//

import JXKit
import ScriptBridge

class InstanceBox: NativeBox {
    static func create(typeName: JXValue, arguments args: JXValue, registry: JXBridgeRegistry) throws -> InstanceBox {
        let bridge = try registry.typeBridge(for: typeName.stringValue)
        let nativeArgs = try Self.processArguments(args)
        let constructor = try bridge.constructor(forParameterCount: nativeArgs.count, superclassRegistry: registry)
        let instance = try constructor.call(nativeArgs, registry: registry)
        return InstanceBox(instance, bridge: bridge, registry: registry)
    }

    init(_ instance: Any, bridge: JXBridge, registry: JXBridgeRegistry) {
        self.instance = instance
        self.bridge = bridge
        self.registry = registry
    }

    var instance: Any
    let bridge: JXBridge
    let registry: JXBridgeRegistry

    func get(property: JXValue) throws -> JXValue {
        let propertyBridge = try self.bridge.property(for: property.stringValue, superclassRegistry: self.registry)
        let ret = try propertyBridge.get(for: self.instance, registry: self.registry)
        return try Self.processReturn(ret, in: property.env, registry: self.registry)
    }

    func set(property: JXValue, value: JXValue) throws {
        let propertyBridge = try self.bridge.property(for: property.stringValue, superclassRegistry: self.registry)
        self.instance = try propertyBridge.set(for: self.instance, value: Self.processArgument(value), registry: self.registry)
    }

    func call(function: JXValue, arguments args: JXValue) throws -> JXValue {
        let functionBridge = try self.bridge.function(for: function.stringValue, superclassRegistry: self.registry)
        let (instance, ret) = try functionBridge.call(for: self.instance, with: Self.processArguments(args), registry: self.registry)
        self.instance = instance
        return try Self.processReturn(ret, in: function.env, registry: self.registry)
    }
}
