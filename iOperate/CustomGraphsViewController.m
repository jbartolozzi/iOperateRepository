//
//  CustomGraphsViewController.m
//  iOperate
//
//  Created by Max Gilbert on 7/29/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "CustomGraphsViewController.h"
#import "DrawRectView.h"

@interface CustomGraphsViewController ()
@property (nonatomic,strong) DrawRectView *myView;
@end

@implementation CustomGraphsViewController
//add lazy instantiation for myview
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    _myView = [[DrawRectView alloc] initWithFrame: CGRectMake(20, 20, 500, 500)];
    _myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)drawLine:(UIButton *)sender {
    [_myView drawLine:10.0f :20.0f :20.0f :400.0f :400.0f];
}

@end
