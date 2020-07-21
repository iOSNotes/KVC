//
//  Person.h
//  KVO初探
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, copy) NSString *downloadProgress;
@property (nonatomic, assign) CGFloat writeData;
@property (nonatomic, assign) CGFloat totalData;

@end

NS_ASSUME_NONNULL_END
