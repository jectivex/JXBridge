@import Foundation;
@import JXBridgeObjC;
@import XCTest;

@interface JXObjectiveCReflectorTestClass: NSObject

@property (nonatomic, getter=isReadWriteBool) BOOL readWriteBool;
@property (nonatomic, readonly) NSString *readOnlyString;
- (CGFloat)instanceMethodWithDateParam:(NSDate *)param;

@end

@implementation JXObjectiveCReflectorTestClass

- (CGFloat)instanceMethodWithDateParam:(NSDate *)param
{
    return 10.0;
}

@end

@interface JXObjectiveCReflectorTests : XCTestCase
@end

@implementation JXObjectiveCReflectorTests

- (void)testReflector
{
    JXObjectiveCReflector *reflector = [[JXObjectiveCReflector alloc] initWithClass:[JXObjectiveCReflectorTestClass class]];
    XCTAssertEqual(reflector.constructors.count, 0);

    XCTAssertEqual(reflector.properties.count, 2);
    JXObjectiveCProperty *readWriteBoolProperty = reflector.properties[0];
    XCTAssertEqualObjects(readWriteBoolProperty.getter.name, @"isReadWriteBool");
    XCTAssertEqualObjects(readWriteBoolProperty.setter.name, @"setReadWriteBool:");

    JXObjectiveCProperty *readOnlyStringProperty = reflector.properties[1];
    XCTAssertEqualObjects(readOnlyStringProperty.getter.name, @"readOnlyString");
    XCTAssertNil(readOnlyStringProperty.setter);

    XCTAssertEqual(reflector.methods.count, 1);
    JXObjectiveCMethod *method = reflector.methods[0];
    XCTAssertEqualObjects(method.name, @"instanceMethodWithDateParam:");
}

@end

