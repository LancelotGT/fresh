//
//  MainTVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "MainTVC.h"
#import "MultipleFoodTableViewCell.h"

@interface MainTVC ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addFoodButton;
@end

@implementation MainTVC

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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Food Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.imageView1.image = [UIImage imageNamed:@"egg"];
    cell.imageView2.image = [UIImage imageNamed:@"apple"];
    cell.imageView3.image = [UIImage imageNamed:@"milk"];
    cell.imageView4.image = [UIImage imageNamed:@"muffin"];
    
    
    
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

@end
