//
//  CategoryTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-3-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "CategoryTVC.h"
#import "MultipleFoodTableViewCell.h"
#import "Food2.h"

@interface CategoryTVC ()

@end

@implementation CategoryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *category = @"Default";
    if (section == 0) category = @"Vegetable";
    else if (section == 1) category = @"Fruit";
    return [NSString stringWithFormat:@"Category: %@", category];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Category Food Cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cell.button1 setImage:[UIImage imageNamed:@"broccoli"] forState:UIControlStateNormal];
            [cell.button1 setImage:[UIImage imageNamed:@"onion"] forState:UIControlStateNormal];
        } else if (indexPath.row == 1) {
            [cell.button1 setImage:[UIImage imageNamed:@"tomato"] forState:UIControlStateNormal];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [cell.button1 setImage:[UIImage imageNamed:@"apple"] forState:UIControlStateNormal];
            [cell.button2 setImage:[UIImage imageNamed:@"pear"] forState:UIControlStateNormal];
        }
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
