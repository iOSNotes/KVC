//
//  LoadingViewController.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/1.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "LoadingViewController.h"
#import "LoadingCircleView.h"
#import "AngleMaskView.h"
#import "IndicatorLoadingView.h"
#import "DragLayerView.h"
#import "GuideView.h"
#import "LineChartView.h"


@interface LoadingViewController ()

@property (nonatomic, strong) DragLayerView *dragLayerView;

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [self textGradientLayer];
    
//    GuideView *guide = [[GuideView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:guide];
    
    LineChartView *chartView = [[LineChartView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 280)];
    chartView.center = self.view.center;
    [self.view addSubview:chartView];
    [chartView reDraw];
    
    
    
//
//    DragLayerView *dragLayerView = [[DragLayerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100)];
//    self.dragLayerView = dragLayerView;
//    [self.view addSubview:dragLayerView];
//
//    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
//    [self.view addGestureRecognizer:tap];
//    AngleMaskView *maskView = [AngleMaskView showHudToSuperView:self.view];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [maskView hideHud];
//    });
//
    
//        IndicatorLoadingView *maskView = [IndicatorLoadingView showHudToSuperView:self.view];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [maskView hideHud];
//        });
    
}

- (void)tapHandle:(UIPanGestureRecognizer *)handle {
    
    if (handle.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [handle translationInView:self.view];
        CGFloat y = point.y;
        CGFloat x = point.x;
        [self.dragLayerView moveControlPoint:CGPointMake(x, y)];
    } else if (handle.state == UIGestureRecognizerStateEnded) {
        [self.dragLayerView moveControlPoint:CGPointMake(CGRectGetWidth(self.dragLayerView.frame) / 2, CGRectGetHeight(self.dragLayerView.frame))];
    }
    
}


- (void)textGradientLayer {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, CGRectGetWidth(self.view.frame) - 40, CGRectGetHeight(self.view.frame) - 100)];
    label.text = @"最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去最新的Xcode默认是没有7.0和7.1文件夹，我们可以从Xcode 7的DeviceSupport文件夹下拷贝出来，然后复制进去";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.frame;
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor, (id)[UIColor greenColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.mask = label.layer;
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    LoadingCircleView *circleView = [LoadingCircleView showHudToSuperView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [circleView hideHud];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
