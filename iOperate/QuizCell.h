//
//  QuizCell.h
//  iOperate
//
//  Created by James Bartolozzi on 6/3/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *qTitle;
@property (weak, nonatomic) IBOutlet UITextView *qBox;
@property (weak, nonatomic) IBOutlet UITextView *optionA;
@property (weak, nonatomic) IBOutlet UITextView *optionB;
@property (weak, nonatomic) IBOutlet UITextView *optionC;
@property (weak, nonatomic) IBOutlet UITextView *optionD;
@property (weak, nonatomic) IBOutlet UITextView *optionE;
@property (weak, nonatomic) IBOutlet UITextView *optionF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@end
