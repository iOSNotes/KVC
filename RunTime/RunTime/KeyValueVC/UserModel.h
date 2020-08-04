//
//  UserModel.h
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *staffCode;
@property (nonatomic, copy) NSString *idCard;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, assign) BOOL isNo;


@end

NS_ASSUME_NONNULL_END
