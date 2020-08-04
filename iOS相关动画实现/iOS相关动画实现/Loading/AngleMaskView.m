//
//  AngleMaskView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/2.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "AngleMaskView.h"

@implementation AngleMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self addSubview:view];
        view.center = self.center;
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
        view.layer.cornerRadius = 6;
        view.layer.masksToBounds = YES;
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        imageView.image = [UIImage imageNamed:@"angle-mask"];
        [view addSubview:imageView];
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(30, 30) radius:15 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = bezierPath.CGPath;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 3;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        [view.layer addSublayer:shapeLayer];
        shapeLayer.mask = imageView.layer;
        
        
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        basicAnimation.repeatCount = MAXFLOAT;
        basicAnimation.fromValue = @(0);
        basicAnimation.toValue = @(M_PI * 2);
        basicAnimation.duration = 1.5;
        basicAnimation.removedOnCompletion =NO;
        [imageView.layer addAnimation:basicAnimation forKey:nil];

        
    }
    return self;
}

+ (instancetype)showHudToSuperView:(UIView *)superView {
    AngleMaskView *maskView = [[AngleMaskView alloc] initWithFrame:superView.bounds];
    [superView addSubview:maskView];
    return maskView;
}

- (void)hideHud {
    [self removeFromSuperview];
}

@end
