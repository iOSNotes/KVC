//
//  IndicatorLoadingView.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/2.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "IndicatorLoadingView.h"

@implementation IndicatorLoadingView



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
                
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicatorView.frame = CGRectMake(10, 10, 40, 40);
        [view addSubview:indicatorView];
        indicatorView.hidesWhenStopped = YES;
        [indicatorView startAnimating];
        indicatorView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    }
    return self;
}


+ (instancetype)showHudToSuperView:(UIView *)superView {
    IndicatorLoadingView *maskView = [[IndicatorLoadingView alloc] initWithFrame:superView.bounds];
    [superView addSubview:maskView];
    return maskView;
}

- (void)hideHud {
    [self removeFromSuperview];
}


@end
