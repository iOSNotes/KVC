//
//  LineChartView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/3.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "LineChartView.h"

@interface LineChartView ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end


@implementation LineChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
        self.edgeInsets = UIEdgeInsetsMake(5, 20, 20, 20);
        
        self.scrollView= [[UIScrollView alloc] initWithFrame:CGRectMake(30 + self.edgeInsets.left, 0, CGRectGetWidth(self.frame) - 60 - self.edgeInsets.right, CGRectGetHeight(self.frame))];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        
    }
    return self;
}

- (void)reDraw {
    [self xAxis];
    [self yAxis];
}

- (void)xAxis {

    CGFloat width = CGRectGetWidth(self.frame) / 6;
    NSArray *yList = @[@"0", @"20", @"50",@"0", @"20", @"50",@"0", @"20", @"50",@"0", @"20", @"50",@"0", @"20", @"50"];
    NSArray *yMonth = @[@"1/30",@"2/30",@"3/30",@"4/30",@"5/30",@"6/30",@"7/30",@"8/30",@"9/30",@"10/30",@"5/30",@"6/30",@"7/30",@"8/30",@"9/30",@"10/30"];
    self.scrollView.contentSize = CGSizeMake(yList.count * width, CGRectGetHeight(self.frame));
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake([yList[0] floatValue],  6 * 35)];

                                           
    for (int i = 1; i < yList.count; i++) {
        CGFloat y = (100 - [yList[i] floatValue])/ 20 *35 + 35;
        [bezierPath addLineToPoint:CGPointMake(i * width, y)];
        
        UILabel *label = [[UILabel alloc] init];
       label.text = yMonth[i];
       label.textAlignment = NSTextAlignmentRight;
       label.font = [UIFont systemFontOfSize:12];
       label.textColor = [UIColor grayColor];
       [label sizeToFit];
       label.frame = CGRectMake(width * (i + 1) - CGRectGetWidth(label.frame) / 2,  35 * 6, CGRectGetWidth(label.frame), CGRectGetHeight(label.frame));
        [self.scrollView addSubview:label];
    }
    
    [bezierPath addLineToPoint:CGPointMake(width * [yList[yList.count - 1] doubleValue], 6 * 35)];
    
    [bezierPath closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.path = bezierPath.CGPath;
    [self.scrollView.layer addSublayer:shapeLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, CGRectGetHeight(self.scrollView.frame));
    gradientLayer.shadowPath = bezierPath.CGPath;
    gradientLayer.colors = @[(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor, (id)[UIColor colorWithWhite:1 alpha:0.5].CGColor];
    [self.scrollView.layer addSublayer:gradientLayer];
    
    gradientLayer.mask = shapeLayer;
}

- (void)yAxis {
     // 绘制Y轴文字
    NSArray *yList = @[@"20", @"40", @"60", @"80", @"100"];
    CGFloat height = 35;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGFloat y = 0;
    for (int i = 0; i < yList.count; i++) {
        // 绘制label
        UILabel *label = [[UILabel alloc] init];
        label.text = yList[yList.count - i - 1];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        label.frame = CGRectMake(self.edgeInsets.left, (i + 1) * height - CGRectGetHeight(label.frame) / 2, 25, CGRectGetHeight(label.frame));
        [self addSubview:label];
        y =  label.center.y;
        [bezierPath moveToPoint:CGPointMake(0, y)];
        [bezierPath addLineToPoint:CGPointMake(self.scrollView.contentSize.width ,y)];

    }
    
    [bezierPath moveToPoint:CGPointMake(0, y + height)];
    [bezierPath addLineToPoint:CGPointMake(self.scrollView.contentSize.width,y + height)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.lineWidth = 1;
    shapeLayer.strokeColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    shapeLayer.lineDashPattern = @[@5,@6];
    [self.scrollView.layer addSublayer:shapeLayer];
}





@end
