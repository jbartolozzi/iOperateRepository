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
                   @"Pay attention to the patient during induction of anesthesia, especially during intubation – be ready to help if it proves to be a difficult intubation.  Once the patient is intubated and an IV has been placed, initiate bed turning with your anesthesiology colleagues.",
                   @"Once the bed is turned 90 degrees, the surgeon, who is gowned, gloved and wearing appropriate eye protection, puts on a headlight and adjusts it.  The scrub technician/nurse places a sheet over the patient’s body; you will evaluate the patient and position him/her.",
                   @"Positioning of the patient is important.  Because of the relatively large size of a child’s occiput, a shoulder roll is usually indicated.  This can be in the form of a gel pad/roll, rolled-up towel/blanket, or an anesthesia donut folded in half.  It is important while placing the shoulder roll to carefully stabilize the head relative to the neck and move the two as a unit.  There is less chance of a cervical injury and less chance of displacing an endotracheal tube that way.  As always when moving an intubated patient, forewarn your anesthesia colleagues before doing so.  It is imperative to make sure that the head is not hanging during the case as that may cause a ligamentous injury.  Special attention must be paid to children with Trisomy 21, as they are more prone to C1-C2 subluxation.  If possible it is best for them to be in as neutral a position as possible.  Obese children are often more at risk of a ligamentous injury.  The full weight of their head should be supported by the underlying surface.  Some obese children will require a head rest rather than a shoulder role for optimal positioning.",
                   @"Once the patient is properly positioned, a time out is initiated – identify the patient, their medical record number, their date of birth, and the procedure.  For adenotonsillectomy, it is imperative to emphasize that there is a high risk of an airway fire and that the oxygen should be dialed to a minimum setting",
                   @"Once the time out has been performed a mouth gag is inserted.  You can use either a Crowe-Davis or McIvor mouth gag; the blade has a channel to accommodate the endotracheal tube.  There are three different size blades available for the gags.  The scrub nurse or technician will load the gag with the blade; as the gag is positioned, the fit of the blade is evaluated; if the fit is poor, the gag should be withdrawn and reloaded with the appropriate blade.  Poor blade choice or poor positioning of the mouth gag will impede access to the tonsillar issue so it is important to learn to position the gag properly and to learn to assess the fit of the blade.  Check to make sure the gag is fully closed.  Using thumb and middle finger as shown in the illustration, the surgeon scissors the mouth open.  With the mouth open check for loose teeth.  If any are loose, remove them prior to placing the gag.",
                   @" The surgeon then centers the endotracheal tube over the tongue, using a finger or a Hurd retractor.  The surgeon then dips the blade in saline, entering the mouth from the side; he/she fully seats the blade onto the tongue, centering the tube in the middle of the lingual tissue.  It is important to make sure the tip of the blade does not injure tissue as it is placed and the gag opened.  Before opening, the curved tooth guards are placed into position over the lateral incisors or canines as shown to protect the teeth and secure the gag.  The two tooth guards on the Crowe-Davis gag should have their silastic liners in place.  Do not open the gag unless the silastic liners are in place and the blade is centered over the endotracheal tube and tongue.  The upper lip can either be draped over the tooth guard or placed under it.",
                   @" The surgeon then centers the endotracheal tube over the tongue, using a finger or a Hurd retractor.  The surgeon then dips the blade in saline, entering the mouth from the side; he/she fully seats the blade onto the tongue, centering the tube in the middle of the lingual tissue.  It is important to make sure the tip of the blade does not injure tissue as it is placed and the gag opened.  Before opening, the curved tooth guards are placed into position over the lateral incisors or canines as shown to protect the teeth and secure the gag.  The two tooth guards on the Crowe-Davis gag should have their silastic liners in place.  Do not open the gag unless the silastic liners are in place and the blade is centered over the endotracheal tube and tongue.  The upper lip can either be draped over the tooth guard or placed under it.",
                   @"In some younger children the upper lip will be tight over the guard and will sit more comfortably under it.",
                   @"In some younger children the upper lip will be tight over the guard and will sit more comfortably under it.",
                   @"Once the gag is fully seated, the hook (that will seat onto the Mayo stand) is held with either the thumb, index or middle finger of one hand while the other hand grasps the gag as shown; holding the gag in this way allows bimanual opening of the gag and makes the opening efficient.  Open the gag with the index/middle finger, then use thumb opposition with the contralateral hand to effect the final opening.  Use judgment when opening the gag: forcing the gag can dislocate the patient’s temporomandibular joint and potentially injure it.  This is especially relevant if the patient has limited intercisural opening/trismus.  Once the gag is opened, its positioning relative to the tongue as well as the access to the tonsils are assessed.  The targeted tonsil should be visible in its entirety, from superior to inferior pole.  The gag, once opened, can compress the endotracheal tube and also potentially lead to inadvertent extubation.",
                   @"Once the gag is fully opened, the surgeon and the scrub nurse/technician will secure it to the Mayo.  Holding the gag in one hand and the Mayo in the other, the surgeon helps the scrub nurse/technician bring the Mayo stand into position and then GENTLY secure it to the Mayo stand.  The surgeon does not let go off the Mayo stand until the Mayo is properly locked into position.",
                   @"Once secured to the Mayo stand, it is wise to listen for leak and to make sure that the endotracheal tube is functioning appropriately.   If a cuffed tube is leaking, it wise to appropriately adjust the cuff’s inflation.  If a cuffless endotracheal tube is leaking, the surgeon can place moist gauze into the hypopharynx to “seal” the area.",
                   @"The opening of the gag induces a soft tissue reaction, which causes a lateral displacement of the tonsils, a phenomenon which at least partly explains the variability seen in the clinical assessment of tonsillar size.",
                   @"The opening of the gag induces a soft tissue reaction, which causes a lateral displacement of the tonsils, a phenomenon which at least partly explains the variability seen in the clinical assessment of tonsillar size.",
                    @"The opening of the gag induces a soft tissue reaction, which causes a lateral displacement of the tonsils, a phenomenon which at least partly explains the variability seen in the clinical assessment of tonsillar size.",
                   @"Once the gag is in place, it is important to both inspect and palpate the hard and soft palate for possible clefting.     A submucous cleft can occur either in the soft or the hard palate.  A midline muscular deficiency creates a soft palate submucous cleft.  These clefts can be subtle and are best appreciated by a careful sweeping motion across the defect; these soft palates are often shortened.  There can a visible mild lucency of the soft tissue in the midline; a bony defect is slightly easier to detect.",
                   @"A submucous cleft of the hard palate is a midline bony defect; these bony defects are best appreciate by sweeping a finger across the junction of the soft and hard palate.  A small central bony defect can be appreciated if it is present.   A bifid uvula can occur in association with a submucous cleft or independently.",
                   @"A submucous cleft of the hard palate is a midline bony defect; these bony defects are best appreciate by sweeping a finger across the junction of the soft and hard palate.  A small central bony defect can be appreciated if it is present.   A bifid uvula can occur in association with a submucous cleft or independently.",
                   @"It is also a good idea to simply press on the soft palate to see if it will easily coapt against the posterior pharyngeal wall.  Any clefting, including a submucous cleft of the palate, or any soft palate that does seem to easily coapt against the posterior pharyngeal wall may result in velopharyngeal insufficiency and should inform the extent of adenoid removal. Only a limited anterior adenoidectomy should be entertained if a submucous cleft is discovered.  Some surgeons also advocate palpating the tonsils to make sure that they are appropriately soft prior to their removal.  Others advocate feeling them immediately after their removal.  It is important to feel them at some point during the operation to determine if pathologic evaluation for tumor is necessary.",
                   @"It is also a good idea to simply press on the soft palate to see if it will easily coapt against the posterior pharyngeal wall.  Any clefting, including a submucous cleft of the palate, or any soft palate that does seem to easily coapt against the posterior pharyngeal wall may result in velopharyngeal insufficiency and should inform the extent of adenoid removal. Only a limited anterior adenoidectomy should be entertained if a submucous cleft is discovered.  Some surgeons also advocate palpating the tonsils to make sure that they are appropriately soft prior to their removal.  Others advocate feeling them immediately after their removal.  It is important to feel them at some point during the operation to determine if pathologic evaluation for tumor is necessary.",
                   @"Next insert a silastic suction catheter into the nose and grasp it with a Kelly clamp as it emerges from under the soft palate.  Suspend it with the Kelly clamp placed to the side.  Be sure to place the Kelly clamp where it cannot cause injury, well away from the eyes.  One can use one or two suction catheters.  If two catheters are used, a Kelly clamp is used ipsilaterally on each side to secure the catheters.   If only one is used, it often helps the exposure to secure it on the contralateral side.  One catheter often provides adequate exposure of the nasopharynx.  When clamping and positioning the forceps, make sure that the mouth gag is not pinching the lip.  If the catheter encounters resistance along the turbinates, moisten it with a saline and use a slight twisting motion to help it pass through the nasal cavity.",
                   @"Next insert a silastic suction catheter into the nose and grasp it with a Kelly clamp as it emerges from under the soft palate.  Suspend it with the Kelly clamp placed to the side.  Be sure to place the Kelly clamp where it cannot cause injury, well away from the eyes.  One can use one or two suction catheters.  If two catheters are used, a Kelly clamp is used ipsilaterally on each side to secure the catheters.   If only one is used, it often helps the exposure to secure it on the contralateral side.  One catheter often provides adequate exposure of the nasopharynx.  When clamping and positioning the forceps, make sure that the mouth gag is not pinching the lip.  If the catheter encounters resistance along the turbinates, moisten it with a saline and use a slight twisting motion to help it pass through the nasal cavity.",
                   @"A mirror is dipped in saline mixed with baby shampoo (which acts as an anti-fog), and the surgeon inspects the nasopharynx by directing the headlight’s beam onto the mirror.  Assess the size of the adenoids and whether or not they appear infected, as well as the position of the tori and vomer.  If the palatine tonsils are so large that they preclude a full view of the nasopharynx, the surgeon will sometimes remove the tonsils before removing the pharyngeal tonsils (aka adenoids). It is imperative to avoid damage to the tori during removal of the adenoids.  There are two anatomical scenarios that can put the tori at risk of injury: tori can be medialized and project into a narrow nasopharynx and/or large adenoids can obscure the tori.   Before removing the adenoid tissue, first locate the tori.",
                   @" With large, obstructive adenoids, there are two basic ways of doing of identifying the tori.  With the surgeon’s foot well away from the microdebrider’s pedal, one can use the microdebrider tip (preferably with the tip closed) to sweep back and forth longitudinally along the expected position of the torus, in the trough between the adenoidal tissue and the torus (the lateral pharyngeal recess, aka the Fossa of Rosenmuller).  This will often reveal the torus.  If the position of the torus is then clear, the surgeon gently rotates the tip of the microdebrider medially towards the adenoidal tissue and can then begin removing the adenoids.",
                   @"The other method is to identify the vomer; a fairly reliable way to do so is to follow the suction catheter to the vomer.",
                   @"Once the vomer is identified, the surgeon can then begin removing the adenoids in the midline near the vomer.  The removal of this midline tissue will often create more room to then find the tori.  Of note, the tori can often have leaflets of tissue emanating from them (typically one or two if they have this configuration).  It is important to distinguish these leaflets (which are called Gerlach’s tonsils) from the actual adenoids and tori.  If Gerlach’s tonsils anatomy is clear as well as that of the tori, it is safe to either remove Gerlach’s tonsils with the microdebrider or cauterize them later with the suction cautery, so long as injury to the tori is avoided.",
                   @"Removal of the adenoids is typically best done in a systematic fashion.  With the microdebrider, the removal goes relatively quickly.  Experienced surgeons often use a longitudinal sweeping back and forth motion to remove the tissue.  With obstructive adenoids, it is often best to start anteriorly near the vomer.  Leave a sizeable cuff of lymphoid tissue over Passavant’s ridge (where the soft palate will co-apt to the nasopharyngeal wall) to prevent any unwanted velopharyngeal insufficiency.  If unsure how much tissue to remove, the surgeon can reexamine the soft palate’s action by pressing on it onto Passavant’s ridge during the removal process.",
                   @"Once the adenoids have been removed, the nasopharynx is packed with moistened tonsil balls.  These are initially placed using curved forceps.  Once placed, the surgeon can release the tonsil ball and pack into place with slightly opened forceps or use his/her fingers; alternatively, the surgeon can also use the tip of the microdebrider to seat the tonsil balls and then pack them fully using the tip of a Yankauer suction (See next illustration).  There is significant variability in the size of children’s nasopharyngeal dimensions.  Some will require one or two tonsil balls, while can require as many as five tonsils balls.",
                   @"The surgeon tip can use the tip of a Yankauer suction to do the final packing of the tonsil balls if needed.  The strings of the tonsil balls should be placed to the contralateral side of the first tonsil to be removed, to get them out of the way.",
                   @"The surgeon tip can use the tip of a Yankauer suction to do the final packing of the tonsil balls if needed.  The strings of the tonsil balls should be placed to the contralateral side of the first tonsil to be removed, to get them out of the way.",
                   @"With the nasopharynx packed, the tonsils are inspected and then grasped with an Allis clamp.  Some surgeons prefer to grasp the tonsil at its midpoint; others prefer to grasp at its superior pole.  It is important to place the Allis clamp between the tonsillar pillars and the tonsillar tissue to avoid damaging the pillars.  Once the Allis clamp is secured, the tonsil is gently retracted to assess the size of the tonsil under the anterior pillar mucosa.  This is also helpful in delineating the edge of the anterior pillar which is not always readily discernible without movement of the tonsil.  During distraction, the palatoglossus muscle will become apparent as a thin band of tissue under the mucosa; the mucosal cut should respect the muscle and stay just anterior to it. Most surgeons will start their incision at the superior pole while others will start at the midpole.  Most often the incision will span from at least midpole all the way to the superior pole.  Regardless of where the dissection is initiated, it is important to preserve both the anterior and posterior pillars.",
                   @"With the nasopharynx packed, the tonsils are inspected and then grasped with an Allis clamp.  Some surgeons prefer to grasp the tonsil at its midpoint; others prefer to grasp at its superior pole.  It is important to place the Allis clamp between the tonsillar pillars and the tonsillar tissue to avoid damaging the pillars.  Once the Allis clamp is secured, the tonsil is gently retracted to assess the size of the tonsil under the anterior pillar mucosa.  This is also helpful in delineating the edge of the anterior pillar which is not always readily discernible without movement of the tonsil.  During distraction, the palatoglossus muscle will become apparent as a thin band of tissue under the mucosa; the mucosal cut should respect the muscle and stay just anterior to it. Most surgeons will start their incision at the superior pole while others will start at the midpole.  Most often the incision will span from at least midpole all the way to the superior pole.  Regardless of where the dissection is initiated, it is important to preserve both the anterior and posterior pillars.",
                   @"With the nasopharynx packed, the tonsils are inspected and then grasped with an Allis clamp.  Some surgeons prefer to grasp the tonsil at its midpoint; others prefer to grasp at its superior pole.  It is important to place the Allis clamp between the tonsillar pillars and the tonsillar tissue to avoid damaging the pillars.  Once the Allis clamp is secured, the tonsil is gently retracted to assess the size of the tonsil under the anterior pillar mucosa.  This is also helpful in delineating the edge of the anterior pillar which is not always readily discernible without movement of the tonsil.  During distraction, the palatoglossus muscle will become apparent as a thin band of tissue under the mucosa; the mucosal cut should respect the muscle and stay just anterior to it. Most surgeons will start their incision at the superior pole while others will start at the midpole.  Most often the incision will span from at least midpole all the way to the superior pole.  Regardless of where the dissection is initiated, it is important to preserve both the anterior and posterior pillars.",
                   @"The default Bovie settings for tonsillectomy at CHOP are cut set at 18-Watts in blend mode and coagulation set at 18-Watts in spray mode.  The tip of the Bovie should be fully seated: there should be no exposed metal between the tip and the handle.  If there is exposed metal, it creates a risk of an oral commissure burn.",
                   @"With the Bovie pencil in the ipsilateral hand (i.e. left hand for left tonsil and right hand for the right tonsil), the index finger is placed over the blue coagulation button while the middle finger is placed on the yellow cut button.   Holding the Bovie pencil in this manner allows the surgeon to easily toggle back and forth between cut and coagulation without needing to reposition his/her fingers.",
                   @"Some patients’ tongues are large enough that lingual tissue will prolapse towards the tonsils impeding exposure despite having the right size blade; in this instance the blade has to be repositioned during the removal of each tonsil to provide unobstructed access to the tonsillar fossae.  If the tongue appears to be ballooning out from the blade excessively, the blade may too small.  If the blade is too large, it will typically cover too much of the tongue base and it will not slip into position easily.  If the tongue needs to be repositioned, the gag has to be let down so that the tongue can swept into position using either a finger or Hurd retractor.",
                   @"Some patients’ tongues are large enough that lingual tissue will prolapse towards the tonsils impeding exposure despite having the right size blade; in this instance the blade has to be repositioned during the removal of each tonsil to provide unobstructed access to the tonsillar fossae.  If the tongue appears to be ballooning out from the blade excessively, the blade may too small.  If the blade is too large, it will typically cover too much of the tongue base and it will not slip into position easily.  If the tongue needs to be repositioned, the gag has to be let down so that the tongue can swept into position using either a finger or Hurd retractor.",
                   @"Once the position and size of the tonsil as well as the position of the anterior pillar have been delineated by gentle traction of the tonsil, the mucosa on or just anterior to the pillar is incised with the Bovie using either cut or coagulation.  Some surgeons will incise only a portion of the mucosa and start the dissection, extending their mucosal cuts as needed as the dissection proceeds.  Others prefer to make a nearly full length cut along the anterior pillar and then start their dissection.  Many surgeons prefer to use cut for the mucosal incision and will then switch to coagulation during the remainder of the dissection.  Whatever modality is used, it is important to only divide the mucosa and not plunge the tip of the Bovie pencil into the underlying lymphoid tissue, especially in the superior pole where vessels are often prominent.",
                   @"Once the position and size of the tonsil as well as the position of the anterior pillar have been delineated by gentle traction of the tonsil, the mucosa on or just anterior to the pillar is incised with the Bovie using either cut or coagulation.  Some surgeons will incise only a portion of the mucosa and start the dissection, extending their mucosal cuts as needed as the dissection proceeds.  Others prefer to make a nearly full length cut along the anterior pillar and then start their dissection.  Many surgeons prefer to use cut for the mucosal incision and will then switch to coagulation during the remainder of the dissection.  Whatever modality is used, it is important to only divide the mucosa and not plunge the tip of the Bovie pencil into the underlying lymphoid tissue, especially in the superior pole where vessels are often prominent.",
                   @"The tonsil is encapsulated and separated by loose areolar tissue from the pharyngeal musculature.  Identify this plane as it allows for far more efficient removal of the tonsil.  If starting superiorly, as previously stated, there are often vessels that the Bovie will encounter immediately under the mucosa: it is important to have a light touch with the Bovie and to use a feathered “painter’s” stroke.  A key element in tonsillectomy is the use of the Allis clamp, which greatly helps in improving the exposure by both pulling as well as rolling the tonsillar tissue medially.  Once the mucosa has been incised, the unactivated (i.e. without pressing either the cut or coagulation button) Bovie tip can be used to gently dissect through the loose areolar tissue to establish the plane and to identify blood vessels while the Allis clamp actively distracts the tissues.  Alternatively the spatulated end of the Hurd retractor in conjunction Allis distraction can dissect through the loose areolar tissue to obtain better visual definition of the plane. The vessels should be cauterized as they appear before transecting them.",
                   @"The tonsil is encapsulated and separated by loose areolar tissue from the pharyngeal musculature.  Identify this plane as it allows for far more efficient removal of the tonsil.  If starting superiorly, as previously stated, there are often vessels that the Bovie will encounter immediately under the mucosa: it is important to have a light touch with the Bovie and to use a feathered “painter’s” stroke.  A key element in tonsillectomy is the use of the Allis clamp, which greatly helps in improving the exposure by both pulling as well as rolling the tonsillar tissue medially.  Once the mucosa has been incised, the unactivated (i.e. without pressing either the cut or coagulation button) Bovie tip can be used to gently dissect through the loose areolar tissue to establish the plane and to identify blood vessels while the Allis clamp actively distracts the tissues.  Alternatively the spatulated end of the Hurd retractor in conjunction Allis distraction can dissect through the loose areolar tissue to obtain better visual definition of the plane. The vessels should be cauterized as they appear before transecting them.",
                   @"The Bovie tip, once the anterior pillar mucosa has been incised, will move back and forth brushing lightly against the lymphoid tissue without entering it, effectively releasing it.  The efficient surgeon typically establishes the proper plane and keeps the Bovie nearly continuously activated (usually on coagulation), moving through the dissection with fluid movements of the Bovie hand while providing traction with hand holding the Allis clamp.  A tell-tale sign of a novice surgeon is the constant starting and stopping of the Bovie’s coagulation through the dissection or allowing the Bovie tip to enter into the lymphoid tissue.   It is often necessary to reposition the Allis clamp as the dissection proceeds.  Generally, it is best to avoid unnecessarily regrasping the tonsil multiple times as the clamp will eventually traumatize the tissue to the point of making the dissection more difficult.",
                   @"The relative ease with which the surgeon will move through the dissection is determined not only by experience but also by the vascularity of the tissues.  Inflamed tonsils take longer to dissect.  Once the tonsillar fossa becomes stained with blood, the plane and the vessels tend to be slightly less distinct; that is why establishing the proper plane early on and recognizing vessels before transecting them will greatly help the fluency of the dissection.  Vessels will often appear in the tonsillar fossa a few seconds after the leading edge of the dissection has been established.  The efficient surgeon keeps an eye out for those vessels and will cauterize them as they appear.  As the dissection proceeds inferiorly, the distinct areolar plane will efface itself as one reaches the inferior pole: the lymphoid tissue of the pharyngeal tonsil at this point may become contiguous the lingual tonsillar tissue if there is significant tonsillar hypertrophy.  The dissection to release the tonsil inferiorly is therefore determined by the surgeon and not by an areolar plane:  IT IS INFERIORLY THAT THE SURGEON RUNS THE GREATEST RISK OF CAUSING AN AIRWAY FIRE.  As the dissection reaches the inferior tonsillar pillar, the surgeon always gauges where his/her Bovie tip is relative to the endotracheal tube and gag and avoids contact with these structures.  Also, a branch of the glossopharyngeal nerve may become apparent in the inferior tonsillar fossa; needless to say, it is best to avoid direct injury to the nerve if possible.",
                   @"The relative ease with which the surgeon will move through the dissection is determined not only by experience but also by the vascularity of the tissues.  Inflamed tonsils take longer to dissect.  Once the tonsillar fossa becomes stained with blood, the plane and the vessels tend to be slightly less distinct; that is why establishing the proper plane early on and recognizing vessels before transecting them will greatly help the fluency of the dissection.  Vessels will often appear in the tonsillar fossa a few seconds after the leading edge of the dissection has been established.  The efficient surgeon keeps an eye out for those vessels and will cauterize them as they appear.  As the dissection proceeds inferiorly, the distinct areolar plane will efface itself as one reaches the inferior pole: the lymphoid tissue of the pharyngeal tonsil at this point may become contiguous the lingual tonsillar tissue if there is significant tonsillar hypertrophy.  The dissection to release the tonsil inferiorly is therefore determined by the surgeon and not by an areolar plane:  IT IS INFERIORLY THAT THE SURGEON RUNS THE GREATEST RISK OF CAUSING AN AIRWAY FIRE.  As the dissection reaches the inferior tonsillar pillar, the surgeon always gauges where his/her Bovie tip is relative to the endotracheal tube and gag and avoids contact with these structures.  Also, a branch of the glossopharyngeal nerve may become apparent in the inferior tonsillar fossa; needless to say, it is best to avoid direct injury to the nerve if possible.",
                   @"The relative ease with which the surgeon will move through the dissection is determined not only by experience but also by the vascularity of the tissues.  Inflamed tonsils take longer to dissect.  Once the tonsillar fossa becomes stained with blood, the plane and the vessels tend to be slightly less distinct; that is why establishing the proper plane early on and recognizing vessels before transecting them will greatly help the fluency of the dissection.  Vessels will often appear in the tonsillar fossa a few seconds after the leading edge of the dissection has been established.  The efficient surgeon keeps an eye out for those vessels and will cauterize them as they appear.  As the dissection proceeds inferiorly, the distinct areolar plane will efface itself as one reaches the inferior pole: the lymphoid tissue of the pharyngeal tonsil at this point may become contiguous the lingual tonsillar tissue if there is significant tonsillar hypertrophy.  The dissection to release the tonsil inferiorly is therefore determined by the surgeon and not by an areolar plane:  IT IS INFERIORLY THAT THE SURGEON RUNS THE GREATEST RISK OF CAUSING AN AIRWAY FIRE.  As the dissection reaches the inferior tonsillar pillar, the surgeon always gauges where his/her Bovie tip is relative to the endotracheal tube and gag and avoids contact with these structures.  Also, a branch of the glossopharyngeal nerve may become apparent in the inferior tonsillar fossa; needless to say, it is best to avoid direct injury to the nerve if possible.",
                   @"Once the first tonsil has been released, it is a good idea to palpate it to make sure that it is appropriately soft.  If it feels hard, a tumor should be suspected and the tonsil should be sent for pathologic evaluation.  If that is the case, it is important to properly label the tonsil to know from which side it came.  Provided that the tonsillar fossa is not actively bleeding, attention is then turned to the contralateral tonsil.   The instruments will now be held in the opposite hands.  That is, the Allis clamp will be held in left hand if the right tonsil is being removed or the right hand if the left tonsil is being removed.   Gentle medial traction of the Allis clamp again reveals the position of the anterior pillar mucosa and the mass of the tonsil under the mucosa.  The incision is now planned, factoring the size of the tonsil, the position of the anterior pillar as well as the position and shape of the contralateral previous incision.   It is best to avoid significant asymmetry of the incisions.  Again it is important to preserve both anterior and posterior pillars.  The contralateral tonsil is then removed in a similar fashion.  Upon its removal, it is palpated.   THE BOVIE PENCIL SHOULD BE DISARMED ONCE BOTH TONSILS ARE REMOVED.",
                   @"Once both tonsils have been removed, the tonsillar fossae are inspected to make sure there is no retained lymphoid tissue and are then cauterized with a pedal-actuated suction Bovie with the coagulation set at 18-Watts in spray mode.  If the tonsils are inflamed or bled significantly during their removal, it is not uncommon to find a small rest of lymphoid tissue, especially in the superior tonsillar pillar.  This residual tissue should be removed.",
                   @"The anterior pillar can obstruct the view of vessels.  The surgeon can use either a Hurd retractor or a mirror to improve visualization under the anterior pillar.  It is wise for the trainee to become familiar with both techniques.  The superior pole often hides vessels so it is important to carefully evaluate this area.  Bleeding vessels and any prominent vessels should be cauterized.   When using the suction Bovie, it is not necessary to bury its tip in the tissue; it is best to touch the vessel lightly with the tip of the instruments; this method is often more effective and precise.  If the bleeding is vigorous, the area may need to be suctioned first.  If the bleeding is so vigorous that it overwhelms the suction tip, the surgeon can place a tonsil ball over the site and apply pressure for several seconds to several minutes, then gently and methodically roll it back until the offending site can be more precisely cauterized.  The offending vessel can also be grasped with forceps, retracted gently medially, and the tip of the suction Bovie applied to the forceps itself.  Only rarely is there a need to consider the use of sutures.  If the surgeon does elect to use suture, it is best to use resorbable sutures on a tapered needle; it is very important NOT to pass the needle too deeply because of the danger of puncturing a larger, deeper vessel, and causing a worse bleed.  There is learning curve when achieving hemostasis in the fossae, as there is a balance between achieving adequate hemostasis and creating undue collateral thermal damage.  All aspects of the fossae should be carefully examined.  Again at the inferior pole, the surgeon should be very cognizant of the danger of an airway fire as the cauterization approaches the endotracheal tube.",
                   @"Upon completion, both fossae should be free of any active bleeding.",
                   @"Attention is then turned to the nasopharynx, the surgeon can remove the tonsils balls one at a time or all at once, depending on his/her preference.  The suction Bovie’s coagulation is turned up to 30-35-Watts in spray mode; the last 3 to 4-cm of its tip bent as shown to an approximately 80 degree angle.",
                   @"Again it is best to use a systematic approach and avoid burying the tip of the suction cautery wand.  Burying the tip while cauterizing the adenoid bed often leads to excessive charring and plugging of the suction cautery.  If the adenoid bed is relatively quiescent the surgeon will often move from anterior to posterior (or posterior to anterior) in a systematic fashion.  If there are some active bleeders, it is best to address them first.  The primary blood supply to the adenoid bed comes from the ascending pharyngeal branch of the external carotid artery.  A common site of bleeding is found postero-laterally near Passavant’s ridge.  A common mistake that leads to bleeding is inadequate removal of the lymphoid tissue.",
                   @"Again it is best to use a systematic approach and avoid burying the tip of the suction cautery wand.  Burying the tip while cauterizing the adenoid bed often leads to excessive charring and plugging of the suction cautery.  If the adenoid bed is relatively quiescent the surgeon will often move from anterior to posterior (or posterior to anterior) in a systematic fashion.  If there are some active bleeders, it is best to address them first.  The primary blood supply to the adenoid bed comes from the ascending pharyngeal branch of the external carotid artery.  A common site of bleeding is found postero-laterally near Passavant’s ridge.  A common mistake that leads to bleeding is inadequate removal of the lymphoid tissue.",
                   @"An adequate cuff of lymphoid tissue is left at Passavant’s ridge to avoid post-operative velopharyngeal insufficiency.",
                   @"Once the adenoid bed is satisfactorily cauterized, the surgeon will unhook the gag from the Mayo stand and gently let the gag down for 30 seconds to a full two-minutes to make sure that no bleeding was held in check by gag compression or tissue distraction.  How long the gag is let down is left to the judgment of the surgeon.  Some surgeons also elect to massage the neck bilaterally just below the angle of the mandible to “test” their cauterization.  The gag is gently reopened and suspended and both the tonsillar fossae and nasopharynx are inspected.  Any remaining bleeding is addressed, typically with the suction Bovie at the appropriate setting.",
                   @"Once satisfied that hemostasis is adequate, the oropharynx and nasopharynx can be irrigated with saline: the surgeon will pour saline into the mouth and then typically suctioned out with the catheter that was suspending the soft palate.  This is especially useful if there is a bloody coagulum in the nasal cavity.  If there was clear evidence of nasal mucopurulence, the surgeon can also irrigate the nasal cavities with saline using a Tumi syringe placed into each naris with the contralateral naris pinched shut.  Some anesthesiologists will suction the stomach prior to the start of the case; if not, the surgeon can elect to decompress the stomach with an orogastric tube while the gag is still in place.",
                   @"Once satisfied that hemostasis is adequate, the oropharynx and nasopharynx can be irrigated with saline: the surgeon will pour saline into the mouth and then typically suctioned out with the catheter that was suspending the soft palate.  This is especially useful if there is a bloody coagulum in the nasal cavity.  If there was clear evidence of nasal mucopurulence, the surgeon can also irrigate the nasal cavities with saline using a Tumi syringe placed into each naris with the contralateral naris pinched shut.  Some anesthesiologists will suction the stomach prior to the start of the case; if not, the surgeon can elect to decompress the stomach with an orogastric tube while the gag is still in place.",
                   @"Once satisfied that hemostasis is adequate, the oropharynx and nasopharynx can be irrigated with saline: the surgeon will pour saline into the mouth and then typically suctioned out with the catheter that was suspending the soft palate.  This is especially useful if there is a bloody coagulum in the nasal cavity.  If there was clear evidence of nasal mucopurulence, the surgeon can also irrigate the nasal cavities with saline using a Tumi syringe placed into each naris with the contralateral naris pinched shut.  Some anesthesiologists will suction the stomach prior to the start of the case; if not, the surgeon can elect to decompress the stomach with an orogastric tube while the gag is still in place.",
                   @"The surgeon will then unhook the gag once more, and gently release it.  The gag is removed while holding the endotracheal tube with at least two fingers or the thumb of the contralateral hand against the patient’s lower lip to prevent accidental extubation.  During the case it is important to monitor how long the gag has been held open.  It is a good idea to let the gag down if it has been open for more than 25 minutes; the gag puts pressure on the tongue, which can cause significant pain postoperatively.  Upon removing the gag, inspect the tongue, lips, gums and teeth for evidence of damage.  If the tongue has “pressure” furrows where the gag blade was positioned, warn the family that the patient may experience postoperative lingual pain and reassure them that the furrows will typically efface themselves.",
                   @"The surgeon will then unhook the gag once more, and gently release it.  The gag is removed while holding the endotracheal tube with at least two fingers or the thumb of the contralateral hand against the patient’s lower lip to prevent accidental extubation.  During the case it is important to monitor how long the gag has been held open.  It is a good idea to let the gag down if it has been open for more than 25 minutes; the gag puts pressure on the tongue, which can cause significant pain postoperatively.  Upon removing the gag, inspect the tongue, lips, gums and teeth for evidence of damage.  If the tongue has “pressure” furrows where the gag blade was positioned, warn the family that the patient may experience postoperative lingual pain and reassure them that the furrows will typically efface themselves.",
                   nil];
    arrayOfImages = [[NSMutableArray alloc]initWithObjects:@"1a.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png", @"11.png", @"12.png", @"13.png", @"14.png", @"15.png", @"16.png", @"17.png", @"18.png", @"19.png", @"20.png", @"21.png", @"22.png", @"23.png", @"24.png", @"25.png", @"26.png", @"27.png", @"28.png", @"29.png", @"30.png", @"31.png", @"32.png", @"33.png", @"34.png", @"35.png", @"36.png", @"37.png", @"38.png", @"39.png", @"40.png", @"41.png", @"42.png", @"43.png", @"44.png", @"45.png", @"46.png", @"47.png", @"48.png", @"49.png", @"50.png", @"51.png", @"52.png", @"53.png", @"54.png", @"55.png", @"56.png", @"57.png", @"58.png", @"59.png",nil];
    arrayOfCollapsed = [[NSMutableArray alloc]initWithObjects:@YES,@YES,@YES,@YES,@YES,@YES, nil];
    arrayOfOrigins = [[NSMutableArray alloc]initWithObjects:@0.0,@310.0,@620.0,@930.0,@1240.0,@1550.0, nil];
    arrayOfShown = [[NSMutableArray alloc]initWithObjects:@YES,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    @NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    @NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    @NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    @NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    @NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,
                    nil];
    arrayOfType = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"3",@"1",@"1", nil];
    arrayOfZoom = [[NSMutableArray alloc]initWithObjects:@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   @1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   @1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   @1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   @1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   @1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,@1.0,
                   nil];
    
    /*arrayOfWidths = [[NSMutableArray alloc]initWithObjects:@300.0,@300.0,@300.0,@300.0,@300.0,@300.0, nil];
    arrayOfImages1 = [[NSMutableArray alloc]initWithObjects:@"1.tif",@"1.tif",@"1.tif",@"1.tif",@"1.tif",@"1.tif", nil];
    arrayOfImages2 = [[NSMutableArray alloc]initWithObjects:@"2.tif",@"2.tif",@"2.tif",@"2.tif",@"2.tif",@"2.tif", nil];
    arrayOfImages3 = [[NSMutableArray alloc]initWithObjects:@"3.tif",@"3.tif",@"3.tif",@"3.tif",@"3.tif",@"3.tif", nil];
    arrayOfImages4 = [[NSMutableArray alloc]initWithObjects:@"4.tif",@"4.tif",@"4.tif",@"4.tif",@"4.tif",@"4.tif", nil];
    arrayOfImages5 = [[NSMutableArray alloc]initWithObjects:@"5.tif",@"5.tif",@"5.tif",@"5.tif",@"5.tif",@"5.tif", nil];
    arrayOfImages6 = [[NSMutableArray alloc]initWithObjects:@"6.tif",@"6.tif",@"6.tif",@"6.tif",@"6.tif",@"6.tif", nil];
    */
    
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
       // cell.frame= CGRectMake(cell.frame.origin.x, cell.frame.origin.y,  cell.frame.size.width,[[arrayOfWidths objectAtIndex:indexPath.item]floatValue]);
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
   // float currentOrigin = 0.0;
   /* for(int i = 0; i < arrayOfOrigins.count; i++){
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
    }*/
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
