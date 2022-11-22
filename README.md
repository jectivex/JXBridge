# JXBridge

[![Build Status][GitHubActionBadge]][ActionsLink]
[![Swift5 compatible][Swift5Badge]][Swift5Link] 
![Platform][SwiftPlatforms]

A `JXKit` addition to bridge ObjectiveC and Swift classes and structs to JavaScript.

## API

Browse the [API Documentation].

## Dependencies

 - [JXKit][]: Cross-platform JavaScript engine[^1]

[Swift Package Manager]: https://swift.org/package-manager
[API Documentation]: https://www.jective.org/JXBridge/documentation/jxbridge/

[ProjectLink]: https://github.com/jectivex/JXBridge
[ActionsLink]: https://github.com/jectivex/JXBridge/actions
[API Documentation]: https://www.jective.org/JXBridge/documentation/jxbridge/

[Swift]: https://swift.org/
[JXKit]: https://github.com/jectivex/JXKit
[JavaScriptCore]: https://trac.webkit.org/wiki/JavaScriptCore

[GitHubActionBadge]: https://img.shields.io/github/workflow/status/jectivex/JXBridge/JXBridge%20CI

[Swift5Badge]: https://img.shields.io/badge/swift-5-orange.svg?style=flat
[Swift5Link]: https://developer.apple.com/swift/
[SwiftPlatforms]: https://img.shields.io/badge/Platforms-macOS%20|%20iOS%20|%20tvOS%20|%20Linux-teal.svg

## TODO

- Formalize threading model.
    - We currently assume that there is never concurrent access to a `JXContext`.
    - We always evaluate JavaScript - including calling any bridged native code - on the context's calling thread.
- Test performance of bridged code.
- Support Swift tuples as return values?
    - This would require additional function builder overloads to maintain the tuple element types.
- Support Swift delegates in JavaScript.
    - I don't think there's any way to get around requiring the developer to write an implementing of the delegate protocol. But we may be able to give her a simple API with which to invoke the corresponding JS code for each delegate callback. E.g.:
    
            func sender(_ sender: Sender, didSomethingWithResult result: Result) -> Return {
                return jsDelegate.invoke('senderDidSomethingWithResult', [sender, result]).convey(to: Return.self)
            }
        
- Support Swift trailing closures in JavaScript.
    - This would require additional function builder overloads for all support block signatures. We could limit the overloads to non-async instance functions.
    - Consider support for Void closures with no args, a single Bool arg, and a single Result arg.

- Consider a SourceKit plugin option to auto-generate Swift bridging code.
- Test enhancing and overriding reflected ObjectiveC API with explicit bridging.
- Support ObjectiveC trailing `error: NSError**` parameters.
    - We can detect this from the selector name and type encoding (`^@` is an object pointer) and convert to a throwing function.
- Support ObjectiveC delegates in JavaScript.
    - We should be able to create the delegate at runtime and call through to the underlying JavaScript code.
- Support ObjectiveC trailing blocks in JavaScript.
    - ObjectiveC reflection does not give you any information about block signatures. In fact the type encoding is just 'unsupported' (`?`).
- Consider implementing ObjectiveC reflected API using a JavaScript Proxy rather than writing out a full class definition.
    - Proxys do not handle static API well.
