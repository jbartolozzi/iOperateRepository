//
//  DrawRectView.m
//  iOperate
//
//  Created by Max Gilbert on 7/29/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "DrawRectView.h"
#import <QuartzCore/QuartzCore.h>
@interface DrawRectView()
@end
@implementation DrawRectView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

bool readyToDrawLine = NO;
float w = 10.0f;
float sX = 200.0f;
float sY = 200.0f;
float eX = 400.0f;
float eY = 400.0f;
- (void)drawRect:(CGRect)rect
{
    //[super drawRect:rect];
    // Drawing code
 
    /* CGPoint center = CGPointMake(50.0, 50/0);
     float rectangleWidth = 100.0;
    float rectangleHeight = 100.0;
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     CGContextAddRect(ctx,CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight));
     CGContextSetLineWidth(ctx, 10);
     CGContextSetStrokeColorWithColor(ctx, [[UIColor grayColor] CGColor]);
     CGContextStrokePath(ctx);
     CGContextSetFillColorWithColor(ctx, [[UIColor greenColor] CGColor]);
     CGContextAddRect(ctx,CGRectMake(center.x - (0.5 * rectangleWidth), center.y - (0.5 * rectangleHeight), rectangleWidth, rectangleHeight));
     CGContextFillPath(ctx);*/
    if(readyToDrawLine){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, w);

    CGContextMoveToPoint(context, sX,sY); //start at this point

    CGContextAddLineToPoint(context, eX, eY); //draw to this point

    // and now draw the Path!
    CGContextStrokePath(context);
    }
}
-(void)drawLine:(float)width:(float)startX:(float)startY:(float)endX:(float)endY{
    readyToDrawLine = YES;
    w= width;
    sX = startX;
    sY = startY;
    eX = endX;
    eY = endY;
    
    [self setNeedsDisplay];
}


@end
