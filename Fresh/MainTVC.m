//
//  MainTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Main interface controller. Load and display all food stored in fridge and freezer
// Use table view

#import "MainTVC.h"
#import "MultipleFoodTableViewCell.h"
#import "Food2.h"
#import <RestKit/RestKit.h>
#import "AppDelegate.h"

@interface MainTVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlState;
@property (strong, nonatomic) NSMutableArray *fridgeFoodCollection;
@property (strong, nonatomic) NSMutableArray *freezerFoodCollection;
@property (strong, nonatomic) NSMutableArray *foodInFridgeAddedDates;
@property (strong, nonatomic) NSMutableArray *foodInFreezerAddedDates;
@property(nonatomic, strong) NSString *lastChosenFoodId;
@end

@implementation MainTVC

-(NSMutableArray *)foodInFridgeAddedDates {
    if (!_foodInFridgeAddedDates) _foodInFridgeAddedDates = [[NSMutableArray alloc] init];
    return _foodInFridgeAddedDates;
}
-(NSMutableArray *)foodInFreezerAddedDates {
    if (!_foodInFreezerAddedDates) _foodInFreezerAddedDates = [[NSMutableArray alloc] init];
    return _foodInFreezerAddedDates;
}

-(NSMutableArray *)fridgeFoodCollection {
    if (!_fridgeFoodCollection) _fridgeFoodCollection = [[NSMutableArray alloc]init];
    return _fridgeFoodCollection;
}

-(NSMutableArray *)freezerFoodCollection {
    if (!_freezerFoodCollection) _freezerFoodCollection = [[NSMutableArray alloc]init];
    return _freezerFoodCollection;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
    [self loadFood:@"fridge"];
    [self loadFood:@"freezer"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadFood:@"fridge"];
    [self loadFood:@"freezer"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if (self.segmentedControlState.selectedSegmentIndex ==  0) {
        if ([self.fridgeFoodCollection count] > 0) return [self.foodInFridgeAddedDates count];
        else return 1;
    } else {
        if ([self.freezerFoodCollection count] > 0) return [self.foodInFreezerAddedDates count];
        else return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.segmentedControlState.selectedSegmentIndex == 0) {
        if ([self.fridgeFoodCollection count] > 0) {
            int count = (int)[[self findFoodsInOneDay:self.fridgeFoodCollection withDate:[self.foodInFridgeAddedDates objectAtIndex:section]] count];
            if (count % 4 == 0) {
                return count / 4;
            } else {
                return count / 4 + 1;
            }
        }
        return 1;
    } else {
        if ([self.fridgeFoodCollection count] > 0) {
            int count = (int) [[self findFoodsInOneDay:self.freezerFoodCollection withDate:[self.foodInFreezerAddedDates objectAtIndex:section]] count];
            if (count % 4 == 0) {
                return count / 4;
            } else {
                return count / 4 + 1;
            }
        }
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Food Cell" forIndexPath:indexPath];
    int startIndex = (int) indexPath.row * 4;
    // Configure the cell...
    
    if (self.segmentedControlState.selectedSegmentIndex == 0) {
        if ([self.fridgeFoodCollection count] > 0) {
            NSMutableArray* foodsInOneDay = [self findFoodsInOneDay:self.fridgeFoodCollection withDate:[self.foodInFridgeAddedDates objectAtIndex: (int) indexPath.section]];
            for (int i = 0; i < 4; i++) {
                [self displayFoodWithIndex:startIndex + i withPart:foodsInOneDay withCell:cell];
            }
        }
    } else {
        if ([self.freezerFoodCollection count] > 0) {
            NSMutableArray* foodsInOneDay = [self findFoodsInOneDay: self.freezerFoodCollection
                                                           withDate: [self.foodInFreezerAddedDates objectAtIndex: (int) indexPath.section]];
            for (int i = 0; i < 4; i++) {
                [self displayFoodWithIndex:startIndex + i withPart:foodsInOneDay withCell:cell];
            }
        }
    }
    
    return cell;
}

- (NSMutableArray *)findFoodsInOneDay:(NSMutableArray *)foodCollection withDate:(NSString *)date {
    NSMutableArray * temp = [[NSMutableArray alloc] init];
    NSDateFormatter* dateFormatter =[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";

    for (Food2 *food in foodCollection) {
        NSString* dateString = [dateFormatter stringFromDate:food.add_time];
        if ([dateString isEqualToString:date]) {
            [temp addObject:food];
        }
    }
    return temp;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.segmentedControlState.selectedSegmentIndex == 0) {
        if ([self.fridgeFoodCollection count] > 0) {
            return [self.foodInFridgeAddedDates objectAtIndex:(int) section];
        }
        else return @"Loading data";
    }
    else {
        if ([self.freezerFoodCollection count] > 0) {
            return [self.foodInFreezerAddedDates objectAtIndex:(int) section];
        }
        else return @"Loading data";
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // TO DO: called when a UIButton is tapped.
}

- (IBAction)SegmentControlTouched:(UISegmentedControl *)sender {
    [self.tableView reloadData];
}

#pragma mark - Load food

- (void)loadFood: (NSString *)partName{
    
    NSMutableString *myPath = [[NSMutableString alloc] initWithString:@"/api/food/store_place/"];
    [myPath appendString:partName];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:myPath
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSDateFormatter* dateFormatter =[[NSDateFormatter alloc]init];
                                                  dateFormatter.dateFormat = @"YYYY-MM-dd";
                                                  NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
                                                  if ([partName  isEqual: @"fridge"]) {
                                                      
                                                      self.fridgeFoodCollection = mappingResult.array;
                                                      [self.fridgeFoodCollection sortUsingComparator:^NSComparisonResult(Food2* b,Food2* a){
                                                          return[a.add_time compare:b.add_time];
                                                      }];
                                                      self.foodInFridgeAddedDates  = nil;
                                                      for( Food2* food in self.fridgeFoodCollection){
                                                         
                                                          BOOL hasDate = NO;
                                                          NSString* dateString = [dateFormatter stringFromDate:food.add_time];


                                                          for (NSString* str in self.foodInFridgeAddedDates) {
                                                              if([str isEqualToString: dateString]){
                                                                  hasDate = YES;
                                                              }
                                                          }
                                                          if(hasDate == NO)
                                                              [self.foodInFridgeAddedDates addObject:dateString];
                                                      }
                                                  }else {
                                                      self.freezerFoodCollection = mappingResult.array;
                                                      [self.freezerFoodCollection sortUsingComparator:^NSComparisonResult(Food2* b,Food2* a){
                                                          return[a.add_time compare:b.add_time];
                                                      }];
                                                      self.foodInFreezerAddedDates  = nil;
                                                      for( Food2* food in self.freezerFoodCollection){
                                                          BOOL hasDate = NO;
                                                          NSString* dateString = [dateFormatter stringFromDate:food.add_time];
                                                          for (NSString* str in self.foodInFreezerAddedDates) {
                                                              if([str isEqualToString: dateString]){
                                                                  hasDate = YES;
                                                              }
                                                          }
                                                          if(hasDate == NO)
                                                              [self.foodInFreezerAddedDates addObject:dateString];
                                                     }
                                                  }
                                                  [self.tableView reloadData];
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"error occurred': %@", error);
                                              }];
}

- (void) displayFoodWithIndex:(int) index withPart:(NSMutableArray *) foodCollection withCell:(MultipleFoodTableViewCell *) cell{
    if (index <= [foodCollection count] - 1) {
        Food2* food = [foodCollection objectAtIndex:index];
        NSInteger leftDays = [self calculateLeftDays:food];
        NSString* imageName = food.foodname;
        int enable = ((AppDelegate *)[UIApplication sharedApplication].delegate).enableExpiredFoodImage;
        //NSLog(@"Enable: %d", enable);
        if (leftDays < 0 && enable == 0) imageName = [imageName stringByAppendingString:@"_black"];
        int originalIndex;
        if (self.segmentedControlState.selectedSegmentIndex == 0) {
            originalIndex = (int) [self.fridgeFoodCollection indexOfObject:food];
        } else {
            originalIndex = (int) [self.freezerFoodCollection indexOfObject:food];
        }
        if (index % 4 == 0) {
            [cell.button1 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            cell.button1.tag = originalIndex;
            [cell.button1 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (index % 4 == 1) {
            [cell.button2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            cell.button2.tag = originalIndex;
            [cell.button2 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (index % 4 == 2) {
            [cell.button3 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            cell.button3.tag = originalIndex;
            [cell.button3 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            [cell.button4 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            cell.button4.tag = originalIndex;
            [cell.button4 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
    } else {
        if (index % 4 == 0) {
            [cell.button1 setImage:nil forState:UIControlStateNormal];
            cell.button1.tag = 10000;
        }
        else if (index % 4 == 1) {
            [cell.button2 setImage:nil forState:UIControlStateNormal];
            cell.button2.tag = 10000;
        }
        else if (index % 4 == 2) {
            [cell.button3 setImage:nil forState:UIControlStateNormal];
            cell.button3.tag = 10000;
        }
        else {
            [cell.button4 setImage:nil forState:UIControlStateNormal];
            cell.button4.tag = 10000;
        }
    }
}

- (void) foodButtonPressed:(UIButton *)sender{
    Food2 *food;
    if (self.segmentedControlState.selectedSegmentIndex == 0) {
        if (sender.tag >= [self.fridgeFoodCollection count]) return;
        food = [self.fridgeFoodCollection objectAtIndex:sender.tag];
    } else {
        if (sender.tag >= [self.freezerFoodCollection count]) return;
        food = [self.freezerFoodCollection objectAtIndex:sender.tag];
    }
    self.lastChosenFoodId = food.food_id;
    NSInteger daysLeft = [self calculateLeftDays:food];
    
    NSString *output;
    if (daysLeft >= 0) output = [NSString stringWithFormat:@"Food Name: %@\nQuality guarantee period: %ld days left.", food.foodname, daysLeft];
    else output = [NSString stringWithFormat:@"Food Name: %@\nThis food has already expired.", food.foodname];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Food Information"
                                                    message:output
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Delete"];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSArray *notifs = [UIApplication sharedApplication].scheduledLocalNotifications;
        NSLog(@"Number of notification: %lu", (unsigned long)[notifs count]);
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        
        NSString* path = [@"/api/food/food_id/" stringByAppendingString:self.lastChosenFoodId];
        [[RKObjectManager sharedManager] deleteObject:NULL
                                                 path:path
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {

                                                  [self loadFood:@"fridge"];
                                                  [self loadFood:@"freezer"];
                                                  [self.tableView reloadData];
                                                  NSLog(@"Successfully deleted");
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"error occurred': %@", error);
                                              }];
    }
}

- (NSInteger)calculateLeftDays:(Food2 *) food {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate* tempDate = food.add_time;
    NSDate *currentDate = [NSDate date];
    NSInteger daysToAdd = [food.expire_period integerValue];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:0];
    [comps setDay:daysToAdd];
    NSDate *expireDate = [gregorian dateByAddingComponents:comps toDate:tempDate  options:0];
    NSDateComponents *compLeft = [gregorian components:NSDayCalendarUnit fromDate:currentDate toDate:expireDate options:0];
    return [compLeft day]+1;
}

@end
