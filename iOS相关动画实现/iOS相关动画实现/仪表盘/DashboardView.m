//
//  DashboardView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/7/30.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "DashboardView.h"

@interface DashboardView ()

@property (nonatomic, strong) NSTimer *animationTimer;

@end


@implementation DashboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.durationAnimation = 5;
        self.lineDegree = 1;
        self.spaceDegree = 10;
        self.fillColor = [UIColor redColor];
    }
    return self;
}

- (void)drawView {
    [self reloadLayer];
}

- (void)reloadLayer {
    // 先删除layer
    [self removeLayers];

    NSInteger number = [self getLineCount];
    
    // 为了防止数据不准确，这里会进行space调整
    CGFloat space = (360 - number * self.lineDegree)  / number;
    for (int i = 0; i < number; i++) {
        CGFloat between = (self.lineDegree + space) / 360 * 2 * M_PI;
        CGFloat start = between * i;
        CGFloat end = start + self.lineDegree / 360 * 2 *M_PI;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetWidth(self.frame) / 2) radius:CGRectGetWidth(self.frame) / 2 startAngle:start endAngle:end clockwise:YES];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.strokeColor = self.fillColor.CGColor;
        layer.lineWidth   = 20.f;
        [self.layer addSublayer:layer];
    }
}

- (void)removeLayers {
    NSArray *layers = [self.layer.sublayers copy];
    for (int i = 0; i < layers.count; i++) {
        [layers[i] removeFromSuperlayer];
    }
}

- (NSInteger)getLineCount {
    NSInteger number = 360;
    if (self.spaceDegree && self.lineDegree) {
        number = roundf(360 / (self.lineDegree + self.spaceDegree));
    } else {
        self.lineDegree = 1;
    }
    return number;
}


- (void)startAnimation {
    if (!self.durationAnimation) {
        return;
    }
    if (self.animationTimer) {
        [self.animationTimer setFireDate:[NSDate new]];
        return;
    }
    
    CGFloat duration = self.durationAnimation / [self getLineCount];
    self.animationTimer = [NSTimer timerWithTimeInterval:duration target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.animationTimer forMode:NSRunLoopCommonModes];
}

- (void)startTimer {
    NSArray *layers = [self.layer.sublayers copy];
    if (layers.count > 0) {
        [layers.lastObject removeFromSuperlayer];
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(dashboardViewFinishView:)]) {
            [self.delegate dashboardViewFinishView:self];
        }
        [self invalidateTimer];
    }
}

- (void)endAnimation {
    [self.animationTimer setFireDate:[NSDate distantFuture]];
}

- (void)invalidateTimer {
    if (self.animationTimer) {
        [self.animationTimer invalidate];
        self.animationTimer = nil;
    }
}

- (void)dealloc {
    [self invalidateTimer];
}

@end
