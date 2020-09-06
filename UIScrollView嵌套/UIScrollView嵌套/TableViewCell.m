//
//  TableViewCell.m
//  UIScrollView嵌套
//
//  Created by 秦传龙 on 2020/9/6.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()<UIScrollViewDelegate>

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WKWebView *webview = [[WKWebView alloc] initWithFrame:self.bounds];
        webview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:webview];
        webview.scrollView.delegate = self;
        [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/sf/vsearch?pd=video&atn=index&tn=vsearch&ss=100&sa=tb&rsv_sug4=2654&inputT=2041&oq=jiansh&word=jianshu%20"]]];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_delegate && [_delegate respondsToSelector:@selector(webscrollViewDidScroll:)]) {
        [_delegate webscrollViewDidScroll:scrollView];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
