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
    NSMutableArray *arrayOfCollapsed;
    NSMutableArray *arrayOfOrigins;
    NSMutableArray *arrayOfShown;
    
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
    arrayOfText = [[NSMutableArray alloc]initWithObjects:
                   @"Pay attention to the patient during induction of anesthesia, especially during intubation – be ready to help if it proves to be a difficult intubation.  Once the patient is intubated and an IV has been placed, initiate bed turning with your anesthesiology colleagues.\nOnce the bed is turned 90 degrees, the surgeon, who is gowned, gloved and wearing appropriate eye protection, puts on a headlight and adjusts it.  The scrub technician/nurse places a sheet over the patient’s body; you will evaluate the patient and position him/her.",
                   @"Once the time out has been performed a mouth gag is inserted.  You can use either a Crowe-Davis or McIvor mouth gag; the blade has a channel to accommodate the endotracheal tube.  There are three different size blades available for the gags.  The scrub nurse or technician will load the gag with the blade; as the gag is positioned, the fit of the blade is evaluated; if the fit is poor, the gag should be withdrawn and reloaded with the appropriate blade.  Poor blade choice or poor positioning of the mouth gag will impede access to the tonsillar issue so it is important to learn to position the gag properly and to learn to assess the fit of the blade.  Check to make sure the gag is fully closed.  Using thumb and middle finger as shown in the illustration, the surgeon scissors the mouth open.  With the mouth open check for loose teeth.  If any are loose, remove them prior to placing the gag.",
                   @"Once the gag is fully seated, the hook (that will seat onto the Mayo stand) is held with either the thumb, index or middle finger of one hand while the other hand grasps the gag as shown; holding the gag in this way allows bimanual opening of the gag and makes the opening efficient.  Open the gag with the index/middle finger, then use thumb opposition with the contralateral hand to effect the final opening.  Use judgment when opening the gag: forcing the gag can dislocate the patient’s temporomandibular joint and potentially injure it.  This is especially relevant if the patient has limited intercisural opening/trismus.  Once the gag is opened, its positioning relative to the tongue as well as the access to the tonsils are assessed.  The targeted tonsil should be visible in its entirety, from superior to inferior pole.  The gag, once opened, can compress the endotracheal tube and also potentially lead to inadvertent extubation.",@"four",@"five",@"six", nil];
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"2.tif",@"3.tif",@"4.tif",@"5.tif",@"6.tif", nil];
    arrayOfCollapsed = [[NSMutableArray alloc]initWithObjects:@YES,@YES,@YES,@YES,@YES,@YES, nil];
    arrayOfOrigins = [[NSMutableArray alloc]initWithObjects:@0.0,@310.0,@620.0,@930.0,@1240.0,@1550.0, nil];
    arrayOfShown = [[NSMutableArray alloc]initWithObjects:@YES,@YES,@YES,@YES,@YES,@YES, nil];
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
    [[cell description]setText:[arrayOfText objectAtIndex:indexPath.item]];//[NSString stringWithFormat:@"%f", cell.frame.origin.x] ];
    [cell showButton].hiddenText = [cell description];
    [[cell showButton] setTag:indexPath.item];
    if([[arrayOfShown objectAtIndex:indexPath.item]boolValue]){
        [cell showButton].hiddenText.alpha=1.0f;
        [[cell showButton] setTitle:@"Hide" forState:UIControlStateNormal];
        [cell showButton].showing = YES;
    } else {
        [cell showButton].hiddenText.alpha=0.0f;
        [[cell showButton] setTitle:@"Show" forState:UIControlStateNormal];
        [cell showButton].showing = NO;
    }
    /*[[cell evaluationText]setText:[arrayOfText objectAtIndex:indexPath.item]];
    NSString *text = [NSString stringWithFormat:@"%d)",indexPath.item];
    [[cell evaluationLabel]setText:text];
    [cell evaluationResult].selectedSegmentIndex= [[arrayOfResults objectAtIndex:indexPath.item] integerValue];
    [[cell evaluationResult]setTag:indexPath.item];
    */
    if([[arrayOfCollapsed objectAtIndex:indexPath.item] boolValue]){
       /* [UIView animateWithDuration:0.5 animations:^{
            cell.frame= CGRectMake([[arrayOfOrigins objectAtIndex:indexPath.item]floatValue], cell.frame.origin.y, 150.0f, 600.0f);}];*/
        cell.frame= CGRectMake([[arrayOfOrigins objectAtIndex:indexPath.item]floatValue], cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    }
    return cell;
}
- (IBAction)showText:(ShowTextButton *)sender {
    if(sender.showing == YES){//![[arrayOfShown objectAtIndex:sender.tag]boolValue]){
        [UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 0.0f;}];
        [sender setTitle:@"Show" forState:UIControlStateNormal];
        arrayOfShown[sender.tag] = @NO;
        sender.showing = NO;
    } else{
        [UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 1.0f;}];
        [sender setTitle:@"Hide" forState:UIControlStateNormal];
        arrayOfShown[sender.tag] = @YES;
        sender.showing = YES;
    }
}

@end
