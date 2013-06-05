//
//  EvaluationViewController.m
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "EvaluationViewController.h"

@interface EvaluationViewController (){
    NSMutableArray *arrayOfText;
}

@end

@implementation EvaluationViewController

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
    [[cell evaluationScore]setText:@"_/5"];
    return cell;
}


@end