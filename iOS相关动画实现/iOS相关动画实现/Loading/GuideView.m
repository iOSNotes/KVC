//
//  GuideView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/2.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "GuideView.h"

@implementation GuideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [self addSubview:view];

        UIBezierPath *allBezierPath = [UIBezierPath bezierPathWithRect:self.bounds];

        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(15, 100, CGRectGetWidth(frame) - 30, 50)];

       [allBezierPath appendPath:bezierPath];

        CAShapeLayer *layer = [CAShapeLayer layer];
        [self.layer addSublayer:layer];

        // 只展示基数部分 重叠部分不展示
        layer.fillRule = kCAFillRuleEvenOdd;
        layer.path = allBezierPath.CGPath;
        layer.mask = view.layer;
        
 
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = CGRectMake(30, 220, 80, 35);
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        btn.layer.cornerRadius = 5;
        [btn setTitle:@"我知道了" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(myKnow) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)myKnow {
    [self removeFromSuperview];
}


@end
