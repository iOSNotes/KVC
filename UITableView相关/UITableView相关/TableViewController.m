//
//  TableViewController.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/5.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "TableViewController.h"
#import "PageTableViewCell.h"

@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self didInitializeView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


- (void)didInitializeView {
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        [_tableView registerClass:[PageTableViewCell class] forCellReuseIdentifier:@"PageTableViewCell"];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.tableFooterView = [UIView new];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
           view.backgroundColor = [UIColor redColor];
        _tableView.tableHeaderView = view;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageTableViewCell"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGRectGetHeight(self.view.frame) - 50 - 34 - 88;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50)];
   view.backgroundColor = [UIColor grayColor];
    return view;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    if (y <= 0) {
        self.tableView.contentOffset = CGPointMake(0, 0);
    } else if (y >= self.tableView.tableHeaderView.frame.size.height) {
        self.tableView.contentOffset = CGPointMake(0, self.tableView.tableHeaderView.frame.size.height);
    }
}

@end
