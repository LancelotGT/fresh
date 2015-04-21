//
//  MultipleFoodTableViewCell.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Configures the cell of the table view
// Each cell contains four buttons, representing four food.

#import "MultipleFoodTableViewCell.h"

@implementation MultipleFoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 8, 50, 45)];
    [self.contentView addSubview:self.button1];
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 8, 50, 45)];
    [self.contentView addSubview:self.button2];
    
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(210, 8, 50, 45)];
    [self.contentView addSubview:self.button3];
    
    self.button4 = [[UIButton alloc] initWithFrame:CGRectMake(310, 8, 50, 45)];
    [self.contentView addSubview:self.button4];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
