//  
//  MovieViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 5/17/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController () {
    MPMoviePlayerController *moviePlayerController;
    BOOL textBox1IsVisible;
}
@property (weak, nonatomic) IBOutlet UITextView *infoBox;
@property (weak, nonatomic) IBOutlet UIButton *popupButton;

@property (weak, nonatomic) IBOutlet UITextView *textWindow;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageWindow;
- (IBAction)showInfoBox:(id)sender;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.imageWindow.frame = CGRectMake(20, 20, 506, 708);
        self.textWindow.frame = CGRectMake(534, 25, 470, 635);
        self.popupButton.frame = CGRectMake(204, 288, 29, 31);
        self.infoBox.frame = CGRectMake(230, 302, 217, 205);
        self.playButton.frame = CGRectMake(718, 672, 102, 44);
    }
    else
    {
        self.imageWindow.frame = CGRectMake(20, 20, 728, 398);
        self.textWindow.frame = CGRectMake(20, 418, 728, 449);
        self.popupButton.frame = CGRectMake(336, 158, 29, 31);
        self.infoBox.frame = CGRectMake(362, 172, 217, 205);
        self.playButton.frame = CGRectMake(333, 897, 102, 44);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    textBox1IsVisible = YES;
    self.infoBox.alpha = 0.0;
    [[self.infoBox layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.infoBox layer] setBorderWidth:2.3];
    [[self.infoBox layer] setCornerRadius:5];
}

-(void)awakeFromNib {
    if([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight) {
        self.imageWindow.frame = CGRectMake(20, 20, 506, 708);
        self.textWindow.frame = CGRectMake(534, 25, 470, 635);
        self.popupButton.frame = CGRectMake(204, 288, 29, 31);
        self.infoBox.frame = CGRectMake(230, 302, 240, 128);
        self.playButton.frame = CGRectMake(718, 672, 102, 44);
    }
    else
    {
        self.imageWindow.frame = CGRectMake(20, 20, 728, 398);
        self.textWindow.frame = CGRectMake(20, 418, 728, 449);
        self.popupButton.frame = CGRectMake(336, 158, 29, 31);
        self.infoBox.frame = CGRectMake(362, 172, 240, 128);
        self.playButton.frame = CGRectMake(333, 897, 102, 44);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)playMovie:(id)sender
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"mov1" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    moviePlayerController= [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    moviePlayerController.scalingMode = MPMovieScalingModeAspectFill;
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    
    [moviePlayerController play];
}


- (IBAction)showInfoBox:(id)sender {
    if (textBox1IsVisible == YES) {
        self.infoBox.alpha = 0.0;
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{ self.infoBox.alpha = 1.0;}
                         completion:(nil)];
        textBox1IsVisible = NO;
    }
    else {
        
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{ self.infoBox.alpha = 0.0;}
                         completion:(nil)];
        textBox1IsVisible = YES;
        
    }
}
@end
