
//
//  PageTableViewCell.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/13.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "PageTableViewCell.h"
#import "PageCollectionViewCell.h"

@interface PageTableViewCell ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end



@implementation PageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    
    
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.collectionView];
        
        [self.collectionView registerClass:[PageCollectionViewCell class] forCellWithReuseIdentifier:@"PageCollectionViewCell"];
        self.dataSource = [@[@"1",@"2"] mutableCopy];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PageCollectionViewCell" forIndexPath:indexPath];
    return cell;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
