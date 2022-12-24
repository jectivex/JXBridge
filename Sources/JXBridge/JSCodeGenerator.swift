/// Generates JavaScript code.
struct JSCodeGenerator {
    static let typeNameProperty = "_jxTypeName"
    static let namespaceProperty = "_jxNamespace"
    static let defineFunction = "_jxDefine"
    static let createNativeFunction = "_jxCreateNative"
    static let createStaticNativeFunction = "_jxCreateStaticNative"
    static let nativeProperty = "_jxNative"
    static let getPropertyFunction = "_jxGet"
    static let setPropertyFunction = "_jxSet"
    static let callFunction = "_jxCall"
    static let importFunction = "_jxImport"
    static let moduleExportsMergeFunction = "_jxMergeModuleExports"
    static let moduleExportsCacheObject = "_jxModuleExportsCache"
    
    /// Return a new namespace that performs a callback on any attempt to access its classes, giving us a chance to lazily define the requested class.
    static func newNamespaceJSProxy(_ namespace: JXNamespace) -> String {
        return """
new Proxy({ _jxNamespace: '\(namespace)', import() { _jxImport(this); } }, {
    get(target, property) {
        if (target[property] === undefined) {
            _jxDefine(property, '\(namespace)');
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
        if let superclassBridge {
            extendsClause = " extends \(superclassBridge.qualifiedTypeName)"
        } else if let jsSuperclassName = bridge.jsSuperclassName {
            extendsClause = " extends \(jsSuperclassName)"
        }
        let classJS = """
\(bridge.qualifiedTypeName) = class\(extendsClause) {
    static _jxStaticNative = _jxCreateStaticNative('\(bridge.typeName)', '\(bridge.namespace)');
    static _jxTypeName = '\(bridge.typeName)';
\(staticPropertiesJS)
\(staticFunctionsJS)
\(constructorJS)
\(propertiesJS)
\(functionsJS)
}
"""
        //print(classJS)
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
        return _jxGet(this._jxStaticNative, '\(propertyName)');
    }
"""
    }

    private func staticPropertySetterJS(_ propertyName: String) -> String {
        return """
    static set \(propertyName)(p0) {
        _jxSet(this._jxStaticNative, '\(propertyName)', p0);
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
        return _jxCall(this._jxStaticNative, '\(functionName)', args);
    }
"""
    }

    private var constructorJS: String {
        var superCall = ""
        if superclassBridge != nil {
            // Call super with our special token arg telling it we'll inject _jxNative ourselves,
            // so that we can create it with our subclass type name and namespace
            superCall = "super('_jxNative');"
        } else if bridge.jsSuperclassName != nil {
            superCall = "super();"
        }
        return """
    constructor(...args) {
        \(superCall)
        if (args.length === 1 && args[0] === '_jxNative') {
            this._jxNative = null; // Will be inserted
        } else {
            this._jxNative = _jxCreateNative('\(bridge.typeName)', '\(bridge.namespace)', args);
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
        return _jxGet(this._jxNative, '\(propertyName)');
    }
"""
    }

    private func propertySetterJS(_ propertyName: String) -> String {
        return """
    set \(propertyName)(p0) {
        _jxSet(this._jxNative, '\(propertyName)', p0);
    }
"""
    }

    private var functionsJS: String {
        return bridge.functions.map({ functionJS($0.name) }).joined(separator: "\n")
    }

    private func functionJS(_ functionName: String) -> String {
        return """
    \(functionName)(...args) {
        return _jxCall(this._jxNative, '\(functionName)', args);
    }
"""
    }
}
