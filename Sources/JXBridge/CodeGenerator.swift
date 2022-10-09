//
//  CodeGenerator.swift
//
//  Created by Abe White on 8/20/22.
//

import ScriptBridge

/**
 Generate JavaScript code.
 */
struct CodeGenerator {
    static let importFunctionName = "_jsbImport"
    static let createNativeFunctionName = "_jsbCreateNative"
    static let createStaticNativeFunctionName = "_jsbCreateStaticNative"
    static let nativePropertyName = "_jsbNative"
    static let getPropertyFunctionName = "_jsbGet"
    static let setPropertyFunctionName = "_jsbSet"
    static let callFunctionName = "_jsbCall"

    static func defineInitialFunctions() -> String {
        let definitions = """
class jsb {
    static import() {
        for (let i = 0; i < arguments.length; i++) {
            _jsbImport(arguments[i])
        }
    }
}
"""
        return definitions
    }

    let bridge: JXBridge
    let superclassBridge: JXBridge?

    /**
     Define a JavaScript class for the given type. The JavaScript class uses
     an objec internally to invoke native API.
     */
    func defineJSClass() -> String {
        var extendsClause = ""
        var nativeDeclaration = ""
        var constructors = ""
        if let superclassBridge = self.superclassBridge {
            extendsClause = " extends \(superclassBridge.typeName)"
        } else {
            nativeDeclaration = "_jsbNative;"
            constructors = _constructorJS
        }
        let classJS = """
class \(self.bridge.typeName)\(extendsClause) {
    static _jsbStaticNative = _jsbCreateStaticNative('\(self.bridge.typeName)');
    \(nativeDeclaration)
\(_staticPropertiesJS)
\(_staticFunctionsJS)
\(constructors)
\(_propertiesJS)
\(_functionsJS)
    }
"""
        return classJS
    }

    private var _staticPropertiesJS: String {
        let namesAndHasSetters: [(name: String, hasSetter: Bool)] = self.bridge.staticProperties.map { ($0.name, $0.setter != nil) }
            +  self.bridge.classProperties.map { ($0.name, $0.setter != nil) }
        return namesAndHasSetters.map({ _staticPropertyJS($0.name, hasSetter: $0.hasSetter) }).joined(separator: "\n")
    }

    private func _staticPropertyJS(_ propertyName: String, hasSetter: Bool) -> String {
        guard hasSetter else {
            return _staticPropertyGetterJS(propertyName)
        }
        return "\(_staticPropertyGetterJS(propertyName))\n\(_staticPropertySetterJS(propertyName))"
    }

    private func _staticPropertyGetterJS(_ propertyName: String) -> String {
        return """
    static get \(propertyName)() {
        return _jsbGet(this._jsbStaticNative, '\(propertyName)'));
    }
"""
    }

    private func _staticPropertySetterJS(_ propertyName: String) -> String {
        return """
    static set \(propertyName)(p0) {
        _jsbSet(this._jsbStaticNative, '\(propertyName)', p0);
    }
"""
    }

    private var _staticFunctionsJS: String {
        let names = self.bridge.staticFunctions.map { $0.name }
            + self.bridge.classFunctions.map { $0.name }
        return names.map({ _staticFunctionJS($0) }).joined(separator: "\n")
    }

    private func _staticFunctionJS(_ functionName: String) -> String {
        return """
    static \(functionName)(...args) {
        return _jsbCall(this._jsbStaticNative, '\(functionName)', args);
    }
"""
    }

    private var _constructorJS: String {
        return """
    constructor(...args) {
        if (args.length === 1 && args[0] === '_jsbNative') {
            this._jsbNative = null; // Will be inserted
        } else {
            this._jsbNative = _jsbCreateNative(this.constructor.name, args);
        }
    }
"""
    }

    private var _propertiesJS: String {
        return self.bridge.properties.map({ _propertyJS($0.name, hasSetter: $0.setter != nil) }).joined(separator: "\n")
    }

    private func _propertyJS(_ propertyName: String, hasSetter: Bool) -> String {
        guard hasSetter else {
            return _propertyGetterJS(propertyName)
        }
        return "\(_propertyGetterJS(propertyName))\n\(_propertySetterJS(propertyName))"
    }

    private func _propertyGetterJS(_ propertyName: String) -> String {
        return """
    get \(propertyName)() {
        return _jsbGet(this._jsbNative, '\(propertyName)');
    }
"""
    }

    private func _propertySetterJS(_ propertyName: String) -> String {
        return """
    set \(propertyName)(p0) {
        _jsbSet(this._jsbNative, '\(propertyName)', p0);
    }
"""
    }

    private var _functionsJS: String {
        return self.bridge.functions.map({ _functionJS($0.name) }).joined(separator: "\n")
    }

    private func _functionJS(_ functionName: String) -> String {
        return """
    \(functionName)(...args) {
        return _jsbCall(this._jsbNative, '\(functionName)', args);
    }
"""
    }
}
