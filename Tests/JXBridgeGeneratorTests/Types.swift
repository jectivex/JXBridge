import JXBridge



class OuterType {
    class InnerType {
        var innerVar = 1

        init(innerVar: Int) {
            self.innerVar = innerVar
        }

        class func classFunc(arg: String) -> String {
            return arg
        }

        class InnerInnerType {
            var innerInnerVar = 2
        }
    }
}

public struct PublicType: JXBridging {
    public var publicVar = 1
    var internalVar = 2
}

extension OuterType {
    var computedOuterVar: Int {
        return 2
    }
}

extension OuterType.InnerType.InnerInnerType: JXBridging {
    var computedInnerInnerVar: Int {
        return 2
    }
}
