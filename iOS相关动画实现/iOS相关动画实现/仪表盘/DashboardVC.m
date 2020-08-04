//
//  DashboardVCViewController.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/7/30.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "DashboardVC.h"
#import "DashboardView.h"

@interface DashboardVC ()<DashboardViewDelegate>

@property (nonatomic, strong) DashboardView *boardView;
@property (nonatomic, assign) BOOL isStart;

@end

@implementation DashboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addCircleViewOne];
    [self addCircleTwo];
    [self addStartAnimationBtn];
}

- (void)addStartAnimationBtn {
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
    sender.frame = CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 60, CGRectGetMaxY(self.boardView.frame) + 50 , 120, 35);
    sender.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sender setTitle:@"开始动画" forState:UIControlStateNormal];
    [sender addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sender];
}

- (void)startAnimation:(UIButton *)sender {
    self.isStart = !self.isStart;
    if (self.isStart) {
         [sender setTitle:@"暂停动画" forState:UIControlStateNormal];
         [self.boardView startAnimation];
    } else {
         [sender setTitle:@"开始动画" forState:UIControlStateNormal];
         [self.boardView endAnimation];
    }
}

- (void)addCircleViewOne {
    DashboardView *view = [[DashboardView alloc] initWithFrame:CGRectMake(50, 50, CGRectGetWidth(self.view.frame) - 100, CGRectGetWidth(self.view.frame) - 100)];
    view.lineDegree = 1;
    view.spaceDegree = 7;
    view.fillColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    [view drawView];
}

- (void)addCircleTwo {
    DashboardView *view1 = [[DashboardView alloc] initWithFrame:CGRectMake(50, 50, CGRectGetWidth(self.view.frame) - 100, CGRectGetWidth(self.view.frame) - 100)];
    view1.lineDegree = 1;
    view1.spaceDegree = 7;
    view1.delegate = self;
    view1.fillColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 drawView];
    view1.durationAnimation = 5;
    self.boardView = view1;
}

- (void)dashboardViewFinishView:(DashboardView *)boardView {
    NSLog(@"动画完成");
    [boardView drawView];
    [self startAnimation:nil];
}

@end
