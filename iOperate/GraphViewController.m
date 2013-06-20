//
//  GraphViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/19/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createData];
    [self constructGraph];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return [dataForPlot count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx
{
    NSNumber *num = nil;
    num = [[dataForPlot objectAtIndex:idx]valueForKey:(fieldEnum == CPTScatterPlotFieldX ? @"x":@"y")];
    return num;
}

-(void)constructGraph
{
    // We need a hostview, you can create one in IB (and create an outlet) or just do this:
    CPTGraphHostingView* hostView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(25, 25, 700, 800)];
    [self.view addSubview: hostView];
    
    // Create a CPTGraph object and add to hostView
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
    
    // Apply Theme
    CPTTheme *theme =[CPTTheme themeNamed:kCPTSlateTheme];
    [graph applyTheme:theme];
    
    // Enable Interaction
    [[graph defaultPlotSpace] setAllowsUserInteraction:YES];
    
    // Apply Graph to Host View
    hostView.hostedGraph = graph;
    
    // Padding
    graph.paddingBottom = 20.0;
    graph.paddingLeft = 20.0;
    graph.paddingRight = 20.0;
    graph.paddingRight = 20.0;
    
    // Get the (default) plotspace from the graph so we can set its x/y ranges
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    
    // Note that these CPTPlotRange are defined by START and LENGTH (not START and END) !!
    [plotSpace setYRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(10)]];
    [plotSpace setXRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(10)]];
    
    // Axes
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    CPTXYAxis *x = axisSet.xAxis;
    x.majorIntervalLength = CPTDecimalFromString(@"1");
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0.0");
    x.minorTicksPerInterval = 2;
    CPTXYAxis *y = axisSet.yAxis;
    y.majorIntervalLength = CPTDecimalFromString(@"1");
    y.minorTicksPerInterval = 5;
    y.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0.0");
   
    
    // Create the plot (we do not define actual x/y values yet, these will be supplied by the datasource...)
    CPTScatterPlot* plot = [[CPTScatterPlot alloc] initWithFrame:CGRectZero];
    
    // Let's keep it simple and let this class act as datasource (therefore we implemtn <CPTPlotDataSource>)
    plot.dataSource = self;
    
    // Finally, add the created plot to the default plot space of the CPTGraph object we created before
    [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
}

-(void)createData
{
    NSMutableArray *contentArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < 10; i++) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        NSNumber *y = [NSNumber numberWithDouble: (i * i)/2.0];
        [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
    }
    dataForPlot = contentArray;
}
@end
