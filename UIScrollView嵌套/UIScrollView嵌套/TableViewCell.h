//
//  TableViewCell.h
//  UIScrollView嵌套
//
//  Created by 秦传龙 on 2020/9/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewCellDelegate <NSObject>

- (void)webscrollViewDidScroll:(UIScrollView *)scrollView;
@end


@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate;
@property (nonatomic, strong)  WKWebView *webview;

@end

NS_ASSUME_NONNULL_END
