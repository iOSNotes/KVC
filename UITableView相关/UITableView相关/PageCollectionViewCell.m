//
//  PageCollectionViewCell.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/13.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "PageCollectionViewCell.h"


@implementation PageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIViewController *vc = [NSClassFromString(@"BViewController") new];
        vc.view.frame = frame;
        [self.viewController addChildViewController:vc];
        [self.contentView addSubview:vc.view];
       
        
    }
    return self;
}



@end
