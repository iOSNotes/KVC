//
//  NSObject+CLKeyValues.m
//  自定义KVC流程
//
//  Created by 秦传龙 on 2020/7/20.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+CLKeyValues.h"
#import <objc/message.h>

@implementation NSObject (CLKeyValues)



- (void)cl_setValue:(id)value forKey:(NSString *)key {
//    1、容错
    if (key == nil || key.length == 0) {
        return;
    }
    
//   2、查找setKey、_setKey 是否调用完成
    NSString *capKey = key.capitalizedString;
    NSString *setKey = [NSString stringWithFormat:@"set%@",capKey];
    NSString *_setKey = [NSString stringWithFormat:@"_set%@", capKey];
    if ([self performSelectorWithMethodName:setKey withValue:value]
        || [self performSelectorWithMethodName:_setKey withValue:value]) {
     return;
    }
    
    // 如果 accessInstanceVariablesDirectly return NO  直接抛出异常。
    if (![[self class] accessInstanceVariablesDirectly]) {
        [self setValue:value forUndefinedKey:key];
        return;
    }
    
    // 在成员变量中查找_key/_isKey/key/isKey。
    // 获取所有成员变量
    NSArray *ivarNameList = [self getIvarListName];
   
    NSString *_key = [NSString stringWithFormat:@"_%@",key];
    NSString *_isKey = [NSString stringWithFormat:@"_is%@",capKey];
    NSString *isKey = [NSString stringWithFormat:@"is%@",capKey];
    
    if ([ivarNameList containsObject:_key]) {
        Ivar ivar = class_getInstanceVariable([self class], _key.UTF8String);
        return object_setIvar(self, ivar, value);
    } else if ([ivarNameList containsObject:_isKey]) {
        Ivar ivar = class_getInstanceVariable([self class], _isKey.UTF8String);
        return object_setIvar(self, ivar, value);
    } else if ([ivarNameList containsObject:key]) {
        Ivar ivar = class_getInstanceVariable([self class], key.UTF8String);
        return object_setIvar(self, ivar, value);
    } else if ([ivarNameList containsObject:isKey]) {
        Ivar ivar = class_getInstanceVariable([self class], isKey.UTF8String);
        return object_setIvar(self, ivar, isKey);
    } else {
        // 都没找到  调用
        [self setValue:value forUndefinedKey:key];
    }
    
    
    
}

- (NSArray *)getIvarListName {
    NSMutableArray *ivarList = [NSMutableArray new];
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *ivarChar = ivar_getName(ivar);
        [ivarList addObject:[NSString stringWithUTF8String:ivarChar]];
    }
    
    return ivarList;
    
}



- (BOOL)performSelectorWithMethodName:(NSString *)methodName withValue:(id)value {
    
    if ([self respondsToSelector:NSSelectorFromString(methodName)]) {
        [self performSelector:NSSelectorFromString(methodName) withObject:value];
        return YES;
    }
    return NO;
    
}


@end
