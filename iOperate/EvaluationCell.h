//
//  EvaluationCell.h
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITextView *evaluationText;
@property (weak, nonatomic) IBOutlet UILabel *evaluationLabel;
@property (weak, nonatomic) IBOutlet UIStepper *evaluationClicker;
@property (weak, nonatomic) IBOutlet UILabel *evaluationScore;

@end
