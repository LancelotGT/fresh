//
//  TopNavigationControllerVC.m
//  Fresh
//
//  Created by Ning Wang on 15-2-22.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

// Navigation controller on the top of the screen
// Contains add food button and setting button

#import "TopNavigationControllerVC.h"

@interface TopNavigationControllerVC ()

@end

@implementation TopNavigationControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.tintColor = [UIColor whiteColor]; // Change tint color
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_background"] forBarMetrics:UIBarMetricsDefault];
    [self addRightButton];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void) addRightButton {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_food_button"]];
    imageView.frame = CGRectMake(10, 0, 50, 50);
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    [self.navigationItem setRightBarButtonItem:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
