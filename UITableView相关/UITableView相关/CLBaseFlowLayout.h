//
//  CLBaseFlowLayout.h
//  UITableView相关
//
//  Created by 秦传龙 on 2020/8/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLFlowLayoutDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface CLBaseFlowLayout : UICollectionViewFlowLayout


- (CGSize)getItemSizeWithIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)getEdgeInsetsSpaceWithSection:(NSInteger )section;

- (NSInteger)getColumsCountWithSection:(NSInteger)section;

- (CGFloat)getMinimumLineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)getMinimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

- (id <CLFlowLayoutDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
