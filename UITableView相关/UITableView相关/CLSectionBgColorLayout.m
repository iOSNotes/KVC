//
//  CLSectionBgColorLayout.m
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "CLSectionBgColorLayout.h"

static NSString *const CLLayoutBackgroundView = @"CLLayoutBackgroundView";


@interface CLCollectionViewBackgroundAttributes : UICollectionViewLayoutAttributes

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat borderRadius;
@property (nonatomic, assign) UIEdgeInsets margin;

@end

@implementation CLCollectionViewBackgroundAttributes



@end

@interface CLLayoutBackgroundColorReusableView:UICollectionReusableView


@end

@implementation CLLayoutBackgroundColorReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    if ([layoutAttributes isKindOfClass:[CLCollectionViewBackgroundAttributes class]]) {
        CLCollectionViewBackgroundAttributes *attr = (CLCollectionViewBackgroundAttributes *)layoutAttributes;
        self.backgroundColor = attr.backgroundColor;
        self.layer.cornerRadius = attr.borderRadius;
        self.layer.masksToBounds = YES;
    }
}
@end



@interface CLSectionBgColorLayout ()

@property (nonatomic, strong) NSMutableArray *decorationViews;
@property (nonatomic, strong) NSMutableArray *cellItemAttrs;

@end

@implementation CLSectionBgColorLayout


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.decorationViews = [NSMutableArray new];
        self.cellItemAttrs = [NSMutableArray new];
    }
    return self;
}

- (CGFloat)borderRadiusWithSection:(NSInteger)section {
    CGFloat radius = self.borderRadius;
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:borderRadiusForSection:)]) {
        radius = [self.delegate collectionView:self.collectionView layout:self borderRadiusForSection:section];
    }
    return radius;
}


- (void)prepareLayout {
    [super prepareLayout];
    
    // 如果没有实现代理 就不执行了
    if (!self.collectionView.delegate || ![self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:backgroundColorForSection:)]) {
        return;
    }
    
    [self.decorationViews removeAllObjects];
    [self registerClass:[CLLayoutBackgroundColorReusableView class] forDecorationViewOfKind:CLLayoutBackgroundView];
    NSInteger section = [self.collectionView numberOfSections];
    
    UICollectionViewLayoutAttributes *prevAttr = [UICollectionViewLayoutAttributes new];
    for (int i = 0; i < section; i++) {
        NSInteger row = [self.collectionView numberOfItemsInSection:i];
        if (row == 0) {
            continue;
        }
        
        UICollectionViewLayoutAttributes *firstAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
        UICollectionViewLayoutAttributes *lastAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:row - 1 inSection:i]];
       
        UIEdgeInsets insets =  [self getEdgeInsetsSpaceWithSection:i];
        CGRect frame = CGRectUnion(firstAttr.frame, lastAttr.frame);
        
        CGFloat x = 0;
        CGFloat y = CGRectGetMaxY(prevAttr.frame) + insets.top;
        CGFloat width = CGRectGetWidth(self.collectionView.frame);
        CGFloat height = CGRectGetHeight(frame);

        CLCollectionViewBackgroundAttributes *attr = [CLCollectionViewBackgroundAttributes layoutAttributesForDecorationViewOfKind:CLLayoutBackgroundView withIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        attr.frame =  CGRectMake(x, y, width, height);
        attr.zIndex = -1;
        id <CLFlowLayoutDelegate> delegate = (id <CLFlowLayoutDelegate>)self.collectionView.delegate;
        attr.backgroundColor = [delegate collectionView:self.collectionView layout:self backgroundColorForSection:i];
        attr.borderRadius = [self borderRadiusWithSection:i];
        prevAttr = attr;
        [self.decorationViews addObject:attr];
        
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
     NSMutableArray *attrs = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for (UICollectionViewLayoutAttributes *attr in self.decorationViews) {

        if (CGRectIntersectsRect(rect, attr.frame)) {
            [attrs addObject:attr];
        }
    }
    return attrs;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
         
    if ([elementKind isEqualToString:CLLayoutBackgroundView]) {
        return [self.decorationViews objectAtIndex:indexPath.section];
    }
    
    return [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
}


@end
