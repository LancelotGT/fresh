//
//  MostlyAddedTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Add food from mostly added items

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
    
    return cell;
}


@end
