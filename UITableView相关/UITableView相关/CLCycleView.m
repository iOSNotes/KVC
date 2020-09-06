
//
//  CLCycleView.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/10.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CLCycleView.h"

@interface CLCycleViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;

@end

@implementation CLCycleViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:label];
        self.label = label;
        self.label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end



@interface CLCycleView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger active;

@end


@implementation CLCycleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
        UICollectionViewFlowLayout *layour = [[UICollectionViewFlowLayout alloc] init];
        layour.minimumLineSpacing = 0;
        layour.minimumInteritemSpacing = 0;
        layour.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layour];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.pagingEnabled = YES;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[CLCycleViewCell class] forCellWithReuseIdentifier:@"CLCycleViewCell"];
    }
    return self;
}

- (void)startTimer {
    
    self.active += 1;
    if (self.active >= self.imagesList.count ) {
         [self scrollTo];
    } else {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.active inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    
//
    
}

- (void)setImagesList:(NSArray *)imagesList {
    
    if (imagesList.count > 0) {
        NSMutableArray *marr = [imagesList mutableCopy];
        [marr insertObject:imagesList[imagesList.count - 1] atIndex:0];
        [marr addObject:imagesList[0]];
        _imagesList = [marr copy];
        
    } else {
        _imagesList = imagesList;
    }
    [self.collectionView reloadData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
    
}



#pragma mark --- UICollectionViewDelegateFlowLayout&&UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CLCycleViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CLCycleViewCell" forIndexPath:indexPath];
    cell.label.text =self.imagesList[indexPath.row];
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.active = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame) ;
    [self scrollTo];
}

- (void)scrollTo {
    if (self.active <= 0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imagesList.count-2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        self.active = self.imagesList.count-2;
    } else if (self.active >= self.imagesList.count - 1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
         self.active = 1;
    }
}

@end
