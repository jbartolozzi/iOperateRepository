//
//  OverviewViewController.m
//  iOperate
//
//  Created by Max Gilbert on 8/27/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "OverviewViewController.h"
#import "CustomCell.h"
@interface OverviewViewController (){
    NSMutableArray *arrayOfImages;
}

@end

@implementation OverviewViewController

NSMutableArray *arrayOfImages;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft||interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return YES;
    
    return NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self OverviewCollectionView] setDataSource:self];
    [[self OverviewCollectionView] setDelegate:self];
    [self.view setAutoresizesSubviews:YES];
    [[self OverviewCollectionView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1a.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png", @"11.png", @"12.png", @"13.png", @"14.png", @"15.png", @"16.png", @"17.png", @"18.png", @"19.png", @"20.png", @"21.png", @"22.png", @"23.png", @"24.png", @"25.png", @"26.png", @"27.png", @"28.png", @"29.png", @"30.png", @"31.png", @"32.png", @"33.png", @"34.png", @"35.png", @"36.png", @"37.png", @"38.png", @"39.png", @"40.png", @"41.png", @"42.png", @"43.png", @"44.png", @"45.png", @"46.png", @"47.png", @"48.png", @"49.png", @"50.png", @"51.png", @"52.png", @"53.png", @"54.png", @"55.png", @"56.png", @"57.png", @"58.png", @"59.png",nil];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfImages count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell myPicture] setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]] ];
    [[cell myPicture] setContentMode:UIViewContentModeScaleAspectFit];
    return cell;
}

@end
