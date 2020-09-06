//
//  ViewController.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/5.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (IBAction)scrollViewAction:(UIButton *)sender {
    [self.navigationController pushViewController:[NSClassFromString(@"TableViewController") new] animated:YES];
}


- (IBAction)goCollectionView:(id)sender {
    CollectionViewController *vc = [CollectionViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
