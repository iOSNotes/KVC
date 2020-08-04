//
//  ArchiveVC.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ArchiveVC.h"
#import "Runtime.h"
#import "Student.h"

/*
 // 本demo主要用来学习使用： 学习笔记
 1. 归档和解档的本质：分别实现 - (void)encodeWithCoder:(NSCoder *)coder【归档】 / - (instancetype)initWithCoder:(NSCoder *)coder [解档] 并实现 self.propertyName = [coder decodeObjectForKey:propertyName];  [coder encodeObject:value forKey:propertyName];
 
 2. 所以我们可以通过runtime获取NSObject的propertyName， 遍历后 通过KVC实现
 */


@interface ArchiveVC ()

@end

@implementation ArchiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)Archive:(id)sender {
    Student *stu = [Student new];
    stu.name = @"晓明";
    stu.age = 11;
    stu.score = 98;
    stu.id = @"100020202";
    NSLog(@"%@", stu);
    [NSKeyedArchiver archiveRootObject: stu toFile:[Tools getUniquePathWithName:@"a"]];
    
}
- (IBAction)unArchive:(id)sender {
    NSLog(@"%@", [NSKeyedUnarchiver unarchiveObjectWithFile:[Tools getUniquePathWithName:@"a"]]);

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
