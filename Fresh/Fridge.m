//
//  Fridge.m
//  Fresh
//
//  Created by Ning Wang on 15-2-20.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "Fridge.h"
#import "Food.h"

@interface Fridge()

@end

@implementation Fridge

- (NSMutableArray *) foodList {
    if (!_foodList) _foodList = [[NSMutableArray alloc] init];
    return _foodList;
}

- (void) addFood: (Food *)food {
    [self.foodList insertObject:food atIndex:0];
}

- (void) removeFood: (Food *)food {
    [self.foodList removeObject:food];
}

@end
