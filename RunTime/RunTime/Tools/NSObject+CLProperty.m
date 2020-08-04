//
//  NSObject+CLProperty.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+CLProperty.h"
#import <objc/message.h>

@implementation NSObject (CLProperty)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        SEL originSEL = @selector(description);
        SEL targetSEL = @selector(swizzing_description);
        
        [self swizzing_exchangeMethodWithSEL:originSEL targetSEL:targetSEL class:selfClass];
    });
}

+ (void)swizzing_exchangeMethodWithSEL:(SEL)originSEL targetSEL:(SEL)targetSEL class:(Class)selfClass {
    Method originMethod = class_getInstanceMethod(selfClass, originSEL);
    Method targetMethod = class_getInstanceMethod(selfClass, targetSEL);
    
    // 添加description
    BOOL didAddMethod = class_addMethod(selfClass, originSEL, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    if (didAddMethod) {
        // 如果添加成功  说明没有实现改方法
        class_replaceMethod(selfClass, targetSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, targetMethod);
    }
}


- (NSArray *)cl_getAllPropertyName {
    NSMutableArray *mProperties = [NSMutableArray new];
    
    Class selfClass = [self class];
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(selfClass, &outCount);
    
    for (NSUInteger i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
         const char *propertyChar = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:propertyChar];
        [mProperties addObject:propertyName];
    }
    
    return mProperties;
}



- (NSString *)swizzing_description {
    NSMutableString *resultStr = [[NSMutableString alloc] initWithFormat:@"[%@]:\n", NSStringFromClass([self class])];
    NSArray *properties = [self cl_getAllPropertyName];
    for (NSUInteger i = 0; i < properties.count; i++) {
        [resultStr appendFormat:@"%@ -> %@\n", properties[i], [self valueForKey:properties[i]]];
    }
    
    [self swizzing_description];
    return resultStr;
}


@end
