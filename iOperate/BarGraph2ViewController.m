//
//  BarGraph2ViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/26/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "BarGraph2ViewController.h"

@interface BarGraph2ViewController ()

@end

@implementation BarGraph2ViewController

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
    [self generateData];
    [self constructGraph1];
	// Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    // Layout for Graph Host View
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        hostView.frame = CGRectMake(10, 10, 1000, 500);
    }
    else {
        hostView.frame = CGRectMake(10, 10, 748, 800);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return plotData.count/2;
}

-(NSString *)legendTitleForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"Quiz %lu", (unsigned long)(index + 1)];
}

-(NSArray *)numbersForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndexRange:(NSRange)indexRange
{
    NSArray *nums = nil;
    
    switch ( fieldEnum ) {
        case CPTBarPlotFieldBarLocation:
            nums = [NSMutableArray arrayWithCapacity:indexRange.length];
            for ( NSUInteger i = indexRange.location; i < NSMaxRange(indexRange); i++ ) {
                [(NSMutableArray *) nums addObject:[NSDecimalNumber numberWithUnsignedInteger:i]];
            }
            break;
            
        case CPTBarPlotFieldBarTip:
            nums = [plotData objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:indexRange]];
            break;
            
        default:
            break;
    }
    
    return nums;
}

-(void)generateData
{
    if ( plotData == nil ) {
        NSMutableArray *contentArray = [NSMutableArray array];
        for ( NSUInteger i = 0; i < 8; i++ ) {
            [contentArray addObject:[NSDecimalNumber numberWithDouble:i*10 + 10]];
        }
        for ( NSUInteger i = 0; i < 8; i++ ) {
            [contentArray addObject:[NSDecimalNumber numberWithDouble:i*10]];
        }
        plotData = contentArray;
    }
}


// This is the method that makes the graphs
-(void)constructGraph1
{
    
    hostView.clipsToBounds = YES;
    [[hostView layer] setCornerRadius:10];
    [self.view addSubview: hostView];
    graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
    
    // Apply Theme
    CPTTheme *theme =[CPTTheme themeNamed:kCPTPlainBlackTheme];
    [graph applyTheme:theme];
    graph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
    graph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
    graph.plotAreaFrame.borderLineStyle = nil;
    
    // Enable Interaction
    [[graph defaultPlotSpace] setAllowsUserInteraction:NO];
    
    // Apply Graph to Host View
    hostView.hostedGraph = graph;
    
    // Padding
    graph.plotAreaFrame.paddingLeft   += 60.0;
    graph.plotAreaFrame.paddingTop    += 25.0;
    graph.plotAreaFrame.paddingRight  += 20.0;
    graph.plotAreaFrame.paddingBottom += 100.00;
    
    // Create grid line styles
    CPTMutableLineStyle *majorGridLineStyle = [CPTMutableLineStyle lineStyle];
    majorGridLineStyle.lineWidth = 1.0;
    majorGridLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:0.75];
    
    CPTMutableLineStyle *minorGridLineStyle = [CPTMutableLineStyle lineStyle];
    minorGridLineStyle.lineWidth = 1.0;
    minorGridLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:0.25];
    
   
    
    
    // Create axes
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    xAxis          = axisSet.xAxis;
    {
         xAxis.majorIntervalLength         = CPTDecimalFromInteger(1);
         xAxis.minorTicksPerInterval       = 1;
         xAxis.orthogonalCoordinateDecimal = CPTDecimalFromInteger(0);
         xAxis.axisLineStyle               = nil;
         xAxis.majorTickLineStyle          = nil;
         xAxis.minorTickLineStyle          = nil;
        
        xAxis.labelRotation = M_PI/4;
        xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
        NSArray *customTickLocations = [NSArray arrayWithObjects:[NSDecimalNumber numberWithInt:0], [NSDecimalNumber numberWithInt:1], [NSDecimalNumber numberWithInt:2], [NSDecimalNumber numberWithInt:3],[NSDecimalNumber numberWithInt:4],[NSDecimalNumber numberWithInt:5],[NSDecimalNumber numberWithInt:6],[NSDecimalNumber numberWithInt:7], nil];
        NSArray *xAxisLabels = [NSArray arrayWithObjects:@"Quiz 1", @"Quiz 2", @"Quiz 3", @"Quiz 4", @"Quiz 5",@"Quiz 6",@"Quiz 7",@"Quiz 8", nil];
        NSUInteger labelLocation = 0;
        NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
        for (NSNumber *tickLocation in customTickLocations) {
            CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText: [xAxisLabels objectAtIndex:labelLocation++] textStyle:xAxis.labelTextStyle];
            newLabel.tickLocation = [tickLocation decimalValue];
            newLabel.offset = xAxis.labelOffset + xAxis.majorTickLength;
            newLabel.rotation = M_PI/4;
            [customLabels addObject:newLabel];
        }
        
        xAxis.axisLabels =  [NSSet setWithArray:customLabels];
    }
    
    yAxis = axisSet.yAxis;
    {
        yAxis.majorIntervalLength         = CPTDecimalFromInteger(10);
        yAxis.minorTicksPerInterval       = 1;
        yAxis.axisConstraints             = [CPTConstraints constraintWithLowerOffset:0.0];
        yAxis.preferredNumberOfMajorTicks = 10;
        yAxis.majorGridLineStyle          = majorGridLineStyle;
        yAxis.minorGridLineStyle          = minorGridLineStyle;
        yAxis.axisLineStyle               = nil;
        yAxis.majorTickLineStyle          = nil;
        yAxis.minorTickLineStyle          = nil;
        yAxis.labelOffset                 = 10.0;
        yAxis.labelRotation               = 0;
        yAxis.labelingPolicy              = CPTAxisLabelingPolicyAutomatic;
        yAxis.title       = @"";
        yAxis.titleOffset = 43.0f;
    }
    
    
    /* Create a bar line style
    CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
    barLineStyle.lineWidth = 0.4;
    barLineStyle.lineColor = [CPTColor whiteColor];*/
    
    // Create bar plot
    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor redColor] horizontalBars:NO];
    //barPlot.lineStyle         = barLineStyle;
    barPlot.barWidth          = CPTDecimalFromFloat(0.75f); // bar is 75% of the available space
    barPlot.barCornerRadius   = 4.0;
    barPlot.barsAreHorizontal = NO;
    barPlot.dataSource        = self;
    barPlot.identifier        = @"Bar Plot 1";
    CPTMutableTextStyle *whiteTextStyle = [CPTMutableTextStyle textStyle];
    whiteTextStyle.color   = [CPTColor whiteColor];
    barPlot.labelTextStyle = whiteTextStyle;
    [graph addPlot:barPlot];
    
    barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor blueColor] horizontalBars:NO];
    //barPlot.lineStyle    = barLineStyle;
    //barPlot.fill         = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:1.0f green:1.0f blue:0.5f alpha:0.5f]];
    barPlot.barBasesVary = YES;
    barPlot.barWidth = CPTDecimalFromFloat(.85f); // bar is full (100%) width
    barPlot.barCornerRadius = 2.0f;
    barPlot.barsAreHorizontal = NO;
    barPlot.delegate   = self;
    barPlot.dataSource = self;
    barPlot.identifier = @"Bar Plot 2";
    barPlot.barOffset = CPTDecimalFromFloat(.25f);
    
    [graph addPlot:barPlot];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    [animation setDuration:.5];
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 10);
    
    //offsetY=[PlotDisplayAreaUnderXAxisHeight]-[PlotDisplayAreaHeight]/2
    transform = CATransform3DConcat(transform, CATransform3DMakeTranslation(0, 0, 0));
    animation.fromValue = [NSValue valueWithCATransform3D:transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    [barPlot addAnimation:animation forKey:@"barGrowth"];
    
    // Plot space
    CPTMutablePlotRange *barRange = [[barPlot plotRangeEnclosingBars] mutableCopy];
    [barRange expandRangeByFactor:CPTDecimalFromDouble(1.05)];
    CPTXYPlotSpace *barPlotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    barPlotSpace.xRange = barRange;
    barPlotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(100.0f)];
    
    // Add legend
     CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
     theLegend.fill            = [CPTFill fillWithColor:[CPTColor colorWithGenericGray:0.15]];
     //theLegend.borderLineStyle = barLineStyle;
     theLegend.cornerRadius    = 10.0;
    theLegend.numberOfRows    = 2;
     theLegend.swatchSize      = CGSizeMake(16.0, 16.0);
     CPTMutableTextStyle *whiteTextStyle2 = [CPTMutableTextStyle textStyle];
     whiteTextStyle2.color    = [CPTColor whiteColor];
     whiteTextStyle2.fontSize = 12.0;
     theLegend.textStyle     = whiteTextStyle2;
     theLegend.rowMargin     = 10.0;
     theLegend.numberOfRows  = 2;
     theLegend.paddingLeft   = 12.0;
     theLegend.paddingTop    = 12.0;
     theLegend.paddingRight  = 12.0;
     theLegend.paddingBottom = 12.0;
    
#if HORIZONTAL
    NSArray *plotPoint = [NSArray arrayWithObjects:[NSNumber numberWithInteger:95], [NSNumber numberWithInteger:0], nil];
#else
    NSArray *plotPoint = [NSArray arrayWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:80], nil];
#endif
    CPTPlotSpaceAnnotation *legendAnnotation = [[CPTPlotSpaceAnnotation alloc] initWithPlotSpace:barPlotSpace anchorPlotPoint:plotPoint];
    legendAnnotation.contentLayer = theLegend;
    
#if HORIZONTAL
    legendAnnotation.contentAnchorPoint = CGPointMake(1.0, 0.0);
#else
    legendAnnotation.contentAnchorPoint = CGPointMake(0.0, 1.0);
#endif
    [graph.plotAreaFrame.plotArea addAnnotation:legendAnnotation];

     
     graph.legend             = theLegend;
     graph.legendAnchor       = CPTRectAnchorBottom;
     graph.legendDisplacement = CGPointMake(0.0, 5.0);

}

@end
