//
//  TabBar.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/1.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()<UITabBarDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2 - 25, -25, 50, 50);
        imageView.image = [UIImage imageNamed:@"tab-mine-select"];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle)];
        [self.imageView addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapHandle {
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        }];
    }];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    }
    //判断点击的点是否在按钮区域范围内
    if (CGRectContainsPoint(self.imageView.frame, point)) {
        //返回按钮
        return self.imageView;
    } else {
        return [super hitTest:point withEvent:event];
    }
    
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
