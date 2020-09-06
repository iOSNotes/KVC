//
//  ViewController.m
//  MainProject
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import <LoginModule/LoginModule.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LoginViewController *vc =[LoginViewController new];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
