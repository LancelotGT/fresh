//
//  Food.h
//  Fresh
//
//  Created by Ning Wang on 15-3-1.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *expTime;
@property (strong, nonatomic) NSString *foodID;
@property (strong, nonatomic) NSString *contents;

//+ (Food *)initWithType: (NSString *)type ExpTime:(NSString *)expTime FoodID: (NSString *)foodID;
@end