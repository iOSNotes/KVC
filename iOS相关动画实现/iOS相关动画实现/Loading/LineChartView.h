//
//  LineChartView.h
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/3.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LineChartView : UIView

@property (nonatomic, assign) UIEdgeInsets edgeInsets;
- (void)reDraw;

@end

NS_ASSUME_NONNULL_END
