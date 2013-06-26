//
//  BarGraphViewController.m
//  iOperate
//
//  Created by James Bartolozzi on 6/25/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "BarGraphViewController.h"

@interface BarGraphViewController ()

@end

@implementation BarGraphViewController

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
    [self constructGraph];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return plotData.count;
}

-(CPTFill *)barFillForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSUInteger)index
{
    CPTColor *color = nil;
    
    switch ( index ) {
        case 0:
            color = [CPTColor cyanColor];
            break;
            
        case 1:
            color = [CPTColor cyanColor];
            break;
            
        case 2:
            color = [CPTColor cyanColor];
            break;
            
        case 3:
            color = [CPTColor cyanColor];
            break;
            
        case 4:
            color = [CPTColor cyanColor];
            break;
            
        case 5:
            color = [CPTColor cyanColor];
            break;
            
        case 6:
            color = [CPTColor cyanColor];
            break;
            
        case 7:
            color = [CPTColor cyanColor];
            break;
            
        default:
            break;
    }
    
    CPTGradient *fillGradient = [CPTGradient gradientWithBeginningColor:color endingColor:[[CPTColor colorWithComponentRed:(51.0/256.0) green:(204.0/256.0) blue:(255.0/256.0) alpha:1.0]colorWithAlphaComponent:7.0]];
    
    return [CPTFill fillWithGradient:fillGradient];
    
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
            [contentArray addObject:[NSDecimalNumber numberWithDouble:10.0 * rand() / (double)RAND_MAX + 5.0]];
        }
        plotData = contentArray;
    }
}

-(void)constructGraph
{
    hostView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(10, 10, 748, 800)];
    hostView.clipsToBounds = YES;
    [[hostView layer] setCornerRadius:10];
    [self.view addSubview: hostView];
    graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
    
    // Apply Theme
    CPTTheme *theme =[CPTTheme themeNamed:kCPTPlainWhiteTheme];
    [graph applyTheme:theme];
    //graph.fill = [CPTFill fillWithColor:[[CPTColor colorWithComponentRed:1.0 green:1.0 blue:1.0 alpha:1.0]colorWithAlphaComponent:1.0]];
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
    graph.plotAreaFrame.paddingBottom += 60.0;
    
    // Create grid line styles
    CPTMutableLineStyle *majorGridLineStyle = [CPTMutableLineStyle lineStyle];
    majorGridLineStyle.lineWidth = 1.0;
    majorGridLineStyle.lineColor = [[CPTColor blackColor] colorWithAlphaComponent:0.75];
    
    CPTMutableLineStyle *minorGridLineStyle = [CPTMutableLineStyle lineStyle];
    minorGridLineStyle.lineWidth = 1.0;
    minorGridLineStyle.lineColor = [[CPTColor blackColor] colorWithAlphaComponent:0.25];
    
    // Create axes
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    xAxis          = axisSet.xAxis;
    {
        xAxis.majorIntervalLength         = CPTDecimalFromInteger(1);
        xAxis.minorTicksPerInterval       = 9;
        xAxis.orthogonalCoordinateDecimal = CPTDecimalFromInteger(0);
        xAxis.majorGridLineStyle          = majorGridLineStyle;
        xAxis.minorGridLineStyle          = minorGridLineStyle;
        xAxis.axisLineStyle               = nil;
        xAxis.majorTickLineStyle          = nil;
        xAxis.minorTickLineStyle          = nil;
        //xAxis.labelFormatter              = nil;
        yAxis.labelOffset                 = 10.0;
        yAxis.labelRotation               = M_PI / 2;
        yAxis.labelingPolicy              = CPTAxisLabelingPolicyAutomatic;
        
        xAxis.title = @"Quiz Number";
        xAxis.titleOffset = 30.0f;
        
    }
    
    yAxis = axisSet.yAxis;
    {
        yAxis.majorIntervalLength         = CPTDecimalFromInteger(10);
        yAxis.minorTicksPerInterval       = 9;
        yAxis.axisConstraints             = [CPTConstraints constraintWithLowerOffset:0.0];
        yAxis.preferredNumberOfMajorTicks = 8;
        yAxis.majorGridLineStyle          = majorGridLineStyle;
        yAxis.minorGridLineStyle          = minorGridLineStyle;
        yAxis.axisLineStyle               = nil;
        yAxis.majorTickLineStyle          = nil;
        yAxis.minorTickLineStyle          = nil;
        yAxis.labelOffset                 = 10.0;
        yAxis.labelRotation               = M_PI / 2;
        yAxis.labelingPolicy              = CPTAxisLabelingPolicyAutomatic;
        
        yAxis.title       = @"Y Axis";
        yAxis.titleOffset = 30.0f;
    }
    
    
    // Create a bar line style
    CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
    barLineStyle.lineWidth = 0.4;
    barLineStyle.lineColor = [CPTColor blackColor];
    
    // Create bar plot
    CPTBarPlot *barPlot = [[CPTBarPlot alloc] init];
    barPlot.lineStyle         = barLineStyle;
    barPlot.barWidth          = CPTDecimalFromFloat(0.75f); // bar is 75% of the available space
    barPlot.barCornerRadius   = 4.0;
    barPlot.barsAreHorizontal = NO;
    barPlot.dataSource        = self;
    barPlot.identifier        = @"Bar Plot 1";
    
    [graph addPlot:barPlot];
    
    // Plot space
    CPTMutablePlotRange *barRange = [[barPlot plotRangeEnclosingBars] mutableCopy];
    [barRange expandRangeByFactor:CPTDecimalFromDouble(1.05)];
    
    CPTXYPlotSpace *barPlotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    barPlotSpace.xRange = barRange;
    barPlotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(16.0f)];
    
    /* Add legend
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    theLegend.fill            = [CPTFill fillWithColor:[CPTColor colorWithGenericGray:0.15]];
    theLegend.borderLineStyle = barLineStyle;
    theLegend.cornerRadius    = 10.0;
    theLegend.swatchSize      = CGSizeMake(16.0, 16.0);
    CPTMutableTextStyle *whiteTextStyle = [CPTMutableTextStyle textStyle];
    whiteTextStyle.color    = [CPTColor whiteColor];
    whiteTextStyle.fontSize = 12.0;
    theLegend.textStyle     = whiteTextStyle;
    theLegend.rowMargin     = 10.0;
    theLegend.numberOfRows  = 1;
    theLegend.paddingLeft   = 12.0;
    theLegend.paddingTop    = 12.0;
    theLegend.paddingRight  = 12.0;
    theLegend.paddingBottom = 12.0;
    
    graph.legend             = theLegend;
    graph.legendAnchor       = CPTRectAnchorBottom;
    graph.legendDisplacement = CGPointMake(0.0, 5.0);
    */
}

@end
