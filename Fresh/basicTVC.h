//
//  basicTVC.h
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface basicTVC : UITableViewController
@property (nonatomic, strong) NSArray *contents;

- (void) setContents:(NSArray *)contents;
@end
