//
//  GraphingViewController.m
//  iOperate
//
//  Created by Max Gilbert on 7/24/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "GraphingViewController.h"

@interface GraphingViewController ()

@end

@implementation GraphingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self drawRect];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    CGContextSetLineWidth(context, 2.0);
    
    CGContextMoveToPoint(context, 0,0); //start at this point
    
    CGContextAddLineToPoint(context, 20, 20); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
}


@end
