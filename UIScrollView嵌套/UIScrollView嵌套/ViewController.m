//
//  ViewController.m
//  UIScrollView嵌套
//
//  Created by 秦传龙 on 2020/9/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "CLTableView.h"
#import "TableViewCell.h"
#import <WebKit/WebKit.h>

static NSInteger const maxHeight = 200;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITableViewCellDelegate>
{
    BOOL _canScroll : YES;
}


@property (nonatomic, strong) CLTableView *tableView;
@property (nonatomic, strong) WKWebView *subScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[CLTableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"tableView"];
    [self.view addSubview:self.tableView];
    
    self.tableView.sectionHeaderHeight = maxHeight;
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, maxHeight)];
    view.image = [UIImage imageNamed:@"timg.jpeg"];
    view.backgroundColor = [UIColor cyanColor];
    self.tableView.tableHeaderView =view;
    self.tableView.rowHeight = self.view.frame.size.height;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableView"];
    cell.delegate = self;
    self.subScrollView = cell.webview;
    return cell;
}

- (void)webscrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y <= 0) {
        _canScroll = YES;
    }
    if (_canScroll) {
         scrollView.contentOffset = CGPointMake(0, 0);
    }
    scrollView.showsVerticalScrollIndicator = !_canScroll;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= maxHeight) {
        _canScroll = NO;
    }
    if (!_canScroll) {
        scrollView.contentOffset = CGPointMake(0, maxHeight);
    }
    scrollView.showsVerticalScrollIndicator = _canScroll;

}


@end
