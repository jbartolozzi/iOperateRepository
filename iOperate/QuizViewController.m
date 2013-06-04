//
//  QuizViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/3/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController () {
	NSIndexPath *globalPath;
	NSMutableArray *arrayOfTitles;
	NSMutableArray *arrayOfQuestions;
	NSMutableArray *arrayOfA;
	NSMutableArray *arrayOfB;
	NSMutableArray *arrayOfC;
	NSMutableArray *arrayOfD;
	NSMutableArray *arrayOfE;
	NSMutableArray *arrayOfF;
	NSMutableArray *arrayOfSegStates;
	NSMutableArray *arrayOfSegAnswers;
	NSMutableArray *arrayOfCorrect;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

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
	
	arrayOfSegStates = [[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1", nil];
	
	NSNumber *ans1 = [NSNumber numberWithInt:0];
	NSNumber *ans2 = [NSNumber numberWithInt:1];
	NSNumber *ans3 = [NSNumber numberWithInt:2];
	arrayOfSegAnswers = [[NSMutableArray alloc]initWithObjects:ans1,ans2,ans3, nil];
	
	
	// Correct Array
	NSNumber *finalAns1 = [NSNumber numberWithInt:0];
	NSNumber *finalAns2 = [NSNumber numberWithInt:1];
	NSNumber *finalAns3 = [NSNumber numberWithInt:2];
	arrayOfCorrect = [[NSMutableArray alloc]initWithObjects:finalAns1,finalAns2,finalAns3, nil];
	
	arrayOfTitles = [[NSMutableArray alloc]initWithObjects:@"Question 1",@"Question 2",@"Question 3", nil];
	arrayOfQuestions = [[NSMutableArray alloc]initWithObjects:
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
						@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",nil];
	arrayOfA = [[NSMutableArray alloc]initWithObjects:
				@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
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
	globalPath = indexPath;
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
	
	self.segControl.selected = NO;
	if ([[arrayOfSegStates objectAtIndex:indexPath.item] isEqual: @"0"]) {
		self.segControl.selected = YES;
		NSNumber *num = [arrayOfSegAnswers objectAtIndex:indexPath.item];
		self.segControl.selectedSegmentIndex = [num integerValue];
	}
	return cell;
}

- (IBAction)answerSelected:(id)sender {
	[arrayOfSegStates replaceObjectAtIndex:globalPath.item withObject:@"0"];
	NSNumber *num = [NSNumber numberWithInt:[sender selectedSegmentIndex]];
	[arrayOfSegAnswers replaceObjectAtIndex:globalPath.item withObject:num];
}

- (IBAction)qFinish:(id)sender {
	BOOL allDone = NO;
	
	if (allDone == NO) {
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Exam Complete" message:@"Would you like to finish taking the quiz?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"Yes",nil];
		[alert show];
	}
	else {
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Not all questions have been answered. Continue anyway?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
		[alert show];
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 1) {
		float total = 100;
		for (int i = 0; i < [arrayOfSegAnswers count]; i++) {
			if ([arrayOfSegAnswers objectAtIndex:i] == [arrayOfCorrect objectAtIndex:i]) {
				
			}
			else {
				total -= (100.f/(float)[arrayOfCorrect count]);
			}
		}
		NSString *message = [NSString stringWithFormat:@"%f",total];
		
		
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Your Score:" message:[message stringByAppendingString:@"%"] delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
		[UIView animateWithDuration:1 animations:^{self.view.alpha = 0.0;}];
		self.view.hidden = YES;
		[alert show];
		
	}
}
@end
