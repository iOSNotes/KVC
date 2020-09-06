//
//  CollectionViewController.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/5.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CollectionViewController.h"
#import "CLWaterfallFlowLayout.h"
#import "CLSectionBgColorLayout.h"
#import "CLCycleView.h"
#import "CircyleFlowLayout.h"

@interface CollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CLFlowLayoutDelegate >


@property (nonatomic, strong) CLCycleView *cycleView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
//    CircyleFlowLayout *flowLayout = [CircyleFlowLayout new];
//    flowLayout.borderRadius = 12;
//    CLWaterfallFlowLayout *flowLayout = [CLWaterfallFlowLayout new];
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame)) collectionViewLayout:flowLayout];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    collectionView.showsHorizontalScrollIndicator = NO;
//    collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
//    [self.view addSubview:collectionView];
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
//    collectionView.center = self.view.center;
    self.cycleView = [[CLCycleView alloc] init];
    self.cycleView.imagesList = @[@"1",@"2",@"3"];
    self.cycleView.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 240);
    [self.view addSubview:self.cycleView];
    
//
//    CGFloat r = 120;
//    CGFloat deg = M_PI / 6;
//    CGPoint center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 400);
//    CGSize size = CGSizeMake(50, 80);
//
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = bezierPath.CGPath;
//    layer.strokeColor =  [UIColor blackColor].CGColor;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    [self.view.layer addSublayer:layer];
//
//    NSInteger num = M_PI * 2 / deg;
//    for (int i = 0; i < num; i++) {
//        deg += deg;
//
//         CGFloat targetX = center.x - (cos(deg) * r + size.height / 2);
//            CGFloat targetY = center.y - (sin(deg) * r + size.width / 2);
//            UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
//            [bezierPath1 moveToPoint:CGPointMake(targetX, targetY)];
//            [bezierPath1 addLineToPoint:CGPointMake(targetX, targetY + size.height)];
//            [bezierPath1 addLineToPoint:CGPointMake(targetX + size.width, targetY + size.height)];
//            [bezierPath1 addLineToPoint:CGPointMake(targetX + size.width, targetY)];
//            [bezierPath1 closePath];
//
//        NSLog(@"%f, %f", targetY, targetX);
//
//            CAShapeLayer *layer1 = [CAShapeLayer layer];
//        //    layer1.frame = CGRectMake(0, 0, size.width, size.height);
//            layer1.path = bezierPath1.CGPath;
//            layer1.strokeColor =  [UIColor blackColor].CGColor;
//            layer1.fillColor = [UIColor redColor].CGColor;
//            [self.view.layer addSublayer:layer1];
//            layer1.backgroundColor = [UIColor redColor].CGColor;
//
//    }
//
    
   
//    layer1.transform = CATransform3DMakeRotation(deg, 0, 0, 1);
    
    
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 8;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 160;

//    return CGSizeMake(CGRectGetWidth(collectionView.frame) / 3 - 20 , height);
    return CGSizeMake(50, 50);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(12, 12, 0, 12);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader ]) {
            
    }
    return nil;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section {
    if (section == 0) {
        return [UIColor cyanColor];
    }
    return [UIColor grayColor];
}

- (CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout borderRadiusForSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 30;
}


- (NSInteger)flowLayout:(CLWaterfallFlowLayout *)layout section:(NSInteger)section {
    return 2;
}


@end
