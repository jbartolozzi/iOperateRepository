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
    NSMutableArray *arrayOfType;
    NSMutableArray *arrayOfWidths;
    NSMutableArray *arrayOfImages1;
    NSMutableArray *arrayOfImages2;
    NSMutableArray *arrayOfImages3;
    NSMutableArray *arrayOfImages4;
    NSMutableArray *arrayOfImages5;
    NSMutableArray *arrayOfImages6;
    NSMutableArray *arrayOfZoom;
    IBOutlet UIImageView *testPicture;
    IBOutlet UITextView *TextBottom;
    IBOutlet UIScrollView *ScrollViewer;
}

//@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *TextFields;
@end

@implementation TimeLineViewController

float widthOne = 110.0;
float widthTwo = 210.0;
float widthThree = 310.0;
int currentCell = 1;
int currentShown = 0;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotate
{
    if(self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return YES;
    
    return NO;
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
    [[self timeLineSubCollection] setDataSource:self];
    [[self timeLineSubCollection] setDelegate:self];
    [ScrollViewer setDelegate:self];
    _timeLineCollection.backgroundColor = [UIColor clearColor];
    _timeLineSubCollection.backgroundColor = [UIColor clearColor];
    
    arrayOfText = [[NSMutableArray alloc]initWithObjects:
                   @"Pay attention to the patient during induction of anesthesia, especially during intubation – be ready to help if it proves to be a difficult intubation.  Once the patient is intubated and an IV has been placed, initiate bed turning with your anesthesiology colleagues.\nOnce the bed is turned 90 degrees, the surgeon, who is gowned, gloved and wearing appropriate eye protection, puts on a headlight and adjusts it.  The scrub technician/nurse places a sheet over the patient’s body; you will evaluate the patient and position him/her.",
                   @"Once the time out has been performed a mouth gag is inserted.  You can use either a Crowe-Davis or McIvor mouth gag; the blade has a channel to accommodate the endotracheal tube.  There are three different size blades available for the gags.  The scrub nurse or technician will load the gag with the blade; as the gag is positioned, the fit of the blade is evaluated; if the fit is poor, the gag should be withdrawn and reloaded with the appropriate blade.  Poor blade choice or poor positioning of the mouth gag will impede access to the tonsillar issue so it is important to learn to position the gag properly and to learn to assess the fit of the blade.  Check to make sure the gag is fully closed.  Using thumb and middle finger as shown in the illustration, the surgeon scissors the mouth open.  With the mouth open check for loose teeth.  If any are loose, remove them prior to placing the gag.",
                   @"Once the gag is fully seated, the hook (that will seat onto the Mayo stand) is held with either the thumb, index or middle finger of one hand while the other hand grasps the gag as shown; holding the gag in this way allows bimanual opening of the gag and makes the opening efficient.  Open the gag with the index/middle finger, then use thumb opposition with the contralateral hand to effect the final opening.  Use judgment when opening the gag: forcing the gag can dislocate the patient’s temporomandibular joint and potentially injure it.  This is especially relevant if the patient has limited intercisural opening/trismus.  Once the gag is opened, its positioning relative to the tongue as well as the access to the tonsils are assessed.  The targeted tonsil should be visible in its entirety, from superior to inferior pole.  The gag, once opened, can compress the endotracheal tube and also potentially lead to inadvertent extubation.",@"four",@"five",@"six",@"7",@"8",@"9",@"10", nil];
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"2.tif",@"3.tif",@"4.tif",@"5.tif",@"6.tif",@"7.tif",@"8.tif",@"11.tif",@"12.tif", nil];
    arrayOfCollapsed = [[NSMutableArray alloc]initWithObjects:@YES,@YES,@YES,@YES,@YES,@YES, nil];
    arrayOfOrigins = [[NSMutableArray alloc]initWithObjects:@0.0,@310.0,@620.0,@930.0,@1240.0,@1550.0, nil];
    arrayOfShown = [[NSMutableArray alloc]initWithObjects:@YES,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO, nil];
    arrayOfType = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"3",@"1",@"1", nil];
    arrayOfZoom = [[NSMutableArray alloc]initWithObjects:@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,nil];
    
    arrayOfWidths = [[NSMutableArray alloc]initWithObjects:@300.0,@300.0,@300.0,@300.0,@300.0,@300.0, nil];
    arrayOfImages1 = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"1.tif",@"1.tif",@"1.tif",@"1.tif",@"1.tif", nil];
    arrayOfImages2 = [[NSMutableArray alloc]initWithObjects:@"2.tif",@"2.tif",@"2.tif",@"2.tif",@"2.tif",@"2.tif", nil];
    arrayOfImages3 = [[NSMutableArray alloc]initWithObjects:@"3.tif",@"3.tif",@"3.tif",@"3.tif",@"3.tif",@"3.tif", nil];
    arrayOfImages4 = [[NSMutableArray alloc]initWithObjects:@"4.tif",@"4.tif",@"4.tif",@"4.tif",@"4.tif",@"4.tif", nil];
    arrayOfImages5 = [[NSMutableArray alloc]initWithObjects:@"5.tif",@"5.tif",@"5.tif",@"5.tif",@"5.tif",@"5.tif", nil];
    arrayOfImages6 = [[NSMutableArray alloc]initWithObjects:@"6.tif",@"6.tif",@"6.tif",@"6.tif",@"6.tif",@"6.tif", nil];
    
    
    [self updateCells];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return testPicture;
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
    if(collectionView==_timeLineCollection){
        [[cell image]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]] ];
        //[[cell description]setText:[arrayOfText objectAtIndex:indexPath.item]];//[NSString stringWithFormat:@"%f", cell.frame.origin.x] ];
        //[cell showButton].hiddenText = [cell description];
        [[cell showButton] setTag:indexPath.item];
        [cell image].layer.shadowColor = [UIColor whiteColor].CGColor;
        [cell image].layer.shadowRadius = 9.0;
    if([[arrayOfShown objectAtIndex:indexPath.item]boolValue]){
        //[cell showButton].hiddenText.alpha=1.0f;
        //[[cell showButton] setTitle:@"Hide" forState:UIControlStateNormal];
        //[cell showButton].showing = YES;
        [cell bottomTick].alpha = 1.0;
        
        [cell image].layer.shadowOpacity = 1.0;
    } else {
        //[cell showButton].hiddenText.alpha=0.0f;
        //[[cell showButton] setTitle:@"Show" forState:UIControlStateNormal];
        //[cell showButton].showing = NO;
        [cell bottomTick].alpha = 0.0;
        
        [cell image].layer.shadowOpacity = 0.0;
    }
        
        
    /*[[cell evaluationText]setText:[arrayOfText objectAtIndex:indexPath.item]];
    NSString *text = [NSString stringWithFormat:@"%d)",indexPath.item];
    [[cell evaluationLabel]setText:text];
    [cell evaluationResult].selectedSegmentIndex= [[arrayOfResults objectAtIndex:indexPath.item] integerValue];
    [[cell evaluationResult]setTag:indexPath.item];
    */
    if(NO){//[[arrayOfCollapsed objectAtIndex:indexPath.item] boolValue]){
       /* [UIView animateWithDuration:0.5 animations:^{
            cell.frame= CGRectMake([[arrayOfOrigins objectAtIndex:indexPath.item]floatValue], cell.frame.origin.y, 150.0f, 600.0f);}];*/
        cell.frame= CGRectMake(cell.frame.origin.x, cell.frame.origin.y,  cell.frame.size.width,[[arrayOfWidths objectAtIndex:indexPath.item]floatValue]);
        /*cell.frame= CGRectMake(currentOrigin, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);*/
    }
    } else {
        
        /*if(currentCell == 1){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages1 objectAtIndex:indexPath.item]] ];
        } else if(currentCell == 2){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages2 objectAtIndex:indexPath.item]] ];
        } else if(currentCell == 3){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages3 objectAtIndex:indexPath.item]] ];
        } else if(currentCell == 4){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages4 objectAtIndex:indexPath.item]] ];
        } else if(currentCell == 5){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages5 objectAtIndex:indexPath.item]] ];
        } else if(currentCell == 6){
            [[cell image]setImage:[UIImage imageNamed:[arrayOfImages6 objectAtIndex:indexPath.item]] ];
        }*/
    }
    return cell;
}
- (void) updateCells{
    float currentOrigin = 0.0;
    for(int i = 0; i < arrayOfOrigins.count; i++){
        arrayOfOrigins[i] =@(currentOrigin);
        if([arrayOfType[i] intValue]==1){
            currentOrigin+=widthOne;
            arrayOfWidths[i] = @(100.0);
        }else if([arrayOfType[i] intValue]==2){
            currentOrigin +=widthTwo;
            arrayOfWidths[i] = @(200.0);
        }else{
            currentOrigin+=widthThree;
            arrayOfWidths[i] = @(300.0);
        }
    }
}
- (IBAction)showText:(ShowTextButton *)sender {
    //testPicture.frame = sender.frame;
    testPicture.alpha=0.0;
    TextBottom.alpha = 0.0;
    //if([arrayOfShown[sender.tag] boolValue]){//![[arrayOfShown objectAtIndex:sender.tag]boolValue]){
        //[UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 0.0f;}];
        //[sender setTitle:@"Show" forState:UIControlStateNormal];
        //arrayOfShown[sender.tag]
      //  arrayOfShown[sender.tag] = @NO;
        //sender.showing = NO;
   // } else{
        //[UIView animateWithDuration:0.5 animations:^{ sender.hiddenText.alpha= 1.0f;}];
    //[sender setTitle:@"Hide" forState:UIControlStateNormal];
    arrayOfShown[currentShown] = @NO;
        arrayOfShown[sender.tag] = @YES;
    //if(currentShown!=sender.tag){
    
    arrayOfZoom[currentShown] = @(ScrollViewer.zoomScale);
    ScrollViewer.zoomScale = [arrayOfZoom[sender.tag] floatValue];
    //}
    
    currentShown = sender.tag;
        //sender.showing = YES;
    //}
    currentCell = (int)(sender.tag)+1;
    [UIView animateWithDuration:0.5 animations:^{ testPicture.alpha= 1.0f;}];
    [UIView animateWithDuration:0.5 animations:^{ TextBottom.alpha= 1.0f;}];
    [testPicture setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:sender.tag]]];
    [TextBottom setText:[arrayOfText objectAtIndex:sender.tag]];
    //[UIView animateWithDuration:0.5 animations:^{ testPicture.frame= CGRectMake(20, 283, 463, 417);}];
    //[self collectionView:_timeLineCollection cellForItemAtIndexPath:path];
    [_timeLineCollection reloadData];
    //[_timeLineSubCollection reloadData];
}

@end