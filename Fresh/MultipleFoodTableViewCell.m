//
//  MultipleFoodTableViewCell.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "MultipleFoodTableViewCell.h"

@implementation MultipleFoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 50, 45)];
    [self.contentView addSubview:self.imageView1];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 8, 50, 45)];
    [self.contentView addSubview:self.imageView2];
    
    self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 8, 50, 45)];
    [self.contentView addSubview:self.imageView3];
    
    self.imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(310, 8, 50, 45)];
    [self.contentView addSubview:self.imageView4];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
