//
//  CategoryTVC.h
//  Fresh
//
//  Created by Ning Wang on 15-3-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTVC : UITableViewController <UIAlertViewDelegate, UIPickerViewDelegate>
@property(nonatomic) int addToSelectedIndex;
@property(nonatomic) int addFromSelectedIndex;
@end
