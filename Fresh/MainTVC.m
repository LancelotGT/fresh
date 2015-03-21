//
//  MainTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "MainTVC.h"
#import "MultipleFoodTableViewCell.h"
#import "Food2.h"
#import <RestKit/RestKit.h>

@interface MainTVC ()
@property (strong, nonatomic) NSMutableArray *fridgeFoodCollection;
@property (strong, nonatomic) NSMutableArray *freezerFoodCollection;
@property (strong, nonatomic) NSMutableArray *displayFoodCollection;
@property (strong, nonatomic) NSMutableArray *foodInFridgeAddedDates;
@property (strong, nonatomic) NSMutableArray *foodInFreezerAddedDates;
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

-(NSMutableArray *)displayFoodCollection  {
    if (!_displayFoodCollection) _displayFoodCollection = [[NSMutableArray alloc]init];
    return _displayFoodCollection;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadFood:@"fridge"];
    [self loadFood:@"freezer"];
    self.displayFoodCollection = self.fridgeFoodCollection;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Food Cell" forIndexPath:indexPath];
    int startIndex = indexPath.row * 4;
    // Configure the cell...
    if ([self.displayFoodCollection count] == 0) {
        if ([self.fridgeFoodCollection count] > 0) {
            for (int i = 0; i < 4; i++) {
                [self displayFoodWithIndex:startIndex + i withPart:self.fridgeFoodCollection withCell:cell];
            }
        }
    }
    else {
        for (int i = 0; i < 4; i++) {
            [self displayFoodWithIndex:startIndex + i withPart:self.displayFoodCollection withCell:cell];
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Feb 2%d, 2015", 3 + (int) section];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)filterButtonClicked:(UIBarButtonItem *)sender {
    NSString *actionSheetTitle = @"Filter By"; //Action Sheet Title
//    NSAttributedString *actionSheetTitle = [[NSAttributedString alloc] initWithString:@"Filter By" attributes:@{NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline], NSForegroundColorAttributeName : [UIColor greenColor]}];
    NSString *other1 = @"Date Added";
    NSString *other2 = @"Expire date";
    NSString *other3 = @"Categories";
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // TO DO: called when a UIButton is tapped.
}

- (IBAction)SegmentControlTouched:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.displayFoodCollection = self.fridgeFoodCollection;
    }
    else {
        self.displayFoodCollection = self.freezerFoodCollection;
    }
    
    [self.tableView reloadData];
}

- (void)loadFood: (NSString *)partName{
    
    NSMutableString *myPath = [[NSMutableString alloc] initWithString:@"/api/food/store_place/"];
    [myPath appendString:partName];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:myPath
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSDateFormatter* dateFormatter =[[NSDateFormatter alloc]init];
                                                  dateFormatter.dateFormat = @"YYYY-MM-dd";
                                                  if ([partName  isEqual: @"fridge"]) {
                                                      
                                                      self.fridgeFoodCollection = mappingResult.array;
                                                      [self.fridgeFoodCollection sortUsingComparator:^NSComparisonResult(Food2* b,Food2* a){
                                                          return[a.add_time compare:b.add_time];
                                                      }];
                                                      
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
                                                      
                                                      for(NSString *str2 in self.foodInFridgeAddedDates){
                                                          NSLog(@"In fridge, the date is %@", str2);
                                                      }
                                                      
                                                  }else {
                                                      self.freezerFoodCollection = mappingResult.array;
                                                      [self.freezerFoodCollection sortUsingComparator:^NSComparisonResult(Food2* b,Food2* a){
                                                          return[a.add_time compare:b.add_time];
                                                      }];
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
                                                  
                                                  for (Food2* food in self.freezerFoodCollection) {
                                                      NSLog(food.foodname);
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
        if (index % 4 == 0) {
            [cell.button1 setImage:[UIImage imageNamed:food.foodname] forState:UIControlStateNormal];
            cell.button1.tag = index;
            [cell.button1 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (index % 4 == 1) {
            [cell.button2 setImage:[UIImage imageNamed:food.foodname] forState:UIControlStateNormal];
            cell.button2.tag = index;
            [cell.button2 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (index % 4 == 2) {
            [cell.button3 setImage:[UIImage imageNamed:food.foodname] forState:UIControlStateNormal];
            cell.button3.tag = index;
            [cell.button3 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            [cell.button4 setImage:[UIImage imageNamed:food.foodname] forState:UIControlStateNormal];
            cell.button4.tag = index;
            [cell.button4 addTarget:self action:@selector(foodButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
    } else {
        if (index % 4 == 0) [cell.button1 setImage:nil forState:UIControlStateNormal];
        else if (index % 4 == 1) [cell.button2 setImage:nil forState:UIControlStateNormal];
        else if (index % 4 == 2) [cell.button3 setImage:nil forState:UIControlStateNormal];
        else [cell.button4 setImage:nil forState:UIControlStateNormal];
    }
}

- (void) foodButtonPressed:(UIButton *)sender{
    
    Food2 *food;
    if ([self.displayFoodCollection count] > 0) {
        food = [self.displayFoodCollection objectAtIndex:sender.tag];
    } else {
        food = [self.fridgeFoodCollection objectAtIndex:sender.tag];
    }
    
    
    NSInteger daysLeft = [self calculateLeftDays:food];
    
    NSString *output = [NSString stringWithFormat:@"%ld days of expiration period.", daysLeft];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Food Information"
                                                    message:output
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
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
    // NSLog(@"add time: %@ ..., expire time: %@ ...,current time: %@ ...", tempDate,expireDate,currentDate);
    
   // NSLog(@"expireDate: %@ ...", expireDate);
    NSDateComponents *compLeft = [gregorian components:NSDayCalendarUnit fromDate:currentDate toDate:expireDate options:0];
    //NSLog(@"%ld days left", [compLeft day]);
    //NSString * output = [NSString stringWithFormat:@"%ld days left",[compLeft day]];
    return [compLeft day]+1;
}

@end
