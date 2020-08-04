//
//  NSObject+CLKeyedArchive.h
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CLKeyedArchive)


#define CLCodingImplementation - (instancetype)initWithCoder:(NSCoder *)coder\
{\
    self = [super init];\
    if (self) {\
        [self cl_coder:coder];\
    }\
    return self;\
}\
\
- (void)encodeWithCoder:(NSCoder *)coder\
{\
    [self cl_encode:coder];\
}


- (void)cl_coder:(NSCoder *)coder;

- (void)cl_encode:(NSCoder *)coder;


@end

NS_ASSUME_NONNULL_END
