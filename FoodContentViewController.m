//
//  FoodContentViewController.m
//  Fresh
//
//  Created by Ning Wang on 15-2-21.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import "FoodContentViewController.h"

@interface FoodContentViewController ()
@property (nonatomic, strong) UIImageView* foodImageView;
@property (nonatomic, strong) UIImage *foodImage;
@end

@implementation FoodContentViewController

- (void)setFoodImageURL:(NSURL *)imageURL {
    _foodImageURL = imageURL;
    NSLog(@"The image URL is %@", self.foodImageURL);
    self.foodImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.foodImageURL]];
}

- (UIImageView *)foodImageView {
    if (!_foodImageView) _foodImageView = [[UIImageView alloc] init];
    return _foodImageView;
}

- (UIImage *)foodImage {
    return self.foodImageView.image;
}

- (void) setFoodImage:(UIImage *)image {
    self.foodImageView.image = image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.foodTitleLabel setText:self.foodTitle];
    self.title = self.foodTitle;
    self.view = self.foodImageView;
    if(self.foodImageView.image) {
        NSLog(@"Image exists.");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
