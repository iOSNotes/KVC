//
//  ICTableView.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ICTableView.h"

@implementation ICTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.sectionRadius = 12;
    }
    return self;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sectionRadius <= 0) {
        return;
    }
    
    CGRect bounds = cell.bounds;
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    
    // 组头
    UIView *view = [self tableView:tableView viewForHeaderInSection:indexPath.section];

    //绘制曲线
    UIBezierPath *bezierPath = nil;
    
    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(20, 20)];

    cell.backgroundColor = [UIColor clearColor];
    //新建一个layer层,设置填充色和边框颜色
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    
    //将layer层添加到cell.layer中,并插到最底层
    [cell.layer insertSublayer:layer atIndex:0];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    return cell;
}



@end
