//
//  SettingTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-4-16.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Setting interface
// Includes three rows: Disenable expired food image, Time for notification, About.

#import "SettingTVC.h"
#import "AppDelegate.h"

@interface SettingTVC ()
@property (weak, nonatomic) IBOutlet UISwitch *enableExpiredFoodImage;

@end

@implementation SettingTVC
- (IBAction)changeSwitch:(UISwitch *)sender {
    ((AppDelegate *)[UIApplication sharedApplication].delegate).enableExpiredFoodImage = sender.on;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.enableExpiredFoodImage setOn:((AppDelegate *)[UIApplication sharedApplication].delegate).enableExpiredFoodImage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


@end
