#if canImport(Foundation)
import Foundation
#endif
#if canImport(UIKit)
import UIKit
#endif
import JXKit

#if canImport(ObjectiveC)

extension Selector: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        return try NSSelectorFromString(value.string)
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return context.string(NSStringFromSelector(self) as String)
    }
}

#endif

#if canImport(Foundation)

extension URL: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        guard let url = try URL(string: value.string) else {
            throw JXErrors.cannotConvey(URL.self)
        }
        return url
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return context.string(absoluteString)
    }
}

extension NSRange: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        return try NSMakeRange(value["location"].int, value["length"].int)
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return try context.object(fromDictionary: ["location": context.number(location), "length": context.number(length)])
    }
}

#endif

#if canImport(CoreGraphics)

extension CGPoint: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        return try CGPoint(x: value["x"].double, y: value["y"].double)
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return try context.object(fromDictionary: ["x": context.number(x), "y": context.number(y)])
    }
}

extension CGSize: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        return try CGSize(width: value["width"].double, height: value["height"].double)
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return try context.object(fromDictionary: ["width": context.number(width), "height": context.number(height)])
    }
}

extension CGRect: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Self {
        return try CGRect(origin: CGPoint.fromJX(value["origin"]), size :CGSize.fromJX(value["size"]))
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return try context.object(fromDictionary: ["origin": origin.toJX(in: context), "size": size.toJX(in: context)])
    }
}

#endif
