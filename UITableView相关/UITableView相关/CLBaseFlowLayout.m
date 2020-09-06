//
//  CLBaseFlowLayout.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CLBaseFlowLayout.h"

@implementation CLBaseFlowLayout


- (CGSize)getItemSizeWithIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = self.itemSize;
    
    if (self.collectionView.delegate && [self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        itemSize = [(id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    
    NSInteger colums = [self getColumsCountWithSection:indexPath.section];
    CGFloat itemSpacing = [self getMinimumInteritemSpacingForSectionAtIndex:indexPath.section];
    UIEdgeInsets insets = [self getEdgeInsetsSpaceWithSection:indexPath.section];
    CGFloat width = (CGRectGetWidth(self.collectionView.frame) - itemSpacing * (colums - 1) - insets.left - insets.right) / colums;
    return CGSizeMake(width, itemSize.height);
}

- (UIEdgeInsets)getEdgeInsetsSpaceWithSection:(NSInteger )section {
    UIEdgeInsets insets = self.sectionInset;
    if (self.collectionView.delegate && [self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        id <UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
        insets = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }
    return insets;
}

- (NSInteger)getColumsCountWithSection:(NSInteger)section {
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(flowLayout:section:)]) {
        id <CLFlowLayoutDelegate> delegate = (id <CLFlowLayoutDelegate>)self.collectionView.dataSource;
      return  [delegate flowLayout:self section:section];
    }
    return 0;
}

- (CGFloat)getMinimumLineSpacingForSectionAtIndex:(NSInteger)section {
    CGFloat minimumLineSpacing = self.minimumLineSpacing;
    if (self.collectionView.delegate && [self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        id <UICollectionViewDelegateFlowLayout> layoutDelegate = ( id <UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
        minimumLineSpacing = [layoutDelegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }
    return minimumLineSpacing;
}

- (CGFloat)getMinimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
 
    CGFloat itemSpacing = self.minimumInteritemSpacing;
    if (self.collectionView.delegate && [self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        id <UICollectionViewDelegateFlowLayout> layoutDelegate = ( id <UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
        itemSpacing = [layoutDelegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    return itemSpacing;
}

- (id <CLFlowLayoutDelegate>)delegate {
    return (id <CLFlowLayoutDelegate>)self.collectionView.delegate;
}


@end
