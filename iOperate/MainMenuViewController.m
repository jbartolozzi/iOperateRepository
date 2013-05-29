//
//  MainMenuViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 5/16/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MainMenuViewController

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
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaper-1231836.jpg"]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
