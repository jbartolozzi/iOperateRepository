//
//  AdvancedCollectionViewViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 5/28/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "AdvancedCollectionViewViewController.h"

@interface AdvancedCollectionViewViewController () {
	NSMutableArray *arrayOfButtonImages;
	NSMutableArray *arrayOfLabels;
	NSMutableArray *arrayOfThumbs;
}
@end

@implementation AdvancedCollectionViewViewController

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
	[[self collectionView]setDataSource:self];
	[[self collectionView]setDelegate:self];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
	arrayOfLabels = [[NSMutableArray alloc]initWithObjects:@"Adenotonsillectomy",nil];
	arrayOfThumbs = [[NSMutableArray alloc]initWithObjects:@"2.tif", nil];
	arrayOfButtonImages = [[NSMutableArray alloc]initWithObjects:@"2.tif",nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [arrayOfButtonImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	AdvancedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
	[[cell button] setImage:[UIImage imageNamed:[arrayOfButtonImages objectAtIndex:indexPath.item]] forState:UIControlStateNormal];
	[[cell label]setText:[arrayOfLabels objectAtIndex:indexPath.item]];
	
	cell.button.layer.cornerRadius = 8.0f;
	cell.button.layer.masksToBounds = YES;
	cell.button.layer.shadowColor = [UIColor blackColor].CGColor;
	cell.button.layer.shadowOpacity = 0.2;
	cell.button.layer.shadowRadius = 5;
	cell.button.layer.shadowOffset = CGSizeMake(0.f, 10.0f);
	return cell;
}


@end
