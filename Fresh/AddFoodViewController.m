//
//  AddFoodViewController.m
//  Fresh
//
//  Created by Ning Wang on 15-3-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "AddFoodViewController.h"
#import "CategoryTVC.h"

@interface AddFoodViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *addToSegmentControl;
@property (nonatomic, strong) CategoryTVC *embeddedCategoryTVC;

@end

@implementation AddFoodViewController


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
        self.embeddedCategoryTVC.addToSelectedIndex = NO;
    } else {
        self.embeddedCategoryTVC.addToSelectedIndex = YES;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"embedded category TVC"]) {
        self.embeddedCategoryTVC = (CategoryTVC *) [segue destinationViewController];
        // do something with the AlertView's subviews here...
    }
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
