//
//  ShowTextButton.h
//  iOperate
//
//  Created by Max Gilbert on 8/16/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowTextButton : UIButton
@property (nonatomic) BOOL showing;
@property (weak, nonatomic) UITextView* hiddenText;
@end
