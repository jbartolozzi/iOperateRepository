//
//  TimeLinveCell.h
//  iOperate
//
//  Created by Max Gilbert on 8/16/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowTextButton.h"

@interface TimeLinveCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet ShowTextButton *showButton;
@property (strong, nonatomic) IBOutlet UITextView *description;

@end
