//
//  CLFlowLayoutProtocol.h
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLBaseFlowLayout;

NS_ASSUME_NONNULL_BEGIN

@protocol CLFlowLayoutDelegate <NSObject>

@optional;
// 返回分组瀑布流的列数
- (NSInteger)flowLayout:(CLBaseFlowLayout *)layout section:(NSInteger)section;

// 返回组的背景色
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section;

// 返回组的圆角
- (CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout borderRadiusForSection:(NSInteger)section;


@end

NS_ASSUME_NONNULL_END
