import JXKit

/// Bridge a native type for use in scripting.
public struct JXBridge {
    /// Supply the native type being bridged.
    init(_ type: Any.Type) {
        self.type = type
        self.typeName = String(describing: type)
    }

    public let type: Any.Type

    /// It is possible to customize the name used for the type in scripts.
    public var typeName: String

    /// Set the next mapped superclass.
    public var superclass: Any.Type?

    func hasSuperclass(in registry: JXBridgeRegistry) -> Bool {
        guard let superclass = self.superclass else {
            return false
        }
        return registry.hasBridge(for: superclass)
    }

    func superclass(in registry: JXBridgeRegistry) throws -> JXBridge {
        guard let superclass = self.superclass else {
            throw JXBridgeErrors.unknownType(typeName + ".superclass")
        }
        return try registry.bridge(for: superclass)
    }

    private func findSuperclass(in registry: JXBridgeRegistry) -> JXBridge? {
        guard let superclass = self.superclass, registry.hasBridge(for: superclass) else {
            return nil
        }
        do {
            return try registry.bridge(for: superclass)
        } catch {
            // Should not be possible
            return nil
        }
    }

    /// Bridged constructors.
    var constructors: [ConstructorBridge] = []

    /// Return the bridged constructor with the given parameter count.
    /// - Note Constructors are not inherited from base classes.
    func constructor(forParameterCount count: Int, superclassRegistry: JXBridgeRegistry? = nil) throws -> ConstructorBridge {
        if let constructor = findConstructor(forParameterCount: count, superclassRegistry: superclassRegistry) {
            return constructor
        }
        if constructors.isEmpty {
            throw JXBridgeErrors.noConstructors(typeName)
        } else {
            throw JXBridgeErrors.invalidArgumentCount(typeName, "init")
        }
    }

    private func findConstructor(forParameterCount count: Int, superclassRegistry: JXBridgeRegistry? = nil) -> ConstructorBridge? {
        if let constructor = constructors.first(where: { $0.parameterCount == count }) {
            return constructor
        }
        // Special case for constructors: we only inherit superclass constructors if we don't define any ourselves
        guard constructors.isEmpty else {
            return nil
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findConstructor(forParameterCount: count, superclassRegistry: superclassRegistry)
    }

    /// Bridged instance properties.
    var properties: [PropertyBridge] = [] {
        didSet {
            propertiesByName = nil
        }
    }

    /// Whether we have a bridged property with the given name.
    func hasProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findProperty(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged property with the given name.
    func property(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> PropertyBridge {
        if let property = findProperty(for: name, superclassRegistry: superclassRegistry) {
            return property
        }
        throw JXBridgeErrors.unknownPropertyName(typeName, name)
    }

    private func findProperty(for name: String, superclassRegistry: JXBridgeRegistry?) -> PropertyBridge? {
        if let property = propertiesByName?[name] {
            return property
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findProperty(for: name, superclassRegistry: superclassRegistry)

    }
    private var propertiesByName: [String: PropertyBridge]?

    /// Bridged instance functions.
    var functions: [FunctionBridge] = [] {
        didSet {
            functionsByName = nil
        }
    }

    /// Whether we have a bridged instance function with the given name.
    func hasFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findFunction(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged instance function with the given name.
    func function(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> FunctionBridge {
        if let function = findFunction(for: name, superclassRegistry: superclassRegistry) {
            return function
        }
        throw JXBridgeErrors.unknownFunctionName(typeName, name)
    }

    private func findFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> FunctionBridge? {
        if let function = functionsByName?[name] {
            return function
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findFunction(for: name, superclassRegistry: superclassRegistry)
    }
    private var functionsByName: [String: FunctionBridge]?

    /// Bridged static properties.
    var staticProperties: [StaticPropertyBridge] = [] {
        didSet {
            staticPropertiesByName = nil
        }
    }

    /// Whether we have a bridged static property with the given name.
    func hasStaticProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findStaticProperty(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged static property with the given name.
    func staticProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> StaticPropertyBridge {
        if let property = findStaticProperty(for: name, superclassRegistry: superclassRegistry) {
            return property
        }
        throw JXBridgeErrors.unknownPropertyName(typeName, name)
    }

    private func findStaticProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> StaticPropertyBridge? {
        if let property = staticPropertiesByName?[name] {
            return property
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findStaticProperty(for: name, superclassRegistry: superclassRegistry)
    }
    private var staticPropertiesByName: [String: StaticPropertyBridge]?

    /// Bridged static functions.
    var staticFunctions: [StaticFunctionBridge] = [] {
        didSet {
            staticFunctionsByName = nil
        }
    }

    /// Whether we have a bridged static function with the given name.
    func hasStaticFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findStaticFunction(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged static function with the given name.
    func staticFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> StaticFunctionBridge {
        if let function = findStaticFunction(for: name, superclassRegistry: superclassRegistry) {
            return function
        }
        throw JXBridgeErrors.unknownFunctionName(typeName, name)
    }

    private func findStaticFunction(for name: String, superclassRegistry: JXBridgeRegistry?) -> StaticFunctionBridge? {
        if let function = staticFunctionsByName?[name] {
            return function
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findStaticFunction(for: name, superclassRegistry: superclassRegistry)
    }
    private var staticFunctionsByName: [String: StaticFunctionBridge]?

    /// Bridged class properties.
    var classProperties: [PropertyBridge] = [] {
        didSet {
            classPropertiesByName = nil
        }
    }

    /// Whether we have a bridged class property with the given name.
    func hasClassProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findClassProperty(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged class property with the given name.
    func classProperty(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> PropertyBridge {
        if let property = findClassProperty(for: name, superclassRegistry: superclassRegistry) {
            return property
        }
        throw JXBridgeErrors.unknownPropertyName(typeName, name)
    }

    private func findClassProperty(for name: String, superclassRegistry: JXBridgeRegistry?) -> PropertyBridge? {
        if let property = classPropertiesByName?[name] {
            return property
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findClassProperty(for: name, superclassRegistry: superclassRegistry)

    }
    private var classPropertiesByName: [String: PropertyBridge]?

    /// Bridged class functions.
    var classFunctions: [FunctionBridge] = [] {
        didSet {
            classFunctionsByName = nil
        }
    }

    /// Whether we have a bridged class function with the given name.
    func hasClassFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> Bool {
        return findClassFunction(for: name, superclassRegistry: superclassRegistry) != nil
    }

    /// Return the bridged class function with the given name.
    func classFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) throws -> FunctionBridge {
        if let function = findClassFunction(for: name, superclassRegistry: superclassRegistry) {
            return function
        }
        throw JXBridgeErrors.unknownFunctionName(typeName, name)
    }

    private func findClassFunction(for name: String, superclassRegistry: JXBridgeRegistry? = nil) -> FunctionBridge? {
        if let function = classFunctionsByName?[name] {
            return function
        }
        guard let superclassRegistry else {
            return nil
        }
        return findSuperclass(in: superclassRegistry)?.findClassFunction(for: name, superclassRegistry: superclassRegistry)
    }
    private var classFunctionsByName: [String: FunctionBridge]?

    /// Call this method before using any funcs that lookup members by name or other criteria.
    mutating func prepareLookupCaches() {
        if propertiesByName == nil {
            propertiesByName = properties.reduce(into: [String: PropertyBridge]()) { result, property in
                result[property.name] = property
            }
        }
        if functionsByName == nil {
            functionsByName = functions.reduce(into: [String: FunctionBridge]()) { result, function in
                result[function.name] = function
            }
        }
        if staticPropertiesByName == nil {
            staticPropertiesByName = staticProperties.reduce(into: [String: StaticPropertyBridge]()) { result, property in
                result[property.name] = property
            }
        }
        if staticFunctionsByName == nil {
            staticFunctionsByName = staticFunctions.reduce(into: [String: StaticFunctionBridge]()) { result, function in
                result[function.name] = function
            }
        }
        if classPropertiesByName == nil {
            classPropertiesByName = classProperties.reduce(into: [String: PropertyBridge]()) { result, property in
                result[property.name] = property
            }
        }
        if classFunctionsByName == nil {
            classFunctionsByName = classFunctions.reduce(into: [String: FunctionBridge]()) { result, function in
                result[function.name] = function
            }
        }
    }
}

/// Bridge a native constructor.
struct ConstructorBridge {
    let parameterCount: Int
    let constructor: ([JXValue], JXContext) throws -> Any

    /// Call the constructor, returning the constructed instance.
    func call(_ args: [JXValue], in context: JXContext) throws -> Any {
        return try constructor(args, context)
    }
}

/// Bridge a native instance property.
struct PropertyBridge {
    let name: String
    let getter: (Any, JXContext) throws -> JXValue
    let setter: ((Any, JXValue, JXContext) throws -> Any)? // Returns target instance (for value types)

    /// Call the getter, returning the value.
    func get(for instance: Any, in context: JXContext) throws -> JXValue {
        return try getter(instance, context)
    }

    /// Call the setter, returning the target instance. For value types, this may be a different value.
    func set(for instance: Any, value: JXValue, in context: JXContext) throws -> Any {
        guard let setter = self.setter else {
            let typeName = String(describing: type(of: instance))
            throw JXBridgeErrors.readOnlyProperty(typeName, name)
        }
        return try setter(instance, value, context)
    }
}

/// Bridge a native instance function.
struct FunctionBridge {
    let name: String
    let function: (Any, [JXValue], JXContext) throws -> (Any, JXValue) // Returns target instance (for value types)

    /// Call the function, returning the target instance and function return. For value types, the target instance may be a different value.
    func call(for instance: Any, with args: [JXValue], in context: JXContext) throws -> (Any, JXValue) {
        return try function(instance, args, context)
    }
}

/// Bridge a native static property.
struct StaticPropertyBridge {
    let typeName: String
    let name: String
    let getter: (JXContext) throws -> JXValue
    let setter: ((JXValue, JXContext) throws -> Void)?

    /// Call the getter, returning the value.
    func get(in context: JXContext) throws -> JXValue {
        return try getter(context)
    }

    /// Call the setter.
    func set(value: JXValue, in context: JXContext) throws {
        guard let setter = self.setter else {
            throw JXBridgeErrors.readOnlyProperty(typeName, name)
        }
        try setter(value, context)
    }
}

/// Bridge a native static function.
struct StaticFunctionBridge {
    let name: String
    let function: ([JXValue], JXContext) throws -> JXValue

    /// Call the function, returning the function return.
    func call(with args: [JXValue], in context: JXContext) throws -> JXValue {
        return try function(args, context)
    }
}
