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
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"2.tif",@"3.tif",@"4.tif",@"5.tif",@"6.tif",@"7.tif",@"8.tif",@"9.tif",@"10.tif",@"11.tif",@"12.tif",@"13.tif",@"14.tif",@"15.tif",nil];
    
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
