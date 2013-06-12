//
//  QuizViewController.h
//  iOperate
//
//  Created by James Bartolozzi on 6/3/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "QuartzCore/CALayer.h"
#import "QuizCell.h"

@interface QuizViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *totalNum;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *completeButton;
@property (weak, nonatomic) IBOutlet UILabel *questionNum;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)answerSelected:(id)sender;
- (IBAction)goNext:(id)sender;
- (IBAction)goPrev:(id)sender;
- (IBAction)qFinish:(id)sender;
@end
