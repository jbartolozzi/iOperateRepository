//
//  QuizViewController.h
//  iOperate
//
//  Created by James Bartolozzi on 6/3/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizCell.h"

@interface QuizViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *totalNum;
@property (weak, nonatomic) IBOutlet UILabel *questionNum;
- (IBAction)goNext:(id)sender;
- (IBAction)goPrev:(id)sender;
@end
