//
//  EvaluationCell.m
//  iOperate
//
//  Created by Max Gilbert on 6/5/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "EvaluationCell.h"

@implementation EvaluationCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setBorderColor:[[UIColor whiteColor]CGColor]];
        [self.layer setBorderWidth:1.0f];
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
