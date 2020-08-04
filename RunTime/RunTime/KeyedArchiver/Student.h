//
//  Student.h
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger age;


@end

NS_ASSUME_NONNULL_END
