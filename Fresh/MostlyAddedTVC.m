//
//  MostlyAddedTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "MostlyAddedTVC.h"
#import "MultipleFoodTableViewCell.h"

@interface MostlyAddedTVC ()

@end

@implementation MostlyAddedTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mostly Added Food Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.imageView1.image = [UIImage imageNamed:@"egg"];
    cell.imageView2.image = [UIImage imageNamed:@"apple"];
    cell.imageView3.image = [UIImage imageNamed:@"milk"];
    cell.imageView4.image = [UIImage imageNamed:@"muffin"];
    
    return cell;
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
