//
//  ViewController.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/22.
//  Copyright © 2020 秦传龙. All rights reserved.
//

/**
 工具类说明：
 1.获取所有类的属性：主要使用class_copyPropertyList 获取属性列表 遍历  后获取到propertyName集合。
 
 2.打印出所有类的属性： 通过swizzing交换description方法为swizzing_description， 在swizzing_description方法中获取所有分类的propertyName，然后通过KVC获取对应的value。拼接后打印出来即可
 具体可参考：NSObject+CLProperty类
 
 
 
 */

#import "ViewController.h"
#import "TableViewCell.h"
#import "ArchiveVC.h"
#import "ICTableView.h"
#import "Tools.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self didInitializeView];
    
}

- (void)loadData {
    self.dataArray = @[
        @{
            @"title": @"模仿MJExtension实现归档接档",
            @"className": @"ArchiveVC",
        },
        @{
            @"title": @"给分类添加属性(关联)",
            @"className": @"AddPropertyVC",
        },
        @{
            @"title": @"字段转模型",
            @"className": @"KeyValueVC"
        }
        
    ];
}

- (void)didInitializeView {
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = self.dataArray[indexPath.row][@"className"];
    UIViewController *cl = [NSClassFromString(className) new];
    [self.navigationController pushViewController:cl animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 60;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 12;
    }
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 60)];
        view.backgroundColor = [UIColor whiteColor];
        view.text = @"我是头部";
        return view;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 60)];
        view.backgroundColor = [UIColor whiteColor];
        view.text = @"我是尾部";
        return view;
    }
    return nil;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    CGRect bounds = view.bounds;
    
    if (CGRectEqualToRect(bounds, CGRectZero)) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(12, 12)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    view.layer.mask = layer;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    CGRect bounds = view.bounds;
    if (view && CGRectEqualToRect(bounds, CGRectZero)) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(12, 12)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    view.layer.mask = layer;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cornerRadius =10.0;
    CGRect bounds = cell.bounds;
    
    // 每区行数
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    // 区头
    UIView *headerView = nil;
    if (self && [self respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        headerView = [self tableView:tableView viewForHeaderInSection:indexPath.section];
    }
    UIView *footerView = nil;
    if (self && [self respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        footerView = [self tableView:tableView viewForFooterInSection:indexPath.section];
    }
    
    //绘制曲线
    UIBezierPath *bezierPath = nil;
    
    if (indexPath.row == 0 && numberOfRows == 1) {
        // 一个区只有一行cell
        if (headerView == nil && footerView == nil) {
            //四个角都为圆角
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        } else if (headerView != nil && footerView != nil){
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        } else if (headerView != nil){
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        } else {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
    } else if (indexPath.row == 0) {
        // 某个区的第一行
        if (headerView != nil) {
            // 有区头：为矩形
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        }else{
            //左上、右上角为圆角
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
    } else if (indexPath.row == numberOfRows - 1) {
        //某个区的最后一行：左下、右下角为圆角
        if (footerView != nil) {
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        } else {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
    } else {
        //某个区的中间行：为矩形
        bezierPath = [UIBezierPath bezierPathWithRect:bounds];
    }
    
    //新建一个layer层,设置填充色和边框颜色
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    cell.layer.mask = layer;
}

@end
