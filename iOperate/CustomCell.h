//
//  CustomCell.h
//  iOperate
//
//  Created by Max Gilbert on 5/22/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "QuartzCore/CALayer.h"

@interface CustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UILabel *myDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myPicture;

@end
