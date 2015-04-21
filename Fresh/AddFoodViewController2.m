//
//  AddFoodViewController2.m
//  Fresh
//
//  Created by Ning Wang on 15-3-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Switch the view from main view to add food view once the + button is clicked


#import "AddFoodViewController2.h"
#import "CategoryTVC.h"

@interface AddFoodViewController2 ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *addToSegmentControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *addFromSegmentControl;
@property (nonatomic, strong) CategoryTVC *embeddedCategoryTVC;
@end

@implementation AddFoodViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addToSegmentControl:(UISegmentedControl *)sender {
    if (self.addToSegmentControl.selectedSegmentIndex == 0) {
        self.embeddedCategoryTVC.addToSelectedIndex = 0;
    } else {
        self.embeddedCategoryTVC.addToSelectedIndex = 1;
    }
    NSLog(@"The value of addToSelectedIndex is %d", self.embeddedCategoryTVC.addToSelectedIndex);
}
- (IBAction)addFromSegmentControl:(UISegmentedControl *)sender {
    if (self.addFromSegmentControl.selectedSegmentIndex == 0) {
        self.embeddedCategoryTVC.addFromSelectedIndex = 0;
    } else {
        self.embeddedCategoryTVC.addFromSelectedIndex = 1;
    }
    NSLog(@"The value of addFromSelectedIndex is %d", self.embeddedCategoryTVC.addFromSelectedIndex);
    [self.embeddedCategoryTVC.tableView reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"embedded category TVC"]) {
        self.embeddedCategoryTVC = (CategoryTVC *) [segue destinationViewController];
        // do something with the AlertView's subviews here...
    }
}


@end