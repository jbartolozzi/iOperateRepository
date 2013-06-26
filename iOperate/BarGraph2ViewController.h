//
//  BarGraph2ViewController.h
//  iOperate
//
//  Created by James Bartolozzi on 6/26/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface BarGraph2ViewController : UIViewController <CPTPlotSpaceDelegate, CPTPlotDataSource, CPTBarPlotDelegate> {
    
    NSArray *plotData;
    CPTGraphHostingView* hostView;
    CPTGraph* graph;
    CPTScatterPlot* plot;
    CPTXYPlotSpace *plotSpace;
    CPTXYAxis *xAxis;
    CPTXYAxis *yAxis;
    NSDateComponents *dateComponents;
    NSDate *refDate;
}

@end
