//
//  ViewController.m
//  Fresh
//
//  Created by Ning Wang on 15-2-20.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "ViewController.h"
#import "AddFoodViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Add Food"]) {
        if ([segue.destinationViewController isKindOfClass:[AddFoodViewController class]]) {
            //AddFoodViewController *afvc = (AddFoodViewController *)segue.destinationViewController;
            return;
        }
    }
}

- (void) addRightButton {
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_food_button"]];
//    imageView.frame = CGRectMake(10, 0, 30, 30);
//    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:imageView];
//    [button setAction:@selector(goToAddFoodViewController)];
//    [self.navigationItem setRightBarButtonItem:button];
}

- (IBAction)goToAddFoodViewController {
    NSLog(@"Button Selected.");
    AddFoodViewController* afvc = [self.storyboard instantiateViewControllerWithIdentifier:@"add food view"];
    [self.navigationController showViewController:afvc sender:self.navigationItem.rightBarButtonItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
