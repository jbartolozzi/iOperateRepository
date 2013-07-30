//
//  DrawRectView.h
//  iOperate
//
//  Created by Max Gilbert on 7/29/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawRectView : UIView

-(void)drawLine:(float)width:(float)startX:(float)startY:(float)endX:(float)endY;
@property(strong,nonatomic)NSMutableArray *points;
@end
