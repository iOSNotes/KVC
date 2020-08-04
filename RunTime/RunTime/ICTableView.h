//
//  ICTableView.h
//  RunTime
//
//  Created by 秦传龙 on 2020/7/25.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

// 顶部和尾部是否需要切圆角
@property (nonatomic, assign) BOOL isTopAndBottomRadius;
// 分组的圆角大小 默认12px
@property (nonatomic, assign) CGFloat sectionRadius;



@end

NS_ASSUME_NONNULL_END
