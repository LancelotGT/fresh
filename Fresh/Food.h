//
//  Food.h
//  Fresh
//  This is a class for representing food.
//  Created by Ning Wang on 15-2-20.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic, getter=isGood) BOOL good;
@end
