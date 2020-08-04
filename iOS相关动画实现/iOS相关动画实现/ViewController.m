//
//  ViewController.m
//  iOS相关动画实现
//
//  Created by 秦传龙 on 2020/7/30.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;

@end


@interface Person : NSObject

@end
@implementation Person


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self didInitializeView];
    
    self.dataSource = @[
        @{
            @"title":@"仪表盘",
            @"className": @"DashboardVC"
        },
        @{
            @"title":@"TabBar",
            @"className": @"TabBarViewController"
        },
        @{
            @"title":@"loading动画",
            @"className": @"LoadingViewController"
        }
        
    ];
    [self.tableView reloadData];
}



- (void)didInitializeView {
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item =  self.dataSource[indexPath.row];
    Class cl = NSClassFromString(item[@"className"]);
    UIViewController *vc = [cl new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
