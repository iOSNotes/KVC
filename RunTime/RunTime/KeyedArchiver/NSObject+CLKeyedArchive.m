//
//  NSObject+CLKeyedArchive.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+CLKeyedArchive.h"
#import "NSObject+CLProperty.h"

@implementation NSObject (CLKeyedArchive)

// 解档
- (void)cl_coder:(NSCoder *)coder {
    NSArray *properties = [self cl_getAllPropertyName];
    for (NSInteger i=0; i < properties.count; i++) {
        NSString *propertyName = properties[i];
        id value = [coder decodeObjectForKey:propertyName];
        [self setValue:value forKey:propertyName];
    }
}

// 归档
- (void)cl_encode:(NSCoder *)coder {
    NSArray *properties = [self cl_getAllPropertyName];
    for (NSInteger i=0; i < properties.count; i++) {
        NSString *propertyName = properties[i];
        id value = [self valueForKey:propertyName];
        [coder encodeObject:value forKey:propertyName];
    }
}

@end
