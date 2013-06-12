//
//  EvaluationFooter.h
//  iOperate
//
//  Created by James Bartolozzi on 6/12/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationFooter : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UITextView *comments;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
