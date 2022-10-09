//
//  ScriptConvertibleTypes.swift
//  
//  Created by Abe White on 8/25/22.
//

#if canImport(Foundation)
import Foundation
#endif
#if canImport(UIKit)
import UIKit
#endif

#if canImport(ObjectiveC)

extension Selector: ScriptConvertible {
    public static func fromScript(_ value: Any) -> Any? {
        guard let string = value as? String else {
            return nil
        }
        return NSSelectorFromString(string)
    }

    public var toScript: Any? {
        return NSStringFromSelector(self)
    }
}

#endif

#if canImport(Foundation)

extension NSRange: ScriptConvertible {
    public static func fromScript(_ value: Any) -> Any? {
        guard let dict = value as? [String: Any], let location = dict["location"], let length = dict["length"] else {
            return nil
        }
        guard let locationInt = Converter.convertNumberFromScript(location, to: Int.self), let lengthInt = Converter.convertNumberFromScript(length, to: Int.self) else {
            return nil
        }
        return NSRange(location: locationInt, length: lengthInt)
    }

    public var toScript: Any? {
        return ["location": self.location, "length": self.length]
    }
}

#endif

#if canImport(CoreGraphics)

extension CGPoint: ScriptConvertible {
    public static func fromScript(_ value: Any) -> Any? {
        guard let dict = value as? [String: Any], let x = dict["x"], let y = dict["y"] else {
            return nil
        }
        guard let xCGFloat = Converter.convertNumberFromScript(x, to: CGFloat.self), let yCGFloat = Converter.convertNumberFromScript(y, to: CGFloat.self) else {
            return nil
        }
        return CGPoint(x: xCGFloat, y: yCGFloat)
    }

    public var toScript: Any? {
        return ["x": self.x, "y": self.y]
    }
}

extension CGSize: ScriptConvertible {
    public static func fromScript(_ value: Any) -> Any? {
        guard let dict = value as? [String: Any], let width = dict["width"], let height = dict["height"] else {
            return nil
        }
        guard let widthCGFloat = Converter.convertNumberFromScript(width, to: CGFloat.self), let heightCGFloat = Converter.convertNumberFromScript(height, to: CGFloat.self) else {
            return nil
        }
        return CGSize(width: widthCGFloat, height: heightCGFloat)
    }

    public var toScript: Any? {
        return ["width": self.width, "height": self.height]
    }
}

extension CGRect: ScriptConvertible {
    public static func fromScript(_ value: Any) -> Any? {
        guard let dict = value as? [String: Any], let originDict = dict["origin"], let sizeDict = dict["size"] else {
            return nil
        }
        guard let origin = CGPoint.fromScript(originDict), let size = CGSize.fromScript(sizeDict) else {
            return nil
        }
        return CGRect(origin: origin as! CGPoint, size: size as! CGSize)
    }

    public var toScript: Any? {
        return ["origin": self.origin.toScript, "size": self.size.toScript]
    }
}

#endif
