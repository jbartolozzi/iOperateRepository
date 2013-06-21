//
//  GraphViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/19/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController () {
    int distance;
    CPTGraphHostingView* hostView;
    CPTGraph* graph;
    CPTScatterPlot* plot;
    CPTXYPlotSpace *plotSpace;
    CPTXYAxis *xAx;
    CPTXYAxis *yAx;
}

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
    hostView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(10, 10, 748, 800)];
    hostView.clipsToBounds = YES;
    [[hostView layer] setCornerRadius:50];
    [self.view addSubview: hostView];
    
    // Create a CPTGraph object and add to hostView
    graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
    
    // Apply Theme
    CPTTheme *theme =[CPTTheme themeNamed:kCPTPlainWhiteTheme];
    [graph applyTheme:theme];
    graph.fill = [CPTFill fillWithColor:[[CPTColor colorWithComponentRed:1.0 green:1.0 blue:1.0 alpha:1.0]colorWithAlphaComponent:1.0]];
    graph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
    graph.plotAreaFrame.borderLineStyle = nil;
    
    // Enable Interaction
    [[graph defaultPlotSpace] setAllowsUserInteraction:YES];
    
    // Apply Graph to Host View
    hostView.hostedGraph = graph;
    
    // Padding
    graph.paddingBottom = 0.0;
    graph.paddingLeft = 0.0;
    graph.paddingRight = 0.0;
    graph.paddingTop = 0.0;
    
    // Get the (default) plotspace from the graph so we can set its x/y ranges
    plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    
    // Note that these CPTPlotRange are defined by START and LENGTH (not START and END) !!
    [plotSpace setYRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(10)]];
    [plotSpace setXRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(10)]];
    
    // Axes
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    xAx = axisSet.xAxis;
    xAx.majorIntervalLength = CPTDecimalFromString(@"10");
    xAx.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0.0");
    xAx.minorTicksPerInterval = 10;
    yAx = axisSet.yAxis;
    yAx.majorIntervalLength = CPTDecimalFromString(@"10");
    yAx.minorTicksPerInterval = 10;
    yAx.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0.0");
   
    
    // Create the plot (we do not define actual x/y values yet, these will be supplied by the datasource...)
    plot = [[CPTScatterPlot alloc] initWithFrame:CGRectZero];
    plot.interpolation = CPTScatterPlotInterpolationCurved;
    
    // Line Style
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineWidth = 1.75;
    lineStyle.lineColor = [[CPTColor colorWithComponentRed:(51.0/256.0) green:(204.0/256.0) blue:(255.0/256.0) alpha:1.0]colorWithAlphaComponent:7.0];
    plot.dataLineStyle = lineStyle;
    
    // Plot Symbols
    CPTPlotSymbol *symbol = [CPTPlotSymbol ellipsePlotSymbol];
    symbol.fill = [CPTFill fillWithColor:[[CPTColor cyanColor] colorWithAlphaComponent:1.0]];
    symbol.size = CGSizeMake(10.0, 10.0);
    plot.plotSymbol = symbol;
    
    
    // Let's keep it simple and let this class act as datasource (therefore we implemtn <CPTPlotDataSource>)
    plot.dataSource = self;
    
    // Finally, add the created plot to the default plot space of the CPTGraph object we created before
    [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
    
    [self resizePlotSpace];
   
}

-(void)resizePlotSpace
{
    // Scale Plot Space
    [plotSpace scaleToFitPlots:[graph allPlots]];
    CPTMutablePlotRange *xRange = [plotSpace.xRange mutableCopy];
    CPTMutablePlotRange *yRange = [plotSpace.yRange mutableCopy];
    
    // Expand the ranges to put some space around the plot
    [xRange expandRangeByFactor:CPTDecimalFromDouble(1.2)];
    [yRange expandRangeByFactor:CPTDecimalFromDouble(1.2)];
    plotSpace.xRange = xRange;
    plotSpace.yRange = yRange;
    
    [xRange expandRangeByFactor:CPTDecimalFromDouble(1.025)];
    xRange.location = plotSpace.xRange.location;
    [yRange expandRangeByFactor:CPTDecimalFromDouble(1.05)];
    xAx.visibleAxisRange = xRange;
    yAx.visibleAxisRange = yRange;
    
    [xRange expandRangeByFactor:CPTDecimalFromDouble(3.0)];
    [yRange expandRangeByFactor:CPTDecimalFromDouble(3.0)];
    plotSpace.globalXRange = xRange;
    plotSpace.globalYRange = yRange;
}

-(void)createData
{
    NSMutableArray *contentArray = [NSMutableArray array];
    for (float i = 0; i < 10; i+= 1.0 - self.stepper.value) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        NSNumber *y = [NSNumber numberWithDouble: sin(i)];
        [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
    }
    dataForPlot = contentArray;
    
}

- (IBAction)stepperChanged:(id)sender {
    [self setGraph:nil];
}

- (IBAction)setGraph:(id)sender {
    NSMutableArray *contentArray = [NSMutableArray array];
    if (self.segmentControl.selectedSegmentIndex == 0) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: sin(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
        
    }
    else if(self.segmentControl.selectedSegmentIndex == 1) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: cos(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
        
    }
    else if(self.segmentControl.selectedSegmentIndex == 2) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: sqrt(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
    }
    else if(self.segmentControl.selectedSegmentIndex == 3) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: asin(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
    }
    else if(self.segmentControl.selectedSegmentIndex == 4) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: acos(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
    }
    else if(self.segmentControl.selectedSegmentIndex == 5) {
        for (float i = 0; i < distance; i+= 1.0 - self.stepper.value) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble: tan(i)];
            [contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x,@"x",y,@"y", nil]];
        }
        dataForPlot = contentArray;
        [graph reloadData];
        [self resizePlotSpace];
    }
    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        hostView.frame = CGRectMake(10, 10, 1000, 500);
    }
    else {
        hostView.frame = CGRectMake(10, 10, 748, 800);
    }
}

-(void)viewDidLayoutSubviews
{
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        hostView.frame = CGRectMake(10, 10, 1000, 500);
    }
    else {
        hostView.frame = CGRectMake(10, 10, 748, 800);
    }
}

- (IBAction)changeDistance:(id)sender {
    distance = self.stepperDistance.value;
    [self setGraph:nil];
    
}
@end
