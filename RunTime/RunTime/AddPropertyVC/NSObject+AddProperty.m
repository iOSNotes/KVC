//
//  NSObject+AddProperty.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/message.h>

@implementation NSObject (AddProperty)

- (BOOL)isUserName {
    return [objc_getAssociatedObject(self, @selector(isUserName)) boolValue];
}

- (void)setIsUserName:(BOOL)isUserName {
    objc_setAssociatedObject(self, @selector(isUserName), @(isUserName), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
