//
//  Food.m
//  Fresh
//
//  Created by Ning Wang on 15-3-1.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "Food.h"

@implementation Food

@synthesize type = _type;
@synthesize expTime = _expTime;
@synthesize foodID = _foodID;

+ (NSArray *)validFoodTypes {
    return @[@"apple", @"egg", @"milk", @"muffin"];
}

//+ (Food *)initWithType:(NSString *)type ExpTime:(NSString *)expTime FoodID:(NSString *)foodID {
//    food = [[Food alloc] init];
//    food.type = type;
//    fo
//}

- (NSString *)contents {
    return [self.foodID stringByAppendingString:self.type];
}

- (void)setType:(NSString *)type {
    if ([[Food validFoodTypes] containsObject:type]) {
        _type = type;
    }
}

- (NSString *)type {
    return _type ? _type: @"?";
}

@end
