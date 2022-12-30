#if canImport(CoreGraphics)
import CoreGraphics
#endif
#if canImport(Foundation)
import Foundation
#endif
import JXKit
#if canImport(UIKit)
import UIKit
#endif

extension Result: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> Result<Success, Failure> {
        guard value.hasProperty("success") else {
            return try .failure(value["failure"].convey(to: Failure.self))
        }
        return try .success(value["success"].convey(to: Success.self))
    }
    
    public func toJX(in context: JXContext) throws -> JXValue {
        switch self {
        case .success(let value):
            let success = context.object()
            try success.setProperty("success", context.convey(value))
            return success
        case .failure(let value):
            let failure = context.object()
            try failure.setProperty("failure", context.convey(value))
            return failure
        }
    }
}

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
            throw JXError(message: "Cannot convey '\(try value.string)' to a valid URL")
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
