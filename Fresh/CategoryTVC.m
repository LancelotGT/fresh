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
#import "Constants.h"

@interface CategoryTVC ()
@end

@implementation CategoryTVC

//- (NSMutableArray *) allFoodsCollection {
//    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
//    f.numberStyle = NSNumberFormatterDecimalStyle;
//    NSNumber *number = [f numberFromString:@"10"];
//    if (!_allFoodsCollection) {
//        Food2* food1 = [Food2 alloc];
//        food1.expire_period = number;
//        NSLog(@"exp date %@", food1.expire_period);
//        _allFoodsCollection = [[NSMutableArray alloc] init];
//        [_allFoodsCollection addObject:food1];
//    }
//    return _allFoodsCollection;
//}

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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) return 3;
    else if (section == 1) return 1;
    else return 2;
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
            [cell.button1 setImage:[UIImage imageNamed:@"onion"] forState:UIControlStateNormal];
            cell.button1.tag = 0;
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.button2 setImage:[UIImage imageNamed:@"broccoli"] forState:UIControlStateNormal];
            [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button2.tag = 1;
            
            [cell.button3 setImage:[UIImage imageNamed:@"carrot"] forState:UIControlStateNormal];
            [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button3.tag = 2;
            
            [cell.button4 setImage:[UIImage imageNamed:@"tomato"] forState:UIControlStateNormal];
            [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button4.tag = 3;
        } else if (indexPath.row == 1) {
            [cell.button1 setImage:[UIImage imageNamed:@"cucumber"] forState:UIControlStateNormal];
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button1.tag = 4;
            
            [cell.button2 setImage:[UIImage imageNamed:@"lettuce"] forState:UIControlStateNormal];
            [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button2.tag = 5;
            
            [cell.button3 setImage:[UIImage imageNamed:@"bean"] forState:UIControlStateNormal];
            [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button3.tag = 6;
            
            [cell.button4 setImage:[UIImage imageNamed:@"red pepper"] forState:UIControlStateNormal];
            [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button4.tag = 7;
        } else if (indexPath.row == 2) {
            [cell.button1 setImage:[UIImage imageNamed:@"cabbage"] forState:UIControlStateNormal];
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button1.tag = 8;
            
            [cell.button2 setImage:[UIImage imageNamed:@"cauliflower"] forState:UIControlStateNormal];
            [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button2.tag = 9;
            
            [cell.button3 setImage:[UIImage imageNamed:@"pumpkin"] forState:UIControlStateNormal];
            [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button3.tag = 10;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [cell.button1 setImage:[UIImage imageNamed:@"apple"] forState:UIControlStateNormal];
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button1.tag = 11;
            
            [cell.button2 setImage:[UIImage imageNamed:@"pear"] forState:UIControlStateNormal];
            [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button2.tag = 12;
            
            [cell.button3 setImage:[UIImage imageNamed:@"honey peach"] forState:UIControlStateNormal];
            [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button3.tag = 13;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [cell.button1 setImage:[UIImage imageNamed:@"milk"] forState:UIControlStateNormal];
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button1.tag = 14;
            
            [cell.button2 setImage:[UIImage imageNamed:@"egg"] forState:UIControlStateNormal];
            [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button2.tag = 15;
            
            [cell.button3 setImage:[UIImage imageNamed:@"potato"] forState:UIControlStateNormal];
            [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button3.tag = 16;
            
            [cell.button4 setImage:[UIImage imageNamed:@"muffin"] forState:UIControlStateNormal];
            [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button4.tag = 17;
        } else if(indexPath.row == 1) {
            [cell.button1 setImage:[UIImage imageNamed:@"bread"] forState:UIControlStateNormal];
            [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            cell.button1.tag = 18;
        }
    }
    
    return cell;
}

- (void) addFoodButtonPressed: (UIButton *)sender {
    NSInteger t = (NSInteger) [[Constants ArrayOfFoodExpirePeriod] objectAtIndex:sender.tag];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Food Information"
                                                    message:@"Number of best days"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];

    [alert addButtonWithTitle:@"Confirm"];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textFieldInit = [alert textFieldAtIndex:0];
    textFieldInit.placeholder = [NSString stringWithFormat: @"%@", t];
    
    if ([textFieldInit.text intValue] > 0 || [textFieldInit.text intValue] < 365) {
        t = [textFieldInit.text intValue];
    }
    
    NSLog(@"The user input expiration date is %@", t);
    
    [alert show];
}


@end
