//
//  AdvancedCell.h
//  iOperate
//
//  Created by James Bartolozzi on 5/28/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface AdvancedCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
