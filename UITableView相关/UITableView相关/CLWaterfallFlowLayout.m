//
//  ScaleFlowLayout.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/5.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CLWaterfallFlowLayout.h"

@interface CLWaterfallFlowLayout ()

@property (nonatomic, strong) NSMutableArray *attributiesList;
@property (nonatomic, strong) NSMutableArray *columnHeights;


@end


@implementation CLWaterfallFlowLayout



- (void)prepareLayout {
    [super prepareLayout];
     [self reloadFlowLayoutAttribute];
}



- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"%@", NSStringFromCGRect(rect));

    return self.attributiesList;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), [self getMaxY]);
}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    NSLog(@"%s --- %@   -%@", __func__, NSStringFromCGPoint(proposedContentOffset), NSStringFromCGPoint(velocity));
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    NSLog(@"%s --- %@", __func__, NSStringFromCGPoint(proposedContentOffset));
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset];
}


- (CGFloat)getMaxY {
    CGFloat maxY = -1;
       for (int i = 0; i < self.columnHeights.count; i++) {
         CGFloat y = [self.columnHeights[i] floatValue];
           if (y > maxY) {
               maxY = y;
           }
       }
       return maxY;
}

- (NSMutableArray *)columnHeights {
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray new];
    }
    return _columnHeights;
}

- (NSMutableArray *)attributiesList {
    if (!_attributiesList) {
        _attributiesList = [NSMutableArray new];
    }
    return _attributiesList;
}

- (void)reloadFlowLayoutAttribute {
    [self.attributiesList removeAllObjects];
       [self.columnHeights removeAllObjects];
       NSInteger section = [self.collectionView numberOfSections];

       for (int sectionIdx = 0; sectionIdx < section; sectionIdx++) {
           CGFloat lineSpacing = [self getMinimumLineSpacingForSectionAtIndex:sectionIdx];
           CGFloat itemSpacing = [self getMinimumInteritemSpacingForSectionAtIndex:sectionIdx];
           UIEdgeInsets insets = [self getEdgeInsetsSpaceWithSection:sectionIdx];
           NSInteger colums = [self getColumsCountWithSection:sectionIdx];
           if (colums == 0) {
               break;;
           }
           for (int i = 0; i < colums; i ++) {
               [self.columnHeights addObject:@(insets.top)];
           }
           
           CGFloat x = insets.left;
           CGFloat y = insets.top;
           
           NSInteger row = [self.collectionView numberOfItemsInSection:sectionIdx];
           for (int rowIdx = 0; rowIdx < row; rowIdx ++) {
               NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIdx inSection:sectionIdx];
               CGSize itemSize = [self getItemSizeWithIndexPath:indexPath];
               UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
               
               CGFloat minY = [self.columnHeights[0] doubleValue];
               NSInteger minRow = 0;
               for (int i = 0; i < colums; i++) {
                   if ([self.columnHeights[i] floatValue] < minY) {
                       minY = [self.columnHeights[i] floatValue];
                       minRow = i;
                   }
               }
               
               x = minRow *(itemSpacing + itemSize.width) + insets.left;
               y = minY + lineSpacing;
                           
               attributes.frame = CGRectMake(x, y, itemSize.width, itemSize.height);
               self.columnHeights[minRow] = @(y + itemSize.height);
               [self.attributiesList addObject:attributes];
           }
       }
}



@end
