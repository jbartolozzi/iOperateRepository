//
//  DrawRectView.m
//  iOperate
//
//  Created by Max Gilbert on 7/29/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "DrawRectView.h"

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 10.0);

    CGContextMoveToPoint(context, 200,200); //start at this point

    CGContextAddLineToPoint(context, 400, 400); //draw to this point

    // and now draw the Path!
    CGContextStrokePath(context);
}


@end
