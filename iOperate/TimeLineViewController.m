//
//  TimeLineViewController.m
//  iOperate
//
//  Created by Max Gilbert on 8/16/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "TimeLineViewController.h"
#import "ShowTextButton.h"
#import "TimeLinveCell.h"

@interface TimeLineViewController (){
    NSMutableArray *arrayOfText;
    NSMutableArray *arrayOfImages;
    NSMutableArray *arrayOfButtons;
}

//@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *TextFields;
@end

@implementation TimeLineViewController

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
   /* NSComparator compareValues = ^(id a, id b)
    {
        if ([a tag] > [b tag]) {
            return (NSComparisonResult)NSOrderedDescending;
        } if ([a tag] < [b tag]){
            return (NSComparisonResult)NSOrderedAscending; } return (NSComparisonResult)NSOrderedSame;
    };
    _TextFields = [_TextFields sortedArrayUsingComparator:compareValues];*/
    
    [[self timeLineCollection] setDataSource:self];
    [[self timeLineCollection] setDelegate:self];
    arrayOfText = [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"three",@"four",@"five",@"six", nil];
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"2.tif",@"3.tif",@"4.tif",@"5.tif",@"6.tif", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfText count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TimeLinveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell image]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]] ];
    [[cell description]setText:[arrayOfText objectAtIndex:indexPath.item]];
    [cell showButton].hiddenText = [cell description];
    /*[[cell evaluationText]setText:[arrayOfText objectAtIndex:indexPath.item]];
    NSString *text = [NSString stringWithFormat:@"%d)",indexPath.item];
    [[cell evaluationLabel]setText:text];
    [cell evaluationResult].selectedSegmentIndex= [[arrayOfResults objectAtIndex:indexPath.item] integerValue];
    [[cell evaluationResult]setTag:indexPath.item];
    */
    return cell;
}
- (IBAction)showText:(ShowTextButton *)sender {
   if(sender.showing){
        [UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 0.0f;}];
        [sender setTitle:@"Show" forState:UIControlStateNormal];
        sender.showing = NO;
    } else{
        [UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 1.0f;}];
        [sender setTitle:@"Hide" forState:UIControlStateNormal];
        sender.showing = YES;
    }
}

@end
