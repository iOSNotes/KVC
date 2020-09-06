//
//  CLSectionBgColorLayout.h
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CLBaseFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface CLSectionBgColorLayout : CLBaseFlowLayout

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat borderRadius;

@end

NS_ASSUME_NONNULL_END
