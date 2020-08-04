//
//  DashboardView.h
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/7/30.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DashboardView;

@protocol DashboardViewDelegate <NSObject>

- (void)dashboardViewFinishView:(DashboardView *)boardView;

@end


@interface DashboardView : UIView

@property (nonatomic, weak) id<DashboardViewDelegate> delegate;
@property (nonatomic, assign) CGFloat spaceDegree;  // 间隔度数
@property (nonatomic, assign) CGFloat lineDegree; // 线条度数
@property (nonatomic, strong) UIColor *fillColor; // 线条颜色
@property (nonatomic, assign) CGFloat durationAnimation; // 动画间隔s 默认是0

- (void)drawView;
- (void)startAnimation;
- (void)endAnimation;

@end

NS_ASSUME_NONNULL_END
