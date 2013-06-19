//
//  GraphViewController.h
//  iOperate
//
//  Created by James Bartolozzi on 6/19/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "CPTGraph.h"

@interface GraphViewController : UIViewController <CPTPlotDataSource, CPTPlotSpaceDelegate> {
    NSMutableArray *dataForPlot;
}
-(void)constructGraph;
@end
