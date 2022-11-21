import JXKit

/// Boxes a native type to access properties and methods from JXKit.
protocol NativeBox {
    func get(property: JXValue) throws -> JXValue
    func set(property: JXValue, value: JXValue) throws
    func call(function: JXValue, arguments: JXValue) throws -> JXValue
}
