//
//  ViewController.m
//  自定义KVC流程
//
//  Created by 秦传龙 on 2020/7/20.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+CLKeyValues.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *p = [Person new];
    
//    [p setValue:nil forKey:nil];
}


@end
