//
//  EvaluationViewController.m
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "EvaluationViewController.h"
#import "TestResult.h"
#import "GraphingView.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface EvaluationViewController (){
    NSMutableArray *arrayOfText;
    NSMutableArray *arrayOfResults;
	NSMutableArray *arrayOfComments;
    int totalQuestions;
    int correctAnswers;
    //NSString *comments;
}
@property (weak, nonatomic) IBOutlet UITextView *commentField;
//@property (strong,nonatomic) NSString *comments;
@property (strong, nonatomic)NSString *comments;
@property (strong, nonatomic) TestResult *evalResult;
@property (nonatomic) float grade;
@property (strong, nonatomic) IBOutlet UITextView *resultsDisplay;
@property (strong, nonatomic) IBOutlet GraphingView *graphDisplay;
@end

@implementation EvaluationViewController
# define TEST_NAME @"EvalResult_All"
- (TestResult *)evalResult{
    if(!_evalResult){
        _evalResult = [[TestResult alloc] init];
    }
    _evalResult.type = TEST_NAME;
    return _evalResult;
}
- (IBAction)openComments:(id)sender {
	if (self.commentField.alpha < 1.0) {
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
            self.commentField.frame = CGRectMake(20, 180, self.commentField.frame.size.width, self.commentField.frame.size.height);
            [UIView animateWithDuration:0.5 animations:^{self.commentField.alpha = 1.0;}];
            [self.commentField becomeFirstResponder];
        }
        else {
            self.commentField.frame = CGRectMake(20, 500, 728, 176);
            [UIView animateWithDuration:0.5 animations:^{self.commentField.alpha = 1.0;}];
            [self.commentField becomeFirstResponder];
        }
	}
	else {
		[UIView animateWithDuration:0.5 animations:^{self.commentField.alpha = 0.0;}];
		[self.commentField resignFirstResponder];
	}
}
- (IBAction)submitEvaluation:(id)sender {
    _grade = (float)correctAnswers/(float)totalQuestions;
    self.evalResult.grade = self.grade;
    NSString *displayText = @"";
    for (TestResult *result in [TestResult allTestResults:TEST_NAME]){
        displayText = [displayText stringByAppendingFormat:@"Grade: %f (%@, %0g)\n", result.grade,result.end, round(result.duration)]; 
    }
    self.resultsDisplay.text = displayText;
	/*UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Evaluation Complete:" message:@"Submit your responses?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
	[alert show];*/
}
- (IBAction)beginEval:(UIButton *)sender {
    self.evalResult = nil;
    //GraphingView *myView = [[GraphingView alloc] initWithFrame: CGRectMake(20, 100, 280, 250)];
    //myView.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:myView];
    //_visualResults.alpha = .5;
    /*CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor blueColor].CGColor;
    sublayer.shadowOffset = CGSizeMake(0, 3);
    sublayer.shadowRadius = 5.0;
    sublayer.shadowColor = [UIColor blackColor].CGColor;
    sublayer.shadowOpacity = 0.8;
    sublayer.frame = CGRectMake(30, 30, 128, 192);

    [_visualResults.layer addSublayer:sublayer];*/
    [_graphDisplay setNeedsDisplay];
    //[_visualResults setNeedsDisplay];
    //[_visualResults setNeedsLayout];
    //[_visualResults drawRect:_visualResults.frame];
    /*
    CGPoint center = CGPointMake(50,50);
    float rectangleWidth = 100.0;
    float rectangleHeight = 100.0;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx,CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight));
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor grayColor] CGColor]);
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, [[UIColor greenColor] CGColor]);
    CGContextAddRect(ctx,CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight));
    CGContextFillPath(ctx);*/
    //need to reset everything
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 1) {
        _grade = (float)correctAnswers/(float)totalQuestions;
        self.evalResult.grade = self.grade;
        
		[self.navigationController popToRootViewControllerAnimated:YES];
	}
}

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
    [[self evaluationCollection]setDataSource:self];
    [[self evaluationCollection]setDelegate:self];
    /*if(_comments == NULL){
        _comments = @"Comments:";
    }*/
    NSString *storedComment = [self getStoredComments];
    if(storedComment){
        self.commentField.text = storedComment;
    }
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(changedComment:)
     name:UITextViewTextDidEndEditingNotification
     object:_commentField];
	self.evaluationCollection.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
	self.commentField.alpha = 0.0;
	self.commentField.layer.cornerRadius = 8.0f;
	self.commentField.layer.masksToBounds = NO;
	self.commentField.layer.borderWidth = 1.0f;
	self.commentField.layer.shadowColor = [UIColor blackColor].CGColor;
	self.commentField.layer.shadowOpacity = 0.2;
	self.commentField.layer.shadowRadius = 5;
	self.commentField.layer.shadowOffset = CGSizeMake(10.f, 10.0f);
    arrayOfText = [[NSMutableArray alloc]initWithObjects:
                   @"Trainee patient’s history, including indications for the operation",
                   @"Trainee payed attention to the patient during induction of anesthesia, especially during intubation and was ready to help if needed.",
                   @"Once the patient was intubated and an IV has been placed, trainee assisted with bed turning.",
                   @"Once the bed is turned 90 degrees, trainee is appropriately gowned, gloved and wearing appropriate eye protection.",
                   @"Adjusted a headlight appropriately.",
                   @"Positioned patient appropriately",
                   @"Trainee both initiated time out and performed an appropriate time out (key to mention risk of airway fire and have it acknowledged)",
                   @"Trainee properly and efficiently positioned mouth gag with tongue appropriately positioned",
                   @"Trainee appropriately changed gag blade as needed",
                   @"Trainee assisted in securing gag to Mayo",
                   @"Trainee checked for possible leak and/or recognized leak",
                   @"Trainee inspected palate: both hard and soft palates and check palate’s contact point with Passavant’s ridge.",
                   @"If appropriate, trainee recognized need for limited/anterior adenoidectomy.",
                   @"Optional: trainee palpated tonsils.",
                   @"If the tonsils were obstructing view of the nasopharynx, the trainee was able to independently proceed with tonsillectomy first.",
                   @"Trainee appropriately suspended palate without placing Kelly clamp close to eye.",
                   @"If resistance was met during insertion, trainee was able to insert catheter without undue mucosa trauma (twisting motion/saline and/or oxymetazoline).",
                   @"Trainee inspects adenoids and was able to identify the tori and vomer and notified his mentor of the tori’s position.",
                   @"If adenoids were infected, the trainee requested intraoperative antibiotics.",
                   @"If adenoids were enlarged, trainee either started near the vomer or was able to safely start at the border of the tori.",
                   @"Once started, the trainee efficiently removed the adenoids (back and forth fluid strokes) without starting/stopping frequently.",
                   @"Trainee removed an appropriate amount of lymphoid tissue:\na) Did not enter muscle\nb) Left an appropriate cuff posteriorly",
                   @"Trainee appropriately packed the nasopharynx with tonsil balls.",
                   @"Trainee placed tonsil ball strings out of the way.",
                   @"Trainee appropriately grasped the tonsils with an Allis clamp on first attempt.",
                   @"Trainee retracted tonsil to delineate anterior pillar musculature.",
                   @"Trainee placed mucosal incision in appropriate location.",
                   @"Trainee made sure levels were appropriately set before using the Bovie pencil.",
                   @"Trainee held Bovie pencil appropriately.",
                   @"Trainee did not plunge Bovie tip on the initial incision.",
                   @"Trainee appropriately identified plane of dissection.",
                   @"During tonsillectomy, trainee appropriately “feathered” their strokes (fluid motion without much stopping/starting) and kept the Bovie tip closer to lymphoid tissue.",
                   @"Trainee appropriately identified vessels as they appeared: both in field of dissection and in the area previously dissected.",
                   @"Trainee appropriately distracted the tonsil (using both medial pull and the alligator (medial) roll) during dissection.",
                   @"Trainee appropriately regrasped tonsil when necessary (and did not mutilate the tonsil by repositioning too frequently).",
                   @"If tonsils were hypervascular, trainee quickly placed pressure over bleeding by either pressing tonsil back into anatomic position or placing tonsil ball in fossa.",
                   @"Trainee appropriately amputated the inferior tonsillar tissue.",
                   @"Trainee was aware of endotracheal tube and double-checked with anesthesiology that oxygen was dialed down before addressing inferior pole.",
                   @"If it appeared, trainee recognized exposure of a branch of the glossopharyngeal nerve and avoided undue cauterization of the nerve.",
                   @"If the tonsils were inflamed and plane of dissection difficult to assess, trainee was able to avoid violating muscular boundaries.",
                   @"If the pharyngeal musculature was violated, trainee appropriately addressed the exposure.",
                   @"Trainee made an effort to place symmetric incision during contralateral tonsillectomy.",
                   @"Trainee preserved the anterior pillars bilaterally.",
                   @"Trainee preserved the posterior pillars bilaterally.",
                   @"Trainee palpated both tonsils upon their removal.",
                   @"Trainee disarmed the Bovie pencil by removing the tip.",
                   @"Trainee appropriately inspected both tonsillar fossae.",
                   @"Trainee was able to appropriately inspect the superior tonsillar poles.",
                   @"If residual tonsillar tissue was present, trainee appropriately cauterized it or removed it.",
                   @"When using the suction Bovie, the trainee had an effective, light touch and did not bury the tip.",
                   @"Trainee appropriately increased the settings of the suction Bovie before cauterizing the adenoid bed.",
                   @"Trainee appropriately bent the suction Bovie.",
                   @"Trainee efficiently cauterized the adenoid bed (again trying to keep a light touch and addressing all vigorous bleeding first).",
                   @"Trainee informed anesthesiology team that the operation was nearing its end.",
                   @"Trainee let gag (gently) down for an appropriate amount of time.",
                   @"If it was a difficult dissection, trainee recognized need to let gag down for an appropriate amount of time after 20-30 minutes elapsed.",
                   @"Trainee carefully reinspected both adenoid bed and the tonsillar fossae.",
                   @"During inspection, trainee appropriately requested both orogastric tube and oral airway in a timely fashion (if they were not already available).",
                   @"Trainee opted to irrigate the wounds with saline (optional).",
                   @"Trainee suctioned out nasal cavities with suspension catheter.",
                   @"Trainee irrigated nasal cavities if infected (optional).",
                   @"Trainee suctioned stomach with OG tube.",
                   @"Trainee placed oral airway before removing gag.",
                   @"During gag removal, trainee appropriately protected the endotracheal tube.",
                   @"During and after gag removal, trainee inspected gums, teeth, tongue and lips for damage.",
                   @"If the gag blade furrowed the tongue, trainee notified the attending of the finding.",
                   @"Trainee removed head draping and shoulder roll.",
                   @"Trainee cleaned blood from face/nose.",
                   @"Trainee assisted in turning bed.",
                   @"Trainee confirmed the operation with the OR nurses.",
                   @"Trainee remained vigilant during extubation.",
                   @"Trainee remained calm throughout the operation.",
                   @"Trainee treated every one respectfully during the operation.",
                   @"Trainee appropriately asked for help/assistance when needed.",
                   @"Trainee asked for performance feedback immediately after the operation.",
                   @"Trainee took:\na) 15 minutes or less to complete the operation\nb) 16-20 minutes to complete the operation\nc) 21-25 minutes to complete the operation\nd) 26-30 minutes to complete the operation\ne) 31-35 minutes to complete the operation\nf) 36-40 minutes to complete the operation\ng) 41-45 minutes to complete the operation.\nh) More than 45 minutes to complete the operation.",nil];
    arrayOfResults = [[NSMutableArray alloc]initWithCapacity:arrayOfText.count];
    arrayOfComments = [[NSMutableArray alloc]initWithCapacity:arrayOfText.count];
    for(int i =0; i < arrayOfText.count; i++){
        arrayOfResults[i] =  [NSNumber numberWithInt:1];
    }
	for(int i =0; i < arrayOfText.count; i++){
        arrayOfComments[i] =  @"...";
    }
    totalQuestions = arrayOfText.count;
    correctAnswers = totalQuestions;
    _grade = 1.0f;
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfText count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    EvaluationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell evaluationText]setText:[arrayOfText objectAtIndex:indexPath.item]];
    NSString *text = [NSString stringWithFormat:@"%d)",indexPath.item];
    [[cell evaluationLabel]setText:text];
    [cell evaluationResult].selectedSegmentIndex= [[arrayOfResults objectAtIndex:indexPath.item] integerValue];
    [[cell evaluationResult]setTag:indexPath.item];
    
    return cell;
}
- (IBAction)mark:(UIButton *)sender {
    if([sender.titleLabel.text isEqualToString:(@"X")]){
        arrayOfResults[sender.tag] = @"YES";
    } else {
        arrayOfResults[sender.tag] = @"NO";
    }
    
    [_evaluationCollection reloadData];
}
- (IBAction)resultMarked:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==0){
        arrayOfResults[sender.tag] = [NSNumber numberWithInt:0];
        correctAnswers--;
    } else{
        arrayOfResults[sender.tag] = [NSNumber numberWithInt:1];
        correctAnswers++;
    }
    [_evaluationCollection reloadData];
}
#define ALL_COMMENTS_KEY @"comments_ALL"
-(void)synchronize{
    //NSString *commentsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] stringForKey:ALL_COMMENTS_KEY] mutableCopy];
    //if(!commentsFromUserDefaults) commentsFromUserDefaults = [[NSString alloc]init];
    //commentsFromUserDefaults = self.comments;
    //commentsFromUserDefaults = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:self.comments forKey:ALL_COMMENTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)changedComment:(UITextView *)sender{
    self.comments = _commentField.text;
    [self synchronize];
}
-(NSString *)getStoredComments{
    return [[NSUserDefaults standardUserDefaults] stringForKey:ALL_COMMENTS_KEY];
}/*
+ (NSString *) returnComments{
    NSString * resultComments = [[NSString alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]){
        resultComments = [[NSString alloc] initFromPropertyList:plist];
    }
}
-(id)initFromPropertyList:(id)plist{
    self = [self init];
    if(self){
        if([plist isKindOfClass:[NSDictionary class]]){
            NSDictionary *resultsDictionary = (NSDictionary *)plist;
            _comments = resultsDictionary[@"comments2"];
        }
    }
    return self;
}
  */


@end
