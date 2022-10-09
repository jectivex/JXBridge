@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@class JXObjectiveCProperty;
@class JXObjectiveCMethod;

/// Reflects on an ObjectiveC class.
@interface JXObjectiveCReflector : NSObject

/// Reflect on the given class.
- (instancetype)initWithClass:(Class)cls;
- (instancetype)init NS_UNAVAILABLE;
@property (nonatomic, readonly) Class reflectedClass;
@property (nonatomic, readonly) NSArray<JXObjectiveCMethod *> *constructors;
@property (nonatomic, readonly) NSArray<JXObjectiveCProperty *> *properties;
@property (nonatomic, readonly) NSArray<JXObjectiveCMethod *> *methods;
@property (nonatomic, readonly) NSArray<JXObjectiveCProperty *> *classProperties;
@property (nonatomic, readonly) NSArray<JXObjectiveCMethod *> *classMethods;

@end

/// Encoded ObjectiveC types.
typedef NS_ENUM(NSInteger, JXObjectiveCType) {
    JXObjectiveCTypeChar,
    JXObjectiveCTypeInt,
    JXObjectiveCTypeShort,
    JXObjectiveCTypeLong,
    JXObjectiveCTypeLongLong,
    JXObjectiveCTypeUnsignedChar,
    JXObjectiveCTypeUnsignedInt,
    JXObjectiveCTypeUnsignedShort,
    JXObjectiveCTypeUnsignedLong,
    JXObjectiveCTypeUnsignedLongLong,
    JXObjectiveCTypeFloat,
    JXObjectiveCTypeDouble,
    JXObjectiveCTypeVoid,
    JXObjectiveCTypeObject,
    JXObjectiveCTypeClass,
    JXObjectiveCTypeSelector,
    JXObjectiveCTypeUnsupported,
};
FOUNDATION_EXTERN JXObjectiveCType JXObjectiveCTypeFromEncoding(const char *);

/// Object to stand for a nil value.
FOUNDATION_EXTERN NSString * const JXObjectiveCNilPlaceholder;

/// A property found using reflection.
@interface JXObjectiveCProperty : NSObject

- (instancetype)initWithName:(NSString *)name getter:(JXObjectiveCMethod *)getter setter:(nullable JXObjectiveCMethod *)setter;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) JXObjectiveCMethod *getter;
@property (nonatomic, readonly, nullable) JXObjectiveCMethod *setter;

@end

/// A method found during reflection, including getters and setters for properties.
@interface JXObjectiveCMethod : NSObject

- (instancetype)initWithName:(NSString *)name selector:(SEL)selector signature:(NSMethodSignature *)signature;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) SEL selector;
@property (nonatomic, readonly) NSMethodSignature *signature;
@property (nonatomic, readonly) NSInteger parameterCount;
@property (nonatomic, readonly) JXObjectiveCType *parameterTypes;
@property (nonatomic, readonly) JXObjectiveCType returnType;
- (nullable id)invokeOnTarget:(id)target arguments:(NSArray *)arguments;

@end

NS_ASSUME_NONNULL_END
