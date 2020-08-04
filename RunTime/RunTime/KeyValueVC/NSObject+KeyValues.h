//
//  NSObject+KeyValues.h
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KeyValues)

+ (instancetype)cl_keyValuesWithDictionary:(NSDictionary *)dict;



@end

NS_ASSUME_NONNULL_END
