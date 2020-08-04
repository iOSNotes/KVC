//
//  ViewController.m
//  KVO自定义监听方法
//
//  Created by 秦传龙 on 2020/7/21.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+CLKeyValueObserving.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [Person share];
//    [self.person cl_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.person addObserver:self forKeyPath:@"isLogin" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(Person *)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%ld",[change[NSKeyValueChangeNewKey] boolValue]);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person.name = @"我是心智";
//    self.person.isLogin = YES;
    
    if ( self.person.isLogin == YES) {
         self.person.isLogin = NO;
    } else {
         self.person.isLogin = YES;
    }
    
}


@end
