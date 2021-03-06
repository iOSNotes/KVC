//
//  IndicatorLoadingView.h
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/2.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IndicatorLoadingView : UIView


+ (instancetype)showHudToSuperView:(UIView *)superView;

- (void)hideHud;

@end

NS_ASSUME_NONNULL_END
