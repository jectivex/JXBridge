@import ObjectiveC;

#import "include/JXObjectiveCReflector.h"

@implementation JXObjectiveCReflector

- (instancetype)initWithClass:(Class)cls prefixes:(NSArray<NSString *> *)prefixes
{
    if (self = [super init]) {
        _reflectedClass = cls;
        _prefixes = [prefixes copy] ?: @[];
        if (cls == NSObject.class) {
            [self _buildNSObject];
        } else {
            [self _build];
        }
    }
    return self;
}

- (void)_buildNSObject
{
    [self _buildAllowingOnlyPrefixes:YES];
    
    // Only include core NSObject methods. If we reflect on all members, we pick up hundreds of selectors from categories
    JXObjectiveCMethod *descriptionMethod = [[JXObjectiveCMethod alloc] initWithName:@"description" selector:@selector(description) signature:[NSMethodSignature methodSignatureForSelector:@selector(description)]];
    JXObjectiveCProperty *descriptionProperty = [[JXObjectiveCProperty alloc] initWithName:@"description" getter:descriptionMethod setter:nil];
    JXObjectiveCMethod *hashMethod = [[JXObjectiveCMethod alloc] initWithName:@"hash" selector:@selector(hash) signature:[NSMethodSignature methodSignatureForSelector:@selector(hash)]];
    JXObjectiveCProperty *hashProperty = [[JXObjectiveCProperty alloc] initWithName:@"hash" getter:hashMethod setter:nil];
    JXObjectiveCMethod *isEqualMethod = [[JXObjectiveCMethod alloc] initWithName:@"isEqual:" selector:@selector(isEqual:) signature:[NSMethodSignature methodSignatureForSelector:@selector(isEqual:)]];
    
    _properties = [_properties arrayByAddingObjectsFromArray:@[descriptionProperty, hashProperty]];
    _methods = [_methods arrayByAddingObject:isEqualMethod];

    JXObjectiveCMethod *initMethod = [[JXObjectiveCMethod alloc] initWithName:@"init" selector:@selector(init) signature:[NSMethodSignature methodSignatureForSelector:@selector(init)]];
    _constructors = [_constructors arrayByAddingObject:initMethod];
}

- (void)_build
{
    [self _buildAllowingOnlyPrefixes:NO];
}

- (void)_buildAllowingOnlyPrefixes:(BOOL)isOnlyPrefixes
{
    NSMutableArray<JXObjectiveCProperty *> *propertyObjs = [[NSMutableArray alloc] init];
    NSMutableDictionary<NSString *, JXObjectiveCMethod *> *nameToMethod = [[NSMutableDictionary alloc] init];
    [self _buildClass:_reflectedClass allowingOnlyPrefixes:isOnlyPrefixes propertyObjects:propertyObjs nameToMethodDictionary:nameToMethod];

    NSMutableArray<JXObjectiveCMethod *> *constructorObjs = [[NSMutableArray alloc] init];
    NSMutableArray<JXObjectiveCMethod *> *methodObjs = [[NSMutableArray alloc] init];
    for (JXObjectiveCMethod *methodObj in nameToMethod.allValues) {
        if ([methodObj.name hasPrefix:@"init"] && methodObj.returnType == JXObjectiveCTypeObject) {
            [constructorObjs addObject:methodObj];
        } else {
            [methodObjs addObject:methodObj];
        }
    }
    _constructors = [constructorObjs copy];
    _properties = [propertyObjs copy];
    _methods = [methodObjs copy];

    Class metaClass = objc_getMetaClass(class_getName(_reflectedClass));
    if (metaClass) {
        [propertyObjs removeAllObjects];
        [nameToMethod removeAllObjects];
        [self _buildClass:metaClass allowingOnlyPrefixes:isOnlyPrefixes propertyObjects:propertyObjs nameToMethodDictionary:nameToMethod];
        _classProperties = [propertyObjs copy];
        _classMethods = nameToMethod.allValues;
    } else {
        _classProperties = @[];
        _classMethods = @[];
    }
}

- (void)_buildClass:(Class)cls allowingOnlyPrefixes:(BOOL)isOnlyPrefixes propertyObjects:(NSMutableArray<JXObjectiveCProperty *> *)propertyObjs nameToMethodDictionary:(NSMutableDictionary<NSString *, JXObjectiveCMethod *> *)nameToMethod
{
    unsigned int methodCount;
    Method *methods = class_copyMethodList(cls, &methodCount);
    for (NSInteger i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        if (![self _isMemberName:name includedAllowingOnlyPrefixes:isOnlyPrefixes]) {
            continue;
        }
        if ([name isEqualToString:@".cxx_destruct"]) {
            continue;
        }
        const char *typeEncoding = method_getTypeEncoding(method);
        @try {
            NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:typeEncoding];
            JXObjectiveCMethod *methodObj = [[JXObjectiveCMethod alloc] initWithName:name selector:selector signature:signature];
            nameToMethod[name] = methodObj;
        } @catch(NSException *ex) {
            NSLog(@"Unsupported type encoding %s: %@", typeEncoding, ex);
        }
    }
    free(methods);

    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList(cls, &propertyCount);
    for (NSInteger i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *nameString = [[NSString alloc] initWithCString:name encoding:NSUTF8StringEncoding];
        if (![self _isMemberName:nameString includedAllowingOnlyPrefixes:isOnlyPrefixes]) {
            continue;
        }
        const char *attrs = property_getAttributes(property);
        NSString *attrsString = [[NSString alloc] initWithCString:attrs encoding:NSUTF8StringEncoding];

        JXObjectiveCProperty *propertyObj = [self _propertyObjectWithName:nameString attributes:attrsString withCandidateMethods:nameToMethod];
        if (propertyObj) {
            [propertyObjs addObject:propertyObj];
        }
    }
    free(properties);
}

- (JXObjectiveCProperty *)_propertyObjectWithName:(NSString *)name attributes:(NSString *)attrs withCandidateMethods:(NSMutableDictionary<NSString *, JXObjectiveCMethod *> *)methods
{
    NSString *getterName = [self _customNameWithStartToken:@",G" inAttributes:attrs];
    if (!getterName) {
        getterName = name;
    }
    JXObjectiveCMethod *getter = methods[getterName];
    if (!getter) {
        return nil;
    }
    [methods removeObjectForKey:getterName];

    NSString *setterName = [self _customNameWithStartToken:@",S" inAttributes:attrs];
    if (!setterName) {
        setterName = [NSString stringWithFormat:@"set%@%@:", [[name substringWithRange:NSMakeRange(0, 1)] capitalizedString], [name substringFromIndex:1]];
    }
    JXObjectiveCMethod *setter = methods[setterName];
    [methods removeObjectForKey:setterName];
    
    return [[JXObjectiveCProperty alloc] initWithName:name getter:getter setter:setter];
}

- (BOOL)_isMemberName:(NSString *)name includedAllowingOnlyPrefixes:(BOOL)isOnlyPrefixes
{
    for (NSString *prefix in _prefixes) {
        if ([name hasPrefix:prefix]) {
            return YES;
        }
    }
    return !isOnlyPrefixes && [name rangeOfString:@"_"].location == NSNotFound;
}

- (NSString *)_customNameWithStartToken:(NSString *)token inAttributes:(NSString *)attrs
{
    NSRange startRange = [attrs rangeOfString:token];
    if (startRange.location == NSNotFound) {
        return nil;
    }

    NSInteger start = startRange.location + token.length;
    NSRange endRange = [attrs rangeOfString:@"," options:0 range:NSMakeRange(start, attrs.length - start)];
    if (endRange.location == NSNotFound) {
        return nil;
    }
    return [attrs substringWithRange:NSMakeRange(start, endRange.location - start)];
}

@end

@implementation JXObjectiveCProperty

- (instancetype)initWithName:(NSString *)name getter:(JXObjectiveCMethod *)getter setter:(nullable JXObjectiveCMethod *)setter
{
    if (self = [super init]) {
        _name = [name copy];
        _getter = getter;
        _setter = setter;
    }
    return self;
}

@end

@implementation JXObjectiveCMethod

- (instancetype)initWithName:(NSString *)name selector:(SEL)selector signature:(NSMethodSignature *)signature
{
    if (self = [super init]) {
        _name = [name copy];
        _selector = selector;
        _signature = signature;
        _parameterCount = signature.numberOfArguments - 2; // self, _cmd
        if (_parameterCount > 0) {
            _parameterTypes = malloc(_parameterCount * sizeof(JXObjectiveCType));
            for (NSInteger i = 0; i < _parameterCount; i++) {
                _parameterTypes[i] = JXObjectiveCTypeFromEncoding([signature getArgumentTypeAtIndex:i + 2]);
            }
        } else {
            _parameterTypes = NULL;
        }
        _returnType = JXObjectiveCTypeFromEncoding(signature.methodReturnType);
    }
    return self;
}

- (void)dealloc
{
    if (_parameterTypes) {
        free(_parameterTypes);
    }
}

- (id)invokeOnTarget:(id)target arguments:(NSArray *)arguments
{
    if (!target) {
        return nil;
    }
    // TODO: We could optimize cases for simple getters and setters using hand-crafted objc_msgSend calls
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:self.signature];
    invocation.target = target;
    invocation.selector = self.selector;
    for (NSInteger i = 0, count = self.parameterCount; i < count; i++) {
        id value = (arguments.count > i) ? arguments[i] : nil;
        [self _setInvocation:invocation argumentAtIndex:i + 2 toValue:value ofType:self.parameterTypes[i]];
    }
    [invocation invoke];
    return [self _boxedReturnValueOfType:self.returnType fromInvocation:invocation];
}

- (void)_setInvocation:(NSInvocation *)invocation argumentAtIndex:(NSInteger)index toValue:(id)value ofType:(JXObjectiveCType)type
{
    switch (type) {
        case JXObjectiveCTypeChar: {
            char c = [value charValue];
            [invocation setArgument:&c atIndex:index];
            break;
        }
        case JXObjectiveCTypeInt: {
            int i = [value intValue];
            [invocation setArgument:&i atIndex:index];
            break;
        }
        case JXObjectiveCTypeShort: {
            short s = [value shortValue];
            [invocation setArgument:&s atIndex:index];
            break;
        }
        case JXObjectiveCTypeLong: {
            long l = [value longValue];
            [invocation setArgument:&l atIndex:index];
            break;
        }
        case JXObjectiveCTypeLongLong: {
            long long ll = [value longLongValue];
            [invocation setArgument:&ll atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsignedChar: {
            unsigned char uc = [value unsignedCharValue];
            [invocation setArgument:&uc atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsignedInt: {
            unsigned int ui = [value unsignedIntValue];
            [invocation setArgument:&ui atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsignedShort: {
            unsigned short us = [value unsignedShortValue];
            [invocation setArgument:&us atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsignedLong: {
            unsigned long ul = [value unsignedLongValue];
            [invocation setArgument:&ul atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsignedLongLong: {
            unsigned long long ull = [value unsignedLongLongValue];
            [invocation setArgument:&ull atIndex:index];
            break;
        }
        case JXObjectiveCTypeFloat: {
            float f = [value floatValue];
            [invocation setArgument:&f atIndex:index];
            break;
        }
        case JXObjectiveCTypeDouble: {
            double d = [value doubleValue];
            [invocation setArgument:&d atIndex:index];
            break;
        }
        case JXObjectiveCTypeVoid:
            break;
        case JXObjectiveCTypeObject: {
            id obj = ([value isEqual:JXObjectiveCNilPlaceholder]) ? nil : value;
            [invocation setArgument:&obj atIndex:index];
            break;
        }
        case JXObjectiveCTypeClass: {
            Class cls = ([value isEqual:JXObjectiveCNilPlaceholder]) ? nil : value;
            [invocation setArgument:&cls atIndex:index];
            break;
        }
        case JXObjectiveCTypeSelector: {
            SEL selector = NSSelectorFromString((NSString *)value);
            [invocation setArgument:&selector atIndex:index];
            break;
        }
        case JXObjectiveCTypeUnsupported:
            break;
    }
}

- (id)_boxedReturnValueOfType:(JXObjectiveCType)type fromInvocation:(NSInvocation *)invocation
{
    switch (type) {
        case JXObjectiveCTypeChar: {
            char c;
            [invocation getReturnValue:&c];
            return [NSNumber numberWithChar:c];
        }
        case JXObjectiveCTypeInt: {
            int i;
            [invocation getReturnValue:&i];
            return [NSNumber numberWithInt:i];
        }
        case JXObjectiveCTypeShort: {
            short s;
            [invocation getReturnValue:&s];
            return [NSNumber numberWithShort:s];
        }
        case JXObjectiveCTypeLong: {
            long l;
            [invocation getReturnValue:&l];
            return [NSNumber numberWithLong:l];
        }
        case JXObjectiveCTypeLongLong: {
            long long ll;
            [invocation getReturnValue:&ll];
            return [NSNumber numberWithLongLong:ll];
        }
        case JXObjectiveCTypeUnsignedChar: {
            unsigned char uc;
            [invocation getReturnValue:&uc];
            return [NSNumber numberWithUnsignedChar:uc];
        }
        case JXObjectiveCTypeUnsignedInt: {
            unsigned int ui;
            [invocation getReturnValue:&ui];
            return [NSNumber numberWithUnsignedInt:ui];
        }
        case JXObjectiveCTypeUnsignedShort: {
            unsigned short us;
            [invocation getReturnValue:&us];
            return [NSNumber numberWithUnsignedShort:us];
        }
        case JXObjectiveCTypeUnsignedLong: {
            unsigned long ul;
            [invocation getReturnValue:&ul];
            return [NSNumber numberWithUnsignedLong:ul];
        }
        case JXObjectiveCTypeUnsignedLongLong: {
            unsigned long long ull;
            [invocation getReturnValue:&ull];
            return [NSNumber numberWithUnsignedLongLong:ull];
        }
        case JXObjectiveCTypeFloat: {
            float f;
            [invocation getReturnValue:&f];
            return [NSNumber numberWithFloat:f];
        }
        case JXObjectiveCTypeDouble: {
            double d;
            [invocation getReturnValue:&d];
            return [NSNumber numberWithDouble:d];
        }
        case JXObjectiveCTypeVoid:
            return nil;
        case JXObjectiveCTypeObject: {
            // The __bridge is necessary. Attempting to pass &<id> to getReturnValue: directly results in a crash later in execution.
            CFTypeRef ret = NULL;
            [invocation getReturnValue:&ret];
            id obj = (__bridge id)ret;
        }
        case JXObjectiveCTypeClass: {
            Class cls;
            [invocation getReturnValue:&cls];
            return cls;
        }
        case JXObjectiveCTypeSelector: {
            SEL selector;
            [invocation getReturnValue:&selector];
            return NSStringFromSelector(selector);
        }
        case JXObjectiveCTypeUnsupported:
            return nil;
    }
}

@end

JXObjectiveCType JXObjectiveCTypeFromEncoding(const char *encoding)
{
    if (!strcmp(encoding, "c")) {
        return JXObjectiveCTypeChar;
    } else if (!strcmp(encoding, "i")) {
        return JXObjectiveCTypeInt;
    } else if (!strcmp(encoding, "s")) {
        return JXObjectiveCTypeShort;
    } else if (!strcmp(encoding, "l")) {
        return JXObjectiveCTypeLong;
    } else if (!strcmp(encoding, "q")) {
        return JXObjectiveCTypeLongLong;
    } else if (!strcmp(encoding, "C")) {
        return JXObjectiveCTypeUnsignedChar;
    } else if (!strcmp(encoding, "I")) {
        return JXObjectiveCTypeUnsignedInt;
    } else if (!strcmp(encoding, "S")) {
        return JXObjectiveCTypeUnsignedShort;
    } else if (!strcmp(encoding, "L")) {
        return JXObjectiveCTypeUnsignedLong;
    } else if (!strcmp(encoding, "Q")) {
        return JXObjectiveCTypeUnsignedLongLong;
    } else if (!strcmp(encoding, "f")) {
        return JXObjectiveCTypeFloat;
    } else if (!strcmp(encoding, "d")) {
        return JXObjectiveCTypeDouble;
    } else if (!strcmp(encoding, "v")) {
        return JXObjectiveCTypeVoid;
    } else if (!strcmp(encoding, "@")) {
        return JXObjectiveCTypeObject;
    } else if (!strcmp(encoding, "#")) {
        return JXObjectiveCTypeClass;
    } else if (!strcmp(encoding, ":")) {
        return JXObjectiveCTypeSelector;
    } else {
        // TODO: Support encodable/decodable structs
        return JXObjectiveCTypeUnsupported;
    }
}

NSString * const JXObjectiveCNilPlaceholder = @"__JXObjectiveCNilPlaceholder__";
