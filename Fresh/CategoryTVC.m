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
#import <Restkit/RestKit.h>

@interface CategoryTVC ()
@property (nonatomic, strong) UITextField *userInputField;
@property(nonatomic, strong) Food2 * foodToPost;
@property(nonatomic, strong) NSString *lastChosenFoodName;
@property(nonatomic, strong) NSNumber *lastChosenFoodIndex;
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
    if (self.addFromSelectedIndex == 0) return 3;
    else return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (self.addFromSelectedIndex == 0) {
        if (section == 0) return 3;
        else if (section == 1) return 1;
        else return 2;
    } else return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.addFromSelectedIndex == 0) {
        NSString *category = @"Other";
        if (section == 0) category = @"Vegetable";
        else if (section == 1) category = @"Fruit";
        return [NSString stringWithFormat:@"Category: %@", category];
    } else return @"Mostly Added Items: ";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Category Food Cell" forIndexPath:indexPath];
    if (self.addFromSelectedIndex == 0) {
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
                
                [cell.button3 setImage:[UIImage imageNamed:@"beans"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 6;
                
                [cell.button4 setImage:[UIImage imageNamed:@"chillies"] forState:UIControlStateNormal];
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
                
                [cell.button3 setImage:[UIImage imageNamed:@"kiwi"] forState:UIControlStateNormal];
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
                
                [cell.button3 setImage:[UIImage imageNamed:@"potatoes"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 16;
                
                [cell.button4 setImage:[UIImage imageNamed:@"cupcake"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 17;
            } else if(indexPath.row == 1) {
                [cell.button1 setImage:[UIImage imageNamed:@"bread"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 18;
            }
        }
    } else {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"milk"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 14;
                
                [cell.button2 setImage:[UIImage imageNamed:@"egg"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 15;
                
                [cell.button3 setImage:[UIImage imageNamed:@"potatoes"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 16;
                
                [cell.button4 setImage:[UIImage imageNamed:@"cupcake"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 17;
            } else {
                [cell.button1 setImage:nil forState:UIControlStateNormal];
                [cell.button2 setImage:nil forState:UIControlStateNormal];
                [cell.button3 setImage:nil forState:UIControlStateNormal];
                [cell.button4 setImage:nil forState:UIControlStateNormal];
            }
        }
    }
    return cell;
}

- (void) addFoodButtonPressed: (UIButton *)sender {
    self.lastChosenFoodName = [[Constants ArrayOfFoodName] objectAtIndex:sender.tag];
    self.lastChosenFoodIndex = [[Constants ArrayOfFoodExpirePeriod] objectAtIndex:sender.tag];

    NSInteger t = (NSInteger) [[Constants ArrayOfFoodExpirePeriod] objectAtIndex:sender.tag];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Food Information"
                                                    message:@"Quality guarantee period"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Confirm"];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    self.userInputField = [alert textFieldAtIndex: 0];
    self.userInputField.placeholder = [NSString stringWithFormat: @"%@", t];
    
//    if ([textFieldInit.text intValue] > 0 || [textFieldInit.text intValue] < 365) {
//        t = [textFieldInit.text intValue];
//    }
    
    NSLog(@"The user input expiration date is %@", t);
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.foodToPost = [NSEntityDescription insertNewObjectForEntityForName:@"Food2" inManagedObjectContext:[RKObjectManager sharedManager].managedObjectStore.persistentStoreManagedObjectContext];
    if (buttonIndex == 1) {
        NSString *userInput = self.userInputField.text;
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *number = self.lastChosenFoodIndex;
        if (![userInput  isEqual: @""]) number = [f numberFromString:userInput];
        NSDate * today = [NSDate date];
        self.foodToPost.foodname = self.lastChosenFoodName;
        if (self.addToSelectedIndex == 0) self.foodToPost.store_place = @"fridge";
        else self.foodToPost.store_place = @"freezer";
        self.foodToPost.add_time = today;
        self.foodToPost.expire_period = number;
        
        [[RKObjectManager sharedManager]    postObject:self.foodToPost
                                                  path:@"/api/food"
                                            parameters:nil
                                               success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                   NSLog(@"Post succeeded");
                                               }
                                               failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                   NSLog(@"error occurred': %@", error);
                                               }];
    }
}


@end
