//
//  QuizViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/3/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController () {
	NSMutableArray *arrayOfTitles;
	NSMutableArray *arrayOfQuestions;
	NSMutableArray *arrayOfA;
	NSMutableArray *arrayOfB;
	NSMutableArray *arrayOfC;
	NSMutableArray *arrayOfD;
	NSMutableArray *arrayOfE;
	NSMutableArray *arrayOfF;
}

@end

@implementation QuizViewController

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
	[[self myCollectionView]setDataSource:self];
	[[self myCollectionView]setDelegate:self];
	
	arrayOfTitles = [[NSMutableArray alloc]initWithObjects:@"Question 1",@"Question 2",@"Question 3", nil];
	arrayOfQuestions = [[NSMutableArray alloc]initWithObjects:
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",nil];
	arrayOfA = [[NSMutableArray alloc]initWithObjects:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
				@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
				@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",nil];
	arrayOfB = [[NSMutableArray alloc]initWithObjects:@"Answer 1",@"Answer 2",@"Answer 3", nil];
	arrayOfC = [[NSMutableArray alloc]initWithObjects:@"Answer 1",@"Answer 2",@"Answer 3", nil];
	arrayOfD = [[NSMutableArray alloc]initWithObjects:@"Answer 1",@"Answer 2",@"Answer 3", nil];
	arrayOfE = [[NSMutableArray alloc]initWithObjects:@"Answer 1",@"Answer 2",@"Answer 3", nil];
	arrayOfF = [[NSMutableArray alloc]initWithObjects:@"Answer 1",@"Answer 2",@"Answer 3", nil];
	
	self.questionNum.text = [NSString stringWithFormat:@"%d",1];
	self.totalNum.text = [NSString stringWithFormat:@"%d",[arrayOfTitles count]];
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
	return [arrayOfTitles count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	QuizCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
	[[cell qTitle] setText:[arrayOfTitles objectAtIndex:indexPath.item]];
	[[cell qBox] setText:[arrayOfQuestions objectAtIndex:indexPath.item]];
	[[cell optionA] setText:[arrayOfA objectAtIndex:indexPath.item]];
	[[cell optionB] setText:[arrayOfB objectAtIndex:indexPath.item]];
	[[cell optionC] setText:[arrayOfC objectAtIndex:indexPath.item]];
	[[cell optionD] setText:[arrayOfD objectAtIndex:indexPath.item]];
	[[cell optionE] setText:[arrayOfE objectAtIndex:indexPath.item]];
	[[cell optionF] setText:[arrayOfF objectAtIndex:indexPath.item]];
	self.questionNum.text = [NSString stringWithFormat:@"%d",indexPath.item + 1];
	return cell;
}
					  
- (IBAction)goNext:(id)sender {
}

- (IBAction)goPrev:(id)sender {
}

@end
