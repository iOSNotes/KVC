//
//  AddPropertyVC.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "AddPropertyVC.h"
#import "NSObject+AddProperty.h"
#import "Persion.h"

@interface AddPropertyVC ()

@property (nonatomic, strong) Persion *per;

@end

@implementation AddPropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.per = [Persion new];
    self.per.name = @"我是小明";
}
- (IBAction)setPerson:(id)sender {
    self.per.isUserName = YES;
}


- (IBAction)getPerson:(id)sender {
    if (self.per.isUserName) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
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
