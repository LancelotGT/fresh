//
//  LoginViewController.h
//  Fresh
//
//  Created by Ning Wang on 15-3-29.
//  Copyright (c) 2015年 Fortune Cookies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@end
