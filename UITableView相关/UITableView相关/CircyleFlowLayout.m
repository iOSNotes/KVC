//
//  CircyleFlowLayout.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/10.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CircyleFlowLayout.h"

@implementation CircyleFlowLayout

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        self.attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    [self.attrsArray removeAllObjects];
    NSInteger rows = [self.collectionView numberOfItemsInSection:0];
       for (int i = 0; i < rows; i++) {
           NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
           NSInteger rows = [self.collectionView numberOfItemsInSection:indexPath.section];
           //圆心x
           CGFloat oX = self.collectionView.frame.size.width * 0.5;
           //圆心y
           CGFloat oY = self.collectionView.frame.size.height * 0.5;
           
           CGFloat width = self.collectionView.frame.size.width;
           CGFloat hegiht = self.collectionView.frame.size.height;
           //宽度直径
           CGFloat widthDismeter = width - self.sectionInset.left - self.sectionInset.right;
           //高度直径
           CGFloat hegihtDismeter = hegiht - self.sectionInset.top - self.sectionInset.bottom;
           //圆的半径
           CGFloat raduis = (widthDismeter > hegihtDismeter ? hegihtDismeter : widthDismeter) * 0.5 - (self.itemSize.width > self.itemSize.height ? self.itemSize.height : self.itemSize.width) * 0.5;
           //计算cell的布局属性
           UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
           attrs.size = self.itemSize;
           CGFloat angle = 2 * M_PI / rows * indexPath.item;
           CGFloat centerX = oX + raduis * sin(angle);
           CGFloat centerY = oY + raduis * cos(angle);
           attrs.center = CGPointMake(centerX, centerY);
           attrs.transform = CGAffineTransformMakeRotation(-angle);
           [self.attrsArray addObject:attrs];
    }
}


- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"%@", NSStringFromCGRect(rect));
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}


@end
