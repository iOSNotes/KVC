//
//  Tools.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "Tools.h"

@implementation Tools


+ (NSString *)getUniquePathWithName:(NSString *)name {
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //获取沙盒temp路径
    filePath = NSTemporaryDirectory();
    //获取沙盒Cache路径
    filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //文件路径
    NSString *uniquePath=[filePath stringByAppendingPathComponent:name];
    return uniquePath;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    
    
    
}

@end
