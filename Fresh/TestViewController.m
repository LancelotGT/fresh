//
//  TestViewController.m
//  Fresh
//
//  Created by 星 冯 on 3/19/15.
//  Copyright (c) 2015 Fortune Cookies. All rights reserved.
//

#import "TestViewController.h"
#import <UIKit/UIKit.h>
//#import "EventCenterTableViewController.h"
#import <RestKit/RestKit.h>
#import "Food2.h"

@interface TestViewController ()
@property (strong, nonatomic)NSMutableArray *foods;

@property (weak, nonatomic) IBOutlet UILabel *itHas;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadFood];
}
- (IBAction)check {
    for(Food2* food in self.foods) {
        NSLog(@"the food id is %@",food.food_id);
        
        NSLog(@"the food name is %@",food.foodname);
        NSLog(@"the food store_place is %@",food.store_place);
        NSLog(@"the food add_time is %@",food.add_time);
        
        
    }

}


- (void)loadFood{
    NSString* myPath = @"/api/food/store_place/freezer";
    [[RKObjectManager sharedManager] getObjectsAtPath:myPath
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  self.foods = mappingResult.array;
                                                  NSDateFormatter* dateFormatter =[[NSDateFormatter alloc]init];
                                                  dateFormatter.dateFormat = @"YYYY-MM-dd";
                                                  
                                                  NSLog(@"finish mapping");
                                                  NSLog(@" the lengh of foods is %d",[self.foods count]);
                                                  for(Food2* food in self.foods) {
                                                      
                                                      NSDate* date = food.add_time;
                                                      NSLog(@"%@",date);
                                                      NSLog(@"the food name is %@",food.foodname);
                                                  }
                                              }
     
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"error occurred': %@", error);
                                              }];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
