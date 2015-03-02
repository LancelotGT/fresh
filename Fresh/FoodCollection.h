//
//  FoodCollection.h
//  Fresh
//
//  Created by Ning Wang on 15-3-1.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"

@interface FoodCollection : NSObject

- (NSInteger) foodCount;

- (void)addFood:(Food *)food atTop:(BOOL)atTop;

- (void)addFood:(Food *)food;

- (Food *)FoodAtIndex: (NSInteger) index;

@end
