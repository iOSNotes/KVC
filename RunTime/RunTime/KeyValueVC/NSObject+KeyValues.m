//
//  NSObject+KeyValues.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "NSObject+KeyValues.h"
#import "NSObject+CLProperty.h"

@implementation NSObject (KeyValues)

+ (instancetype)cl_keyValuesWithDictionary:(NSDictionary *)dict {
    NSArray *properties = [self cl_getAllPropertyName];
    id object = [[self class] new];
    for (NSUInteger i = 0; i < properties.count; i++) {
        
        NSString *propertyName = properties[i];
        id value = dict[propertyName];
        if (value) {
            [object setValue:value forKey:propertyName];
        }
        
    }
    return object;
}


@end
