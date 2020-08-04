//
//  LoadingCircleView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/1.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "LoadingCircleView.h"

@interface LoadingCircleView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end


@implementation LoadingCircleView

- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawCircle];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapHandle {
    
}

+ (instancetype)showHudToSuperView:(UIView *)superView {
    LoadingCircleView *circleView = [[LoadingCircleView alloc] initWithFrame:superView.bounds superView:superView];
    [superView addSubview:circleView];
    [superView bringSubviewToFront:circleView];
    return circleView;
}

- (void)hideHud {
    [self removeFromSuperview];
}



- (void)drawCircle {
    
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.87];
    [self addSubview:maskView];
    maskView.center = self.center;
    maskView.layer.cornerRadius = 4;
    maskView.layer.masksToBounds = YES;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(maskView.frame) / 2, CGRectGetWidth(maskView.frame) / 2) radius:10 startAngle:0 endAngle:M_PI * 2 - M_PI / 5 clockwise:YES];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame= maskView.bounds;
    layer.path = bezierPath.CGPath;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 2;
    layer.lineCap = kCALineCapRound;
    layer.fillColor = [UIColor clearColor].CGColor;
    [maskView.layer addSublayer:layer];
    self.shapeLayer = layer;
    [self startAnimation];
}

- (void)startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1;
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2);
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [self.shapeLayer addAnimation:animation forKey:@""];
    
}

@end
