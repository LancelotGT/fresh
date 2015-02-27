//
//  AddFoodViewController.m
//  Fresh
//
//  Created by Ning Wang on 15-2-20.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "AddFoodViewController.h"
#import "ViewController.h"
#import "Food.h"
#import <Parse/Parse.h>

@interface AddFoodViewController ()

@end

@implementation AddFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)eggButtonClicked:(UIButton *)sender {
    [self queryForData:@"egg"];
}

- (IBAction)appleButtonClicked:(UIButton *)sender {
    [self queryForData:@"apple"];
}

- (void) queryForData: (NSString *) title {
    PFQuery *query = [PFQuery queryWithClassName:@"Default"];
    //__block id expDate;
    [query whereKey:@"type" equalTo:title];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            for (PFObject *object in objects) {
                NSLog(@"Object ID: %@", object.objectId);
                NSLog(@"Food type: %@", object[@"type"]);
                NSLog(@"Expiraton date: %@", object[@"date"]);
                id expDate = object[@"date"];
                NSString *alertMessage = [[NSString alloc] initWithFormat:@"The food will expire after %@ days!", expDate];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Food Details" message: alertMessage delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
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
