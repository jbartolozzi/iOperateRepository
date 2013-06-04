//
//  PhotoViewerViewController.m
//  iOperate
//
//  Created by Max Gilbert on 5/17/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//  THIS IS A BIG CHANGE

#import "PhotoViewerViewController.h"

@interface PhotoViewerViewController (){
	MPMoviePlayerController *moviePlayerController;
	NSMutableArray *arrayOfImages;
    NSMutableArray *arrayOfDescriptions;
	int currentButtonNum;
	int mainFontSize;
    float imageCenter;
    bool fullScreen;
}
@property (weak, nonatomic) IBOutlet UICollectionView *thumbnailCollectionView;
@property (weak, nonatomic) IBOutlet UITextView *textFieldViewer;
@property (strong, nonatomic) IBOutlet UIImageView *imageDisplay;/*
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *photoButtons;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *photoButtonsOrdered;

@property (strong, nonatomic)NSMutableArray *photoButtons;
@property (strong, nonatomic) NSArray *photoButtonsOrdered;*/
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollWindow;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIView *toolsView;
- (IBAction)activateTools:(id)sender;
- (IBAction)ButtonPress:(UIButton *)sender;
- (IBAction)increaseFontSize:(id)sender;
- (IBAction)decreaseFontSize:(id)sender;
@end

@implementation PhotoViewerViewController

typedef enum possibleMoveDirection {
	LEFT,
	RIGHT
} moveDirection;

- (void)awakeFromNib {
    self.imageDisplay.layer.shadowColor = [UIColor purpleColor].CGColor;
    self.imageDisplay.layer.shadowOffset = CGSizeMake(0, 1);
    self.imageDisplay.layer.shadowOpacity = 1;
    self.imageDisplay.layer.shadowRadius = 1.0;
    self.imageDisplay.clipsToBounds = NO;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
    imageCenter = self.view.center.x;
    fullScreen = NO;
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"2.tif",@"3.tif",@"4.tif",@"5.tif",@"6.tif",@"7.tif",@"8.tif",@"9.tif",@"10.tif",@"11.tif",@"12.tif",@"13.tif",@"14.tif",@"15.tif",nil];
    
    arrayOfDescriptions = [[NSMutableArray alloc]initWithObjects:
						   @"Test Page 1 Test Page 1 Test Page 1 Test Page 1 Test Page 1 Test Page 1 Test Page 1 Test Page 1",
						   @"Test Page 2 Test Page 2 Test Page 2 Test Page 2 Test Page 2 Test Page 2 Test Page 2 Test Page 2",
						   @"Test Page 3 Test Page 3 Test Page 3 Test Page 3 Test Page 3 Test Page 3 Test Page 3 Test Page 3",
						   @"Test Page 4 Test Page 4 Test Page 4 Test Page 4 Test Page 4 Test Page 4 Test Page 4 Test Page 4",
						   @"Test Page 5 Test Page 5 Test Page 5 Test Page 5 Test Page 5 Test Page 5 Test Page 5 Test Page 5",
						   @"Test Page 6 Test Page 6 Test Page 6 Test Page 6 Test Page 6 Test Page 6 Test Page 6 Test Page 6",
						   @"Test Page 7 Test Page 7 Test Page 7 Test Page 7 Test Page 7 Test Page 7 Test Page 7 Test Page 7",
						   @"Test Page 8 Test Page 8 Test Page 8 Test Page 8 Test Page 8 Test Page 8 Test Page 8 Test Page 8",
						   @"Test Page 9 Test Page 9 Test Page 9 Test Page 9 Test Page 9 Test Page 9 Test Page 9 Test Page 9",
						   @"Test Page 10 Test Page 10 Test Page 10 Test Page 10 Test Page 10 Test Page 10 Test Page 10 Test Page 10",
						   @"Test Page 11 Test Page 11 Test Page 11 Test Page 11 Test Page 11 Test Page 11 Test Page 11 Test Page 11",
						   @"Test Page 12 Test Page 12 Test Page 12 Test Page 12 Test Page 12 Test Page 12 Test Page 12 Test Page 12",
						   @"Test Page 13 Test Page 13 Test Page 13 Test Page 13 Test Page 13 Test Page 13 Test Page 13 Test Page 13",
						   @"Test Page 14 Test Page 14 Test Page 14 Test Page 14 Test Page 14 Test Page 14 Test Page 14 Test Page 14",
						   @"Test Page 15 Test Page 15 Test Page 15 Test Page 15 Test Page 15 Test Page 15 Test Page 15 Test Page 15",
						   nil];
	
    NSComparator compareTags = ^(id a, id b)
    {
        if ([a tag] > [b tag]) {
        return (NSComparisonResult)NSOrderedDescending;
    } if ([a tag] < [b tag]){
        return (NSComparisonResult)NSOrderedAscending; } return (NSComparisonResult)NSOrderedSame;
    };
	
    //self.photoButtonsOrdered = [self.photoButtons sortedArrayUsingComparator:compareTags];
    [[self.textFieldViewer layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.textFieldViewer layer] setBorderWidth:1.5];
    [[self.textFieldViewer layer] setCornerRadius:2];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	// Shadows for Image View
	self.imageDisplay.layer.shadowColor = [UIColor grayColor].CGColor;
    self.imageDisplay.layer.shadowOffset = CGSizeMake(2, 2);
    self.imageDisplay.layer.shadowOpacity = 1;
    self.imageDisplay.layer.shadowRadius = 10.0;
    self.imageDisplay.clipsToBounds = NO;
	
	self.toolsView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.toolsView.layer.shadowOffset = CGSizeMake(2, 2);
    self.toolsView.layer.shadowOpacity = 1;
    self.toolsView.layer.shadowRadius = 10.0;
    self.toolsView.clipsToBounds = NO;
	[[self.toolsView layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.toolsView layer] setBorderWidth:0.1];
    [[self.toolsView layer] setCornerRadius:8];
	self.toolsView.hidden = YES;
	mainFontSize = 14;
	self.textFieldViewer.font = [UIFont fontWithName:self.textFieldViewer.font.fontName size:mainFontSize];
    //_myCollectionView.
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void) setPhotoButtons:(NSArray*)photoButtons{
    currentButtonNum=0;
    _photoButtons = photoButtons;
    for(UIButton* button in _photoButtons){
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
}*/
- (IBAction)activateTools:(id)sender {
	if (self.toolsView.hidden == YES) {
		self.toolsView.hidden = NO;
		[UIView animateWithDuration:0.4 animations:^{ self.toolsView.frame = CGRectMake(561, 240, 218, 480);}];
	}
	else {
		[UIView animateWithDuration:0.4 animations:^{ self.toolsView.frame = CGRectMake(700, 240, 218, 480);}];
		self.toolsView.hidden = YES;
	}
}

- (IBAction)ButtonPress:(UIButton*)sender {
    UIImage* buttonImage = sender.imageView.image;
    /*for (int i = 0; i < [self.photoButtons count]; i++) {
        UIButton *element = [self.photoButtons objectAtIndex:i];
        element.alpha = 0.5;
    }*/
    //sender.alpha = 1.0;
    self.textFieldViewer.text = sender.titleLabel.text;
    [_imageDisplay setImage:buttonImage];
	
	if (sender.tag == 8) {
		[self playMovie];
	}
    
    currentButtonNum = sender.tag;
    [_myCollectionView reloadData];
}

- (IBAction)increaseFontSize:(id)sender {
	mainFontSize++;
	self.textFieldViewer.font = [UIFont fontWithName:self.textFieldViewer.font.fontName size:mainFontSize];
}

- (IBAction)decreaseFontSize:(id)sender {
	mainFontSize--;
	self.textFieldViewer.font = [UIFont fontWithName:self.textFieldViewer.font.fontName size:mainFontSize];
}

- (IBAction)buttonLeft:(UIButton *)sender {
    if(currentButtonNum>0){
        currentButtonNum-=1;
	/*
		for (int i = 0; i < [self.photoButtons count]; i++) {
			UIButton *element = [self.photoButtons objectAtIndex:i];
			element.alpha = 0.5;
		}*/
		[self button:self.leftButton moveInDirection:LEFT];
    }
}
- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender {
    if(currentButtonNum>0){
        currentButtonNum-=1;
		/*for (int i = 0; i < [self.photoButtons count]; i++) {
			UIButton *element = [self.photoButtons objectAtIndex:i];
			element.alpha = 0.5;
		}*/
		[self button:self.leftButton moveInDirection:LEFT];
    }
}
- (IBAction)buttonRight:(UIButton *)sender {
    if(currentButtonNum<arrayOfImages.count-1){
        currentButtonNum+=1;
		/*for (int i = 0; i < [self.photoButtons count]; i++) {
			UIButton *element = [self.photoButtons objectAtIndex:i];
			element.alpha = 0.5;
		}*/
		[self button:self.rightButton moveInDirection:RIGHT];
    }
}
- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    if(currentButtonNum<arrayOfImages.count-1){
        currentButtonNum+=1;
		/*for (int i = 0; i < [arrayOfImages count]; i++) {
			UIButton *element = [self.photoButtons objectAtIndex:i];
			element.alpha = 0.5;
		}*/
		[self button:self.rightButton moveInDirection:RIGHT];
    }
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
		self.scrollWindow.frame = CGRectMake(0, 639, 1024, 109);
        self.imageDisplay.frame = CGRectMake(20, 20, 505, 580);
        self.textFieldViewer.frame = CGRectMake(538, 20, 466, 580);
		
		self.rightButton.enabled = NO;
		self.leftButton.enabled = NO;
		[UIView animateWithDuration:1.0 animations:^{self.leftButton.alpha = 0.0;}];
		[UIView animateWithDuration:1.0 animations:^{self.rightButton.alpha = 0.0;}];
    }
    else
    {
		self.scrollWindow.frame = CGRectMake(0, 895, 768, 109);
        self.imageDisplay.frame = CGRectMake(20, 11, 728, 558);
        self.textFieldViewer.frame = CGRectMake(20, 577, 728, 300);
		
		self.leftButton.enabled = YES;
		self.rightButton.enabled = YES;
		[UIView animateWithDuration:1.0 animations:^{self.leftButton.alpha = 1.0;}];
		[UIView animateWithDuration:1.0 animations:^{self.rightButton.alpha = 1.0;}];
    }
}

- (void) playMovie {
	UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Play Movie" message:@"Would you like to play the selected media?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1) {
		NSString *filepath = [[NSBundle mainBundle] pathForResource:@"mov1" ofType:@"mov"];
		NSURL *fileURL = [NSURL fileURLWithPath:filepath];
		moviePlayerController= [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
		moviePlayerController.scalingMode = MPMovieScalingModeAspectFill;
		[self.view addSubview:moviePlayerController.view];
		moviePlayerController.fullscreen = YES;
		
		[moviePlayerController play];
    }
}

- (void) button:(UIButton*)DirectionButton moveInDirection:(moveDirection)inDirection {
	//UIButton *button = [self.photoButtonsOrdered objectAtIndex:currentButtonNum];
    //[NSIndexPath alloc]in
    //NSIndexPath *currentButtonPath =  [NSIndexPath indexPathForItem:currentButtonNum inSection:1];
	/*CustomCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath: [NSIndexPath indexPathForItem:currentButtonNum inSection:0]];
    [[cell myButton] setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]forState:UIControlStateNormal];
    [[cell myDescriptionLabel]setText:[arrayOfDescriptions objectAtIndex:currentButtonNum]];
    NSString *segueIdentifier = [arrayOfDescriptions objectAtIndex:currentButtonNum];
    [[cell myButton]setTitle:segueIdentifier forState:normal];
    [[cell myButton].imageView setAlpha:.2f];
    [[cell myButton]setContentMode:UIViewContentModeScaleAspectFit];*/
    //CustomCell *cell = [self.myCollectionView [self.myCollectionView indexPathsForSelectedItems] objectAtIndex:currentButtonNum];
	if (inDirection == LEFT) {
		[_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
		
		// Animate Button
		[UIView animateWithDuration:0.1 animations:^{
			DirectionButton.frame = CGRectMake(DirectionButton.frame.origin.x + 10, DirectionButton.frame.origin.y,DirectionButton.frame.size.width, DirectionButton.frame.size.height);
		}];
		[UIView animateWithDuration:0.2 animations:^{
			DirectionButton.frame = CGRectMake(DirectionButton.frame.origin.x - 10, DirectionButton.frame.origin.y,DirectionButton.frame.size.width, DirectionButton.frame.size.height);
		}];
		
		// Animate Image
		if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(-1000, 20, 505, 580);}];
			//[self.imageDisplay setImage:button.imageView.image];
            [_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(20, 20, 505, 580);}];
		}
		else {
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(-1000, 11, 620, 558);}];
			//[self.imageDisplay setImage:button.imageView.image];
            [_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(74, 11, 620, 558);}];
		}
		
		
		// Animate Text Field
		//UIButton *button = [self.photoButtonsOrdered objectAtIndex:currentButtonNum];
		//[[cell myButton] setAlpha:1.0f];//button.alpha = 1.0;
		[UIView animateWithDuration:0.5 animations:^{self.textFieldViewer.alpha = 0.0;}];
		self.textFieldViewer.text =[arrayOfDescriptions objectAtIndex:currentButtonNum];
		[UIView animateWithDuration:0.5 animations:^{self.textFieldViewer.alpha = 1.0;}];
	}
	else if (inDirection == RIGHT) {
		[_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
		[UIView animateWithDuration:0.1 animations:^{
			DirectionButton.frame = CGRectMake(DirectionButton.frame.origin.x - 10, DirectionButton.frame.origin.y,DirectionButton.frame.size.width, DirectionButton.frame.size.height);
		}];
		[UIView animateWithDuration:0.2 animations:^{
			DirectionButton.frame = CGRectMake(DirectionButton.frame.origin.x + 10, DirectionButton.frame.origin.y,DirectionButton.frame.size.width, DirectionButton.frame.size.height);
		}];
		
		
		if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(+1000, 20, 505, 580);}];
            [_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(20, 20, 505, 580);}];
		}
		else {
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(+1000, 11, 620, 558);}];
            [_imageDisplay setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:currentButtonNum]]];
			[UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(74, 11, 620, 558);}];
		}
		
		
		//UIButton *button = [self.photoButtonsOrdered objectAtIndex:currentButtonNum];
		//[[cell myButton] setAlpha:1.0f];
		[UIView animateWithDuration:0.5 animations:^{self.textFieldViewer.alpha = 0.0;}];
		self.textFieldViewer.text =[arrayOfDescriptions objectAtIndex:currentButtonNum];
		[UIView animateWithDuration:0.5 animations:^{self.textFieldViewer.alpha = 1.0;}];
	}
    [_myCollectionView reloadData];
	
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfDescriptions count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell myButton] setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]forState:UIControlStateNormal];
    [[cell myDescriptionLabel]setText:[arrayOfDescriptions objectAtIndex:indexPath.item]];
    NSString *segueIdentifier = [arrayOfDescriptions objectAtIndex:indexPath.item];
    [[cell myButton]setTitle:segueIdentifier forState:normal];
    [[cell myButton] setAlpha:.2f];
    if(indexPath.item==currentButtonNum){
        [[cell myButton] setAlpha:1.0f];
    }
    [[cell myButton]setContentMode:UIViewContentModeScaleAspectFit];
    [[cell myButton] setTag:indexPath.item];
    return cell;
}

- (IBAction)buttonPress:(UIButton *)sender {
    
    NSString *segueIdentifier = sender.titleLabel.text;
    //NSString *segueIdentifier =  sender.description;
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}
- (IBAction)panImage:(UIPanGestureRecognizer *)sender {
    //[_imageOne setCenter: CGPointMake(_imageOne.center.x+[sender translationInView:self.view].x, _imageOne.center.y+[sender translationInView:self.view].y)];
    //[sender tr]
    CGPoint translation = [sender translationInView:self.view];
    float addX = translation.x+imageCenter;
    //float addY = y;
    [_imageDisplay setCenter:CGPointMake(addX, _imageDisplay.center.y)];
    if(sender.state ==UIGestureRecognizerStateEnded){
        float velX = [sender velocityInView:self.view].x;
        
        if(velX >200){
            if(currentButtonNum>0){
                currentButtonNum-=1;
                [self button:self.leftButton moveInDirection:LEFT];
            }
        }else if(velX <-200){
            if(currentButtonNum<arrayOfImages.count-1){
                currentButtonNum+=1;
                [self button:self.rightButton moveInDirection:RIGHT];
            }
        }
        if((velX<=200&&velX>=-200)||currentButtonNum==arrayOfImages.count-1 || currentButtonNum==0){
            if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
                [UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(20, 20, 505, 580);}];
            }
            else {
                [UIView animateWithDuration:0.5 animations:^{self.imageDisplay.frame = CGRectMake(74, 11, 620, 558);}];
               
            }
        }
        imageCenter = _imageDisplay.center.x;
        //y = _imageOne.center.y;
    }
    //if([sender )
    //[_imageOne setCenter:CGPointMake(100.0, 100.0)];
    //[_imageOne setAlpha:0.0];
}
- (IBAction)Expand:(UIButton *)sender {
     //[UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, self.view.center.y-51, 768, 103);}];
    /*[_myCollectionView performBatchUpdates:^{[UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, 10, 768, 103);}];}
                                completion:^(BOOL finished){if(finished){[UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, 856, 768, 103);}];};}];*/
    /*[_myCollectionView performBatchUpdates:^{_myCollectionView an}
                                completion:^(BOOL finished){if(finished){[UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, 856, 768, 103);}];};}];*/
    //CABasicAnimation *grow = [CABasicAnimation animation];
    //[grow setToValue:[NSNumber numberWithInt:10]];
    //[UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, 10, 500, 103);}];
    //[UIView animateWithDuration:0.5 delay:10 options:UIViewAnimationOptionBeginFromCurrentState animations:^{_myCollectionView.frame = CGRectMake(0, 857, 768, 103);} completion:nil];
    /*[_ViewForCollection setAutoresizesSubviews:YES];
    [_ViewForCollection setAutoresizingMask:UIViewAutoresizingFlexibleHeight];*/
    //[_myCollectionView setContentMode:UIViewContentModeBottom];
    //[_ViewForCollection setContentMode:UIViewContentModeBottom];
    if(!fullScreen){
        //[_myCollectionView setBounds:CGRectMake(0,0,768,300)];
        [UIView animateWithDuration:.5 animations:^{_myCollectionView.frame = CGRectMake(0, self.view.center.y-51, 768, 103);}];
        //_myCollectionView.frame = CGRectMake(0, 0, 768, 103);
        fullScreen = YES;
        [_myCollectionView reloadData];
        [sender setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [UIView animateWithDuration:0.5 animations:^{_myCollectionView.frame = CGRectMake(0, 857, 768, 103);}];
        //_myCollectionView.frame = CGRectMake(0, 0, 768, 103);
        fullScreen = NO;
        [_myCollectionView reloadData];
        [sender setTitle:@"+" forState:UIControlStateNormal];
    }
}

@end
