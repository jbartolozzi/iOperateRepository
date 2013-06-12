//
//  EvaluationCell.h
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface EvaluationCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITextView *evaluationText;
@property (weak, nonatomic) IBOutlet UILabel *evaluationLabel;

@end
