//
//  Person.m
//  KVO自定义监听方法
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)share {
    static dispatch_once_t onceToken;
    static Person *per = nil;
    dispatch_once(&onceToken, ^{
        
        per = [Person new];
    });
    return per;
}


@end
