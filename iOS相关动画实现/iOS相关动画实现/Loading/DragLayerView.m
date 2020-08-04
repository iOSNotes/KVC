//
//  DragLayerView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/2.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "DragLayerView.h"


@interface DragLayerView ()

@property (nonatomic, strong) CAShapeLayer *shapLayer;

@end

@implementation DragLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointZero];
        [bezierPath addQuadCurveToPoint:CGPointMake(CGRectGetWidth(frame), 0) controlPoint:CGPointMake(self.center.x, CGRectGetHeight(frame))];
        [bezierPath closePath];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = frame;
        layer.fillColor = [UIColor cyanColor].CGColor;
        layer.path = bezierPath.CGPath;
        [self.layer addSublayer:layer];
        self.shapLayer = layer;
    }
    return self;
}

- (void)moveControlPoint:(CGPoint)point {
    
    if (CGRectGetHeight(self.frame) > point.y) {
        return;
    }
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointZero];
    [bezierPath addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.frame), 0) controlPoint:point];
    [bezierPath closePath];
    self.shapLayer.path = bezierPath.CGPath;
}

@end
