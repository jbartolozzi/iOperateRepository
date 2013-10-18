//
//  UTLViewController.m
//  iOperate
//
//  Created by Max Gilbert & James Bartolozzi on 5/13/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "UTLViewController.h"

@interface UTLViewController () {
	int attempts;
    BOOL helpShown;
}

@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *versionNumber;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
- (IBAction)userNameInput:(id)sender;
- (IBAction)passwordInput:(id)sender;
- (IBAction)openHelp:(id)sender;

- (IBAction)sendLogin:(id)sender;

@end

@implementation UTLViewController

-(void)viewDidLayoutSubviews
{
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.userNameField.frame = CGRectMake(410, 161, 204, 30);
        self.passwordField.frame = CGRectMake(410, 218, 204, 30);
        self.loginButton.frame = CGRectMake(466, 269, 93, 41);
    }
    else {
        self.userNameField.frame = CGRectMake(282, 330, 204, 30);
        self.passwordField.frame = CGRectMake(282, 387, 204, 30);
        self.loginButton.frame = CGRectMake(338, 438, 93, 41);
		//self.accountButton.frame = CGRectMake(237, 532, 294, 41);
    }
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.userNameField.frame = CGRectMake(410, 161, 204, 30);
        self.passwordField.frame = CGRectMake(410, 218, 204, 30);
        
        if (helpShown)
        {
            self.loginButton.frame = CGRectMake(425, 278, 93, 41);
            self.helpButton.frame = CGRectMake(527, 278, 73, 44);
        }
        else
        {
            self.loginButton.frame = CGRectMake(466, 277, 93, 41);
        }
        
    }
    else {
        self.userNameField.frame = CGRectMake(282, 330, 204, 30);
        self.passwordField.frame = CGRectMake(282, 387, 204, 30);
        
        if (helpShown)
        {
            self.loginButton.frame = CGRectMake(292, 438, 93, 41);
            self.helpButton.frame = CGRectMake(394, 438, 73, 44);
        }
        else
        {
            self.loginButton.frame = CGRectMake(338, 438, 93, 41);
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	attempts = 0;
    self.loginButton.enabled = YES;
    self.loginButton.hidden = NO;
	self.helpButton.enabled = NO;
	self.helpButton.alpha = 0.0;
	// Do any additional setup after loading the view, typically from a nib.
	self.versionNumber.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)userNameInput:(id)sender {
    self.userName = self.userNameField.text;
}

- (IBAction)passwordInput:(id)sender {
    self.password = self.passwordField.text;
}

- (IBAction)openHelp:(id)sender {
	NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.james-bartolozzi.com" ];
	[[UIApplication sharedApplication] openURL:url];
}

- (IBAction)sendLogin:(id)sender {
	[self.userNameField resignFirstResponder];
	[self.passwordField resignFirstResponder];
    //if ([self.userName  isEqualToString: @"s"] && [self.password  isEqualToString: @"p"]) {
		[self performSegueWithIdentifier:@"student" sender:sender];
	//}
	//else if ([self.userName isEqualToString:@"p"] && [self.password isEqualToString:@"p"]) {
		[self performSegueWithIdentifier:@"prof" sender:sender];
	//}
	
	/*else {
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Invalid Username/Password."
													message:nil
													delegate:self
													cancelButtonTitle:@"Ok"
													otherButtonTitles:nil,nil];
		[message show];
		self.passwordField.text = @"";
		self.passwordField.placeholder = @"Password";
		attempts++;
	}*/
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (attempts > 2)
	{
		self.helpButton.enabled = YES;
        helpShown = YES;
		[UIView animateWithDuration:1.0 animations:^{self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x - (338-292), self.loginButton.frame.origin.y, self.loginButton.frame.size.width, self.loginButton.frame.size.height);}];
		[UIView animateWithDuration:1.0 animations:^{self.helpButton.alpha = 1.0;}];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.userNameField) {
        [theTextField resignFirstResponder];
    }
    self.loginButton.enabled = YES;
    return YES;
}
@end
