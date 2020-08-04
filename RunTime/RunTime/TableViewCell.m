//
//  TableViewCell.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/22.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    NSKeyedArchiveRootObjectKey
    
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
