//
//  UTLViewController.m
//  iOperate
//
//  Created by Max Gilbert on 5/13/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "UTLViewController.h"

@interface UTLViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *versionNumber;
- (IBAction)userNameInput:(id)sender;
- (IBAction)passwordInput:(id)sender;

- (IBAction)sendLogin:(id)sender;

@end

@implementation UTLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginButton.enabled = NO;
    self.loginButton.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
	self.versionNumber.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)userNameInput:(id)sender {
    self.userName = self.userNameField.text;
    self.loginButton.enabled = YES;
    if ([self.userName length] == 0 || [self.password length] == 0) {
        self.loginButton.enabled = NO;
        self.loginButton.hidden = YES;
    }
    else {
        self.loginButton.enabled = YES;
        self.loginButton.hidden = NO;
        self.loginButton.alpha = 0.0;
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{ self.loginButton.alpha = 1.0;}
                         completion:(nil)];
    }
}

- (IBAction)passwordInput:(id)sender {
    self.password = self.passwordField.text;
    self.loginButton.enabled = YES;
    if ([self.userName length] == 0 || [self.password length] == 0) {
        self.loginButton.enabled = NO;
        self.loginButton.hidden = YES;
    }
    else {
        self.loginButton.enabled = YES;
        self.loginButton.hidden = NO;
        self.loginButton.alpha = 0.0;
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{ self.loginButton.alpha = 1.0;}
                         completion:(nil)];

    }
}

- (IBAction)sendLogin:(id)sender {
    /*NSString *userNameString = self.userName;
    NSString *passwordString = self.password;
    if ([userNameString length] == 0 || [passwordString length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error:" message:@"Username or Password Blank" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil, nil];
        [alert show];
    }*/
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.userNameField) {
        [theTextField resignFirstResponder];
    }
    self.loginButton.enabled = YES;
    return YES;
}
@end
