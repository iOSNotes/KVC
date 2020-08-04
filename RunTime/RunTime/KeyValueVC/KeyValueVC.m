//
//  KeyValueVC.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "KeyValueVC.h"
#import "NSObject+KeyValues.h"
#import "UserModel.h"

@interface KeyValueVC ()

@end

@implementation KeyValueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     @property (nonatomic, copy) NSString *userName;
     @property (nonatomic, copy) NSString *staffCode;
     @property (nonatomic, copy) NSString *idCard;
     @property (nonatomic, copy) NSString *nickName;
     
     */
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary *dict = @{
        @"userName":@"小明",
        @"staffCode": @"sljadkfjald030033",
        @"idCard": @"4989821990394444x",
        @"nickName": @"风一样的人",
        @"isNo": @YES
    };
    
    NSLog(@"%@", [UserModel cl_keyValuesWithDictionary:dict]);
    
}


@end
