//
//  Food2.h
//  Fresh
//
//  Created by 星 冯 on 3/19/15.
//  Copyright (c) 2015 Fortune Cookies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Food2 : NSManagedObject

@property (nonatomic, retain) NSString * foodname;
@property (nonatomic, retain) NSString * food_id;
@property (nonatomic, retain) NSString * store_place;
@property (nonatomic, retain) NSNumber * expire_period;
@property (nonatomic, retain) NSDate * add_time;
@property (nonatomic, retain) NSString * image_id;

@end
