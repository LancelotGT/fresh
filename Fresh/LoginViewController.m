#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.loginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(100, 80, 150, 145)];
    
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    [self.view addSubview:self.loginButton];
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