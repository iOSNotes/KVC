//
//  TabBarViewController.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/8/1.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "TabBarViewController.h"
#import <objc/message.h>
#import "TabBar.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *classNames = @[@"ViewController01",@"ViewController02"];
    NSArray *titles = @[@"首页",@"列表",@"我的"];
    NSArray *icons = @[@"tab-home", @"tab-catogary", @"tab-mine"];
    NSArray *iconSelectes = @[@"tab-home-select", @"tab-catogary-select", @"tab-mine-select"];
    
    
//    self.tabBar = ;
    [self setValue:[TabBar new] forKey:@"tabBar"];
    
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < classNames.count; i++) {

        Class cl = NSClassFromString(classNames[i]);
        UIViewController *viewController = [cl new];
        viewController.tabBarItem.title = titles[i];
        viewController.tabBarItem.image = [UIImage imageNamed:icons[i]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:iconSelectes[i]];
        [mArr addObject:viewController];
    }
    
    self.viewControllers = mArr;
    
    
    // 打印一下self上的所有属性

    unsigned int count = 0;
     objc_property_t *properties = class_copyPropertyList([UITabBarController class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *propertyChar = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:propertyChar];
        NSLog(@"%@", propertyName);
    }
    
    
    
    
}

@end
