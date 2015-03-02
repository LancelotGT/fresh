//
//  FoodCollection.m
//  Fresh
//
//  Created by Ning Wang on 15-3-1.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "FoodCollection.h"

@interface FoodCollection()
@property (strong, nonatomic) NSMutableArray *foods;

@end
@implementation FoodCollection


- (NSMutableArray *)foods {
    if (!_foods) _foods = [[NSMutableArray alloc] init];
    return _foods;
}

- (void)addFood:(Food *)food atTop:(BOOL)atTop {
    NSLog(@"!!!!!%@", food.type);
    if (atTop) {
        [self.foods insertObject:food atIndex:0];
    } else {
        [self.foods addObject:food];
    }
}

- (void)addFood:(Food *)food {
    NSLog(@"!!!!!%@", food.type);
    [self addFood:food atTop:NO];
}

- (Food *)FoodAtIndex:(NSInteger)index {
    return [self.foods objectAtIndex:index];
}

- (NSInteger) foodCount {
    return [self.foods count];
}
@end
