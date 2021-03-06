//
//  EvaluationViewController.h
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "QuartzCore/CALayer.h"
#import "EvaluationCell.h"
#import "EvaluationFooter.h"
#import <Foundation/Foundation.h>


@interface EvaluationViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
//+ (NSString *)returnComments;

@property (weak, nonatomic) IBOutlet UICollectionView *evaluationCollection;


@end
