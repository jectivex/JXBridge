/// Generates JavaScript code.
struct JSCodeGenerator {
    static let typeNamePropertyName = "_jxbTypeName"
    static let defineClassFunctionName = "_jxbDefineClass"
    static let createNativeFunctionName = "_jxbCreateNative"
    static let createStaticNativeFunctionName = "_jxbCreateStaticNative"
    static let nativePropertyName = "_jxbNative"
    static let getPropertyFunctionName = "_jxbGet"
    static let setPropertyFunctionName = "_jxbSet"
    static let callFunctionName = "_jxbCall"
    
    /// Create a namespace that performs a callback on any attempt to access its classes, giving us a chance to lazily define the requested class.
    static func defineNamespace(_ namespace: JXNamespace) -> String {
        return """
var \(namespace.value) = new Proxy({}, {
    get(target, property) {
        if (target[property] === undefined) {
            _jxbDefineClass(property, '\(namespace.value)');
        }
        return target[property];
    }
});
"""
    }
    
    let bridge: JXBridge
    let superclassBridge: JXBridge?

    /// Define a JavaScript class for the given type. The JavaScript class uses an objec internally to invoke native API.
    func defineJSClass() -> String {
        var extendsClause = ""
        var nativeDeclaration = ""
        if let superclassBridge = self.superclassBridge {
            extendsClause = " extends \(superclassBridge.qualifiedTypeName)"
        } else {
            nativeDeclaration = "_jxbNative;"
        }
        
        let classJS = """
\(bridge.qualifiedTypeName) = class\(extendsClause) {
    static _jxbStaticNative = _jxbCreateStaticNative('\(bridge.typeName)', '\(bridge.namespace.value)');
    static _jxbTypeName = '\(bridge.typeName)';
    \(nativeDeclaration)
\(staticPropertiesJS)
\(staticFunctionsJS)
\(constructorJS)
\(propertiesJS)
\(functionsJS)
}
"""
        print(classJS) //~~~
        return classJS
    }

    private var staticPropertiesJS: String {
        let namesAndHasSetters: [(name: String, hasSetter: Bool)] = bridge.staticProperties.map { ($0.name, $0.setter != nil) }
            +  bridge.classProperties.map { ($0.name, $0.setter != nil) }
        return namesAndHasSetters.map({ staticPropertyJS($0.name, hasSetter: $0.hasSetter) }).joined(separator: "\n")
    }

    private func staticPropertyJS(_ propertyName: String, hasSetter: Bool) -> String {
        guard hasSetter else {
            return staticPropertyGetterJS(propertyName)
        }
        return "\(staticPropertyGetterJS(propertyName))\n\(staticPropertySetterJS(propertyName))"
    }

    private func staticPropertyGetterJS(_ propertyName: String) -> String {
        return """
    static get \(propertyName)() {
        return _jxbGet(this._jxbStaticNative, '\(propertyName)');
    }
"""
    }

    private func staticPropertySetterJS(_ propertyName: String) -> String {
        return """
    static set \(propertyName)(p0) {
        _jxbSet(this._jxbStaticNative, '\(propertyName)', p0);
    }
"""
    }

    private var staticFunctionsJS: String {
        let names = bridge.staticFunctions.map { $0.name }
            + bridge.classFunctions.map { $0.name }
        return names.map({ staticFunctionJS($0) }).joined(separator: "\n")
    }

    private func staticFunctionJS(_ functionName: String) -> String {
        return """
    static \(functionName)(...args) {
        return _jxbCall(this._jxbStaticNative, '\(functionName)', args);
    }
"""
    }

    private var constructorJS: String {
        var superCall = ""
        if superclassBridge != nil {
            // Call super with our special token arg telling it we'll inject _jxbNative ourselves,
            // so that we can create it with our subclass type name and namespace
            superCall = "super('_jxbNative');"
        }
        return """
    constructor(...args) {
        \(superCall)
        if (args.length === 1 && args[0] === '_jxbNative') {
            this._jxbNative = null; // Will be inserted
        } else {
            this._jxbNative = _jxbCreateNative('\(bridge.typeName)', '\(bridge.namespace.value)', args);
        }
    }
"""
    }

    private var propertiesJS: String {
        return bridge.properties.map({ propertyJS($0.name, hasSetter: $0.setter != nil) }).joined(separator: "\n")
    }

    private func propertyJS(_ propertyName: String, hasSetter: Bool) -> String {
        guard hasSetter else {
            return propertyGetterJS(propertyName)
        }
        return "\(propertyGetterJS(propertyName))\n\(propertySetterJS(propertyName))"
    }

    private func propertyGetterJS(_ propertyName: String) -> String {
        return """
    get \(propertyName)() {
        return _jxbGet(this._jxbNative, '\(propertyName)');
    }
"""
    }

    private func propertySetterJS(_ propertyName: String) -> String {
        return """
    set \(propertyName)(p0) {
        _jxbSet(this._jxbNative, '\(propertyName)', p0);
    }
"""
    }

    private var functionsJS: String {
        return bridge.functions.map({ functionJS($0.name) }).joined(separator: "\n")
    }

    private func functionJS(_ functionName: String) -> String {
        return """
    \(functionName)(...args) {
        return _jxbCall(this._jxbNative, '\(functionName)', args);
    }
"""
    }
}
