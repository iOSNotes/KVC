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

    
    [p cl_setValue:nil forKey:@"a"];
    NSLog(@"%@", [p valueForKey:@"a"]);
   NSError *error;
    NSString *key = @"personName";
    NSString *value = @"小明";
    BOOL result = [self validateValue:&value forKey:key error:&error];
    
    if (error) {
        NSLog(@"error = %@", error);
        return;
    }
    
    if (result) {
        NSLog(@"验证正确是小明");
    }
    else {
        NSLog(@"不是小明");
    }
    
    
}


@end
