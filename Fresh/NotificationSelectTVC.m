//
//  NotificationSelectTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-4-16.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Controls view for setting notifications


#import "NotificationSelectTVC.h"
#import "AppDelegate.h"

@interface NotificationSelectTVC ()

@end

@implementation NotificationSelectTVC

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    //NSLog(@"Selected row: %d\n", (int)indexPath.row);
    ((AppDelegate *)[UIApplication sharedApplication].delegate).notificationSelectedRow = (int)indexPath.row;
    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.row == 0) cell = [tableView dequeueReusableCellWithIdentifier:@"cell0" forIndexPath:indexPath];
    else if (indexPath.row == 1) cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    else cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    if (indexPath.row == ((AppDelegate *)[UIApplication sharedApplication].delegate).notificationSelectedRow) cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}




@end
