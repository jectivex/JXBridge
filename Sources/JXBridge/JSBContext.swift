//
//  JXBContext.swift
//
//  Created by Abe White on 9/15/22.
//

import JXKit
import ScriptBridge

/**
 A context for executing JavaScript.
 */
public class JXBContext {
    public let jxContext: JXContext
    let registry: JXBridgeRegistry
    private var _definedTypeNames: Set<String> = []

    init(jxContext: JXContext, registry: JXBridgeRegistry) throws {
        self.jxContext = jxContext
        self.registry = registry

        try _defineInitialFunctions()
        try jxContext.eval(CodeGenerator.defineInitialFunctions())
    }

    /**
     Run the given JavaScript.
     */
    @discardableResult public func eval(_ script: String) throws -> JXBValue {
        let jxValue = try self.jxContext.eval(script)
        return JXBValue(jxValue: jxValue)
    }

    /**
     Import the given type for use in this context.
     */
    public func `import`(_ type: Any.Type) throws {
        try _defineNativeAccessFunctions()
        let bridge = try self.registry.typeBridge(for: type)
        try _defineClass(for: bridge)
    }

    /**
     Read the JavaScript value for the given global var.
     */
    public func value(for key: String) throws -> JXBValue {
        let jxValue = try self.jxContext.global[key]
        return JXBValue(jxValue: jxValue)
    }

    /**
     Set the JavaScript value for the given global var.
     */
    public func set(_ value: Any?, for key: String) throws {
        let jxValue = try JXBValue(value, in: self.jxContext, registry: self.registry).jxValue
        try self.jxContext.global.setProperty(key, jxValue)
    }

    private func _defineClass(for bridge: JXBridge) throws {
        guard !_definedTypeNames.contains(bridge.typeName) else {
            return
        }
        let superclassBridge = bridge.hasSuperclass(in: self.registry) ? try bridge.superclass(in: self.registry) : nil
        if let superclassBridge {
            try _defineClass(for: superclassBridge)
        }
        let codeGenerator = CodeGenerator(bridge: bridge, superclassBridge: superclassBridge)
        let definition = codeGenerator.defineJSClass()
        try self.eval(definition)
        _definedTypeNames.insert(bridge.typeName)
    }

    private func _defineInitialFunctions() throws {
        let importFunction = JXValue(newFunctionIn: self.jxContext) { [weak self] jxContext, this, args in
            guard let self else {
                // TODO: error
                return jxContext.undefined()
            }
            guard args.count == 1 else {
                // TODO: error
                return jxContext.undefined()
            }
            let typeBridge = try self.registry.typeBridge(for: args[0].stringValue)
            try self._defineNativeAccessFunctions()
            try self._defineClass(for: typeBridge)
            return jxContext.undefined()
        }
        try self.jxContext.global.setProperty(CodeGenerator.importFunctionName, importFunction)
    }

    private func _defineNativeAccessFunctions() throws {
        guard !_hasDefinedNativeAccessFunctions else {
            return
        }
        _hasDefinedNativeAccessFunctions = true

        // Create a native instance box
        let createNativeFunction = JXValue(newFunctionIn: self.jxContext) { [weak self] jxContext, this, args in
            guard let self else {
                // TODO: error
                return jxContext.undefined()
            }
            guard args.count == 2 else {
                // TODO: error
                return jxContext.undefined()
            }
            let instanceBox = try InstanceBox.create(typeName: args[0], arguments: args[1], registry: self.registry)
            let object = jxContext.object(peer: instanceBox)
            return object
        }
        try self.jxContext.global.setProperty(CodeGenerator.createNativeFunctionName, createNativeFunction)

        // Create a native static box
        let createStaticNativeFunction = JXValue(newFunctionIn: self.jxContext) { [weak self] jxContext, this, args in
            guard let self else {
                // TODO: error
                return jxContext.undefined()
            }
            guard args.count == 1 else {
                // TODO: error
                return jxContext.undefined()
            }
            let staticBox = try StaticBox.create(args[0], registry: self.registry)
            let object = jxContext.object(peer: staticBox)
            return object
        }
        try self.jxContext.global.setProperty(CodeGenerator.createStaticNativeFunctionName, createStaticNativeFunction)

        // Get, set, call native properties and methods
        let getPropertyFunction = JXValue(newFunctionIn: self.jxContext) { jxContext, this, args in
            guard args.count == 2, let nativeBox = args[0].peer as? NativeBox else {
                // TODO: error
                return jxContext.undefined()
            }
            return try nativeBox.get(property: args[1])
        }
        try self.jxContext.global.setProperty(CodeGenerator.getPropertyFunctionName, getPropertyFunction)

        let setPropertyFunction = JXValue(newFunctionIn: self.jxContext) { jxContext, this, args in
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                // TODO: error
                return jxContext.undefined()
            }
            try nativeBox.set(property: args[1], value: args[2])
            return jxContext.undefined()
        }
        try self.jxContext.global.setProperty(CodeGenerator.setPropertyFunctionName, setPropertyFunction)

        let callFunction = JXValue(newFunctionIn: self.jxContext) { jxContext, this, args in
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                // TODO: error
                return jxContext.undefined()
            }
            return try nativeBox.call(function: args[1], arguments: args[2])
        }
        try self.jxContext.global.setProperty(CodeGenerator.callFunctionName, callFunction)
    }
    private var _hasDefinedNativeAccessFunctions = false
}
