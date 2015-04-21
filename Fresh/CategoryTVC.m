//
//  CategoryTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-3-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Controls view for adding food by categories

#import "CategoryTVC.h"
#import "MultipleFoodTableViewCell.h"
#import "Food2.h"
#import "Constants.h"
#import <Restkit/RestKit.h>
#import "AppDelegate.h"

@interface CategoryTVC ()
@property (nonatomic, strong) UITextField *userInputField;
@property(nonatomic, strong) Food2 * foodToPost;
@property(nonatomic, strong) NSString *lastChosenFoodName;
@property(nonatomic, strong) NSNumber *lastChosenFoodIndex;
@end

@implementation CategoryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
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
    if (self.addFromSelectedIndex == 0) return 6;
    else return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (self.addFromSelectedIndex == 0) {
        if (section == 0) return 4;
        else if (section == 1) return 4;
        else if (section == 2) return 1;
        else if (section == 3) return 2;
        else if (section == 4) return 2;
        else return 1;
    } else return 3;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,200,300,244)];
    //tempView.backgroundColor=[UIColor clearColor];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,-7,300,44)];
    //tempLabel.backgroundColor=[UIColor clearColor];
    //tempLabel.shadowColor = [UIColor blackColor];
    //tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(145/255.0) blue:(164/255.0) alpha:1]; //here you can change the text color of header.
//    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:fontSizeForHeaders];
//    tempLabel.font = [UIFont boldSystemFontOfSize:fontSizeForHeaders];
    NSString *category;
    if (self.addFromSelectedIndex == 0) {
        category = @"Other";
        if (section == 0) category = @"Vegetable";
        else if (section == 1) category = @"Fruit";
        else if (section == 2) category = @"Meat";
        else if (section == 3) category = @"Bakery";
        else if (section == 4) category = @"Dairy";
        else if (section == 5) category = @"Beverage";
        tempLabel.text = [NSString stringWithFormat:@"Category: %@", category];
    } else tempLabel.text = @"Mostly Added Items: ";

    [tempView addSubview:tempLabel];
    
    return tempView;
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
                
                [cell.button4 setImage:[UIImage imageNamed:@"potatoes"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 11;
            } else if (indexPath.row == 3) {
                [cell.button1 setImage:[UIImage imageNamed:@"celery"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 12;
                
                [cell.button2 setImage:[UIImage imageNamed:@"corn"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 13;
                
                [cell.button3 setImage:[UIImage imageNamed:@"bellpepper"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 14;
                
                [cell.button4 setImage:[UIImage imageNamed:@"mushroom"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 15;
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"apple"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 16;
                
                [cell.button2 setImage:[UIImage imageNamed:@"pear"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 17;
                
                [cell.button3 setImage:[UIImage imageNamed:@"kiwi"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 18;
                
                [cell.button4 setImage:[UIImage imageNamed:@"banana"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 19;
            } else if (indexPath.row == 1) {
                [cell.button1 setImage:[UIImage imageNamed:@"blueberry"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 20;
                
                [cell.button2 setImage:[UIImage imageNamed:@"cherry"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 21;
                
                [cell.button3 setImage:[UIImage imageNamed:@"grapes"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 22;
                
                [cell.button4 setImage:[UIImage imageNamed:@"lemonlime"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 23;
            } else if (indexPath.row == 2) {
                [cell.button1 setImage:[UIImage imageNamed:@"melon"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 24;
                
                [cell.button2 setImage:[UIImage imageNamed:@"mixed fruit"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 25;
                
                [cell.button3 setImage:[UIImage imageNamed:@"orange"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 26;
                
                [cell.button4 setImage:[UIImage imageNamed:@"peach"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 27;
            } else if (indexPath.row == 3) {
                [cell.button1 setImage:[UIImage imageNamed:@"pineapple"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 28;
                
                [cell.button2 setImage:[UIImage imageNamed:@"plums"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 29;
                
                [cell.button3 setImage:[UIImage imageNamed:@"raspberry"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 30;
                
                [cell.button4 setImage:[UIImage imageNamed:@"strawberry"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 31;
            }
        } else if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"hotdog"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 32;
                
                [cell.button2 setImage:[UIImage imageNamed:@"ham"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 33;
                
                [cell.button3 setImage:[UIImage imageNamed:@"crab"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 34;
                
                [cell.button4 setImage:[UIImage imageNamed:@"frozen meals"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 35;
            }
        } else if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"bread"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 36;
                
                [cell.button2 setImage:[UIImage imageNamed:@"cake"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 37;
                
                [cell.button3 setImage:[UIImage imageNamed:@"cookies"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 38;
                
                [cell.button4 setImage:[UIImage imageNamed:@"donuts"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 39;
            } else if (indexPath.row == 1) {
                [cell.button1 setImage:[UIImage imageNamed:@"cupcake"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 40;
                
                [cell.button2 setImage:nil forState:UIControlStateNormal];
                [cell.button3 setImage:nil forState:UIControlStateNormal];
                [cell.button4 setImage:nil forState:UIControlStateNormal];
                cell.button2.tag = 10000;
                cell.button3.tag = 10000;
                cell.button4.tag = 10000;
            }
        } else if (indexPath.section == 4) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"milk"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 41;
                
                [cell.button2 setImage:[UIImage imageNamed:@"egg"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 42;
                
                [cell.button3 setImage:[UIImage imageNamed:@"ice cream"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 43;
                
                [cell.button4 setImage:[UIImage imageNamed:@"cream"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 44;
            } else if (indexPath.row == 1) {
                [cell.button1 setImage:[UIImage imageNamed:@"cheese"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 45;
                
                [cell.button2 setImage:[UIImage imageNamed:@"cheese slice"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 46;
                
                [cell.button3 setImage:nil forState:UIControlStateNormal];
                [cell.button4 setImage:nil forState:UIControlStateNormal];
                cell.button3.tag = 10000;
                cell.button4.tag = 10000;

            }
        } else if (indexPath.section == 5) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"iced tea"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 47;
                
                [cell.button2 setImage:[UIImage imageNamed:@"coffee"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 48;
                
                [cell.button3 setImage:nil forState:UIControlStateNormal];
                [cell.button4 setImage:nil forState:UIControlStateNormal];
                cell.button3.tag = 10000;
                cell.button4.tag = 10000;

            }
        }
    } else {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                [cell.button1 setImage:[UIImage imageNamed:@"milk"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 41;
                
                [cell.button2 setImage:[UIImage imageNamed:@"egg"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 42;
                
                [cell.button3 setImage:[UIImage imageNamed:@"ham"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 33;
                
                [cell.button4 setImage:[UIImage imageNamed:@"cheese slice"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 46;
            } else if (indexPath.row == 1) {
                [cell.button1 setImage:[UIImage imageNamed:@"apple"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 16;
                
                [cell.button2 setImage:[UIImage imageNamed:@"banana"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 19;
                
                [cell.button3 setImage:[UIImage imageNamed:@"broccoli"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 1;
                
                [cell.button4 setImage:[UIImage imageNamed:@"ice cream"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 43;
            } else if (indexPath.row == 2) {
                [cell.button1 setImage:[UIImage imageNamed:@"coffee"] forState:UIControlStateNormal];
                [cell.button1 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button1.tag = 48;
                
                [cell.button2 setImage:[UIImage imageNamed:@"cupcake"] forState:UIControlStateNormal];
                [cell.button2 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button2.tag = 40;
                
                [cell.button3 setImage:[UIImage imageNamed:@"lettuce"] forState:UIControlStateNormal];
                [cell.button3 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button3.tag = 5;
                
                [cell.button4 setImage:[UIImage imageNamed:@"potatoes"] forState:UIControlStateNormal];
                [cell.button4 addTarget:self action:@selector(addFoodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                cell.button4.tag = 11;
            } else {
                [cell.button1 setImage:nil forState:UIControlStateNormal];
                [cell.button2 setImage:nil forState:UIControlStateNormal];
                [cell.button3 setImage:nil forState:UIControlStateNormal];
                [cell.button4 setImage:nil forState:UIControlStateNormal];
                cell.button1.tag = 10000;
                cell.button2.tag = 10000;
                cell.button3.tag = 10000;
                cell.button4.tag = 10000;
            }
        }
    }
    return cell;
}

- (void) addFoodButtonPressed: (UIButton *)sender {
    if (sender.tag >= 1000) return;
    self.lastChosenFoodName = [[Constants ArrayOfFoodName] objectAtIndex:sender.tag];
    self.lastChosenFoodIndex = [[Constants ArrayOfFoodExpirePeriod] objectAtIndex:sender.tag];
    NSString *msg = [NSString stringWithFormat:@"Food name: %@\nQuality guarantee period", self.lastChosenFoodName];
    NSInteger t = (NSInteger) [[Constants ArrayOfFoodExpirePeriod] objectAtIndex:sender.tag];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Food Information"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Confirm"];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    self.userInputField = [alert textFieldAtIndex: 0];
    self.userInputField.placeholder = [NSString stringWithFormat: @"%@", t];
    
    
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
                                                
                                                 //  NSLog(@"food id : ",self.foodToPost.food_id);
                                                   int daysBefore = ((AppDelegate *)[UIApplication sharedApplication].delegate).notificationSelectedRow + 1;
                                               [self scheduleNotificationWithItem:self.foodToPost interval:daysBefore];
                                               }
                                               failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                   NSLog(@"error occurred': %@", error);
                                               }];
        // schedule a notification
    }
}

- (void)scheduleNotificationWithItem:(Food2 *)item interval:(int)daysBefore {
    NSDate *itemDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * ([item.expire_period intValue] - daysBefore)];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = itemDate;
    NSLog(@"%@", itemDate);
    localNotif.timeZone = [NSTimeZone systemTimeZone];

    
    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ will expire in %d days.", nil), item.foodname, daysBefore];
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    //localNotif.alertTitle = NSLocalizedString(@"Item Due", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    //[UIApplication sharedApplication].applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.foodname forKey:item.foodname];
    localNotif.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

@end
