//
//  NSObject+CLKeyValueObserving.m
//  KVO自定义监听方法
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+CLKeyValueObserving.h"
#import <objc/message.h>

@implementation NSObject (CLKeyValueObserving)

- (void)cl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    
//    1.判断setter是否存在keyPath
    [self judgeSetterMethodWithKeyPath:keyPath];
    
    // 动态生成子类
    Class newClass = [self createChildClassWithKeyPath:keyPath];
    // 改变isa指向 为 本类
    object_setClass(self, newClass);
}

- (Class)createChildClassWithKeyPath:(NSString *)keyPath {
    
//    2.1 是否添加过
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"CLKVONotifying_%@", oldClassName];
    
    Class newClass = NSClassFromString(newClassName);
    if (!newClass) {
        // 申请类
        newClass = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
        // 注册类
        objc_registerClassPair(newClass);
        // 2.4.1 添加class方法
        SEL classSEL = NSSelectorFromString(@"class");
        Method classMethod = class_getClassMethod([self class], @selector(class));
        const char *classType = method_getTypeEncoding(classMethod);
        class_addMethod(newClass, classSEL, (IMP)lg_class, classType);
        
    }
    
    SEL setterSEL = NSSelectorFromString([NSString stringWithFormat:@"set%@:", keyPath.capitalizedString]);
    Method setterMethod = class_getClassMethod([self class], setterSEL);
    const char *setterType = method_getTypeEncoding(setterMethod);
    class_addMethod(newClass, setterSEL, (IMP)lg_setter, setterType);
    
    
    
    return newClass;
}

static void lg_setter(id self, SEL _cmd , id newValue) {
    NSLog(@"来了:%@",newValue);
}


Class lg_class(id self,SEL _cmd){
    return class_getSuperclass(object_getClass(self));
}

- (BOOL)judgeSetterMethodWithKeyPath:(NSString *)keyPath {
    Class cl = object_getClass(self);
    NSString *setterName = [NSString stringWithFormat:@"set%@:", keyPath.capitalizedString];
    SEL setter = NSSelectorFromString(setterName);
    Method setterMethod = class_getInstanceMethod(cl, setter);
    if (setterMethod) {
        return YES;
    }
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"监听的setter方法不存在" userInfo:nil];
}




@end
