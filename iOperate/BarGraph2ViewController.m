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
    CPTColor *color = [[CPTColor whiteColor]colorWithAlphaComponent:0.5];
    //[CPTColor colorWithComponentRed:(27.0/256.0) green:(119.0/256.0) blue:(224.0/256.0) alpha:0.8];
    
    CPTGradient *fillGradient = [CPTGradient gradientWithBeginningColor:color endingColor:[[CPTColor colorWithComponentRed:(51.0/256.0) green:(204.0/256.0) blue:(255.0/256.0) alpha:0.2]colorWithAlphaComponent:0.2]];
    
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
            [contentArray addObject:[NSDecimalNumber numberWithDouble:i*10 + 10]];
        }
        plotData = contentArray;
    }
}

-(void)constructGraph1
{
    hostView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(20, 20, 728, 920)];
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
         xAxis.orthogonalCoordinateDecimal = CPTDecimalFromInteger(1);
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
    
    
    // Create a bar line style
    CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
    barLineStyle.lineWidth = 0.4;
    barLineStyle.lineColor = [CPTColor whiteColor];
    
    // Create bar plot
    CPTBarPlot *barPlot = [[CPTBarPlot alloc] init];
    barPlot.lineStyle         = barLineStyle;
    barPlot.barWidth          = CPTDecimalFromFloat(0.75f); // bar is 75% of the available space
    barPlot.barCornerRadius   = 4.0;
    barPlot.barsAreHorizontal = NO;
    barPlot.dataSource        = self;
    barPlot.identifier        = @"Bar Plot 1";
    CPTMutableTextStyle *whiteTextStyle = [CPTMutableTextStyle textStyle];
    whiteTextStyle.color   = [CPTColor whiteColor];
    barPlot.labelTextStyle = whiteTextStyle;
    
    [graph addPlot:barPlot];
    
    // Create second bar plot
    CPTBarPlot *barPlot2 = [CPTBarPlot tubularBarPlotWithColor:[CPTColor blueColor] horizontalBars:NO];
    
    barPlot2.lineStyle    = barLineStyle;
    barPlot2.fill         = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:1.0f green:1.0f blue:0.5f alpha:0.5f]];
    barPlot2.barBasesVary = YES;
    
    barPlot2.barWidth = CPTDecimalFromFloat(1.0f); // bar is full (100%) width
    //	barPlot2.barOffset = -0.125f; // shifted left by 12.5%
    barPlot2.barCornerRadius = 2.0f;
    barPlot2.barsAreHorizontal = NO;
    barPlot2.delegate   = self;
    barPlot2.dataSource = self;
    barPlot2.identifier = @"Bar Plot 2";
    barPlot2.barOffsetScale = 1.275;
    
    [graph addPlot:barPlot2];
    
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
     theLegend.borderLineStyle = barLineStyle;
     theLegend.cornerRadius    = 10.0;
    theLegend.numberOfRows    = 2;
     theLegend.swatchSize      = CGSizeMake(16.0, 16.0);
     CPTMutableTextStyle *whiteTextStyle2 = [CPTMutableTextStyle textStyle];
     whiteTextStyle2.color    = [CPTColor whiteColor];
     whiteTextStyle2.fontSize = 12.0;
     theLegend.textStyle     = whiteTextStyle2;
     theLegend.rowMargin     = 10.0;
     theLegend.numberOfRows  = 1;
     theLegend.paddingLeft   = 12.0;
     theLegend.paddingTop    = 12.0;
     theLegend.paddingRight  = 12.0;
     theLegend.paddingBottom = 12.0;
    
#if HORIZONTAL
    NSArray *plotPoint = [NSArray arrayWithObjects:[NSNumber numberWithInteger:95], [NSNumber numberWithInteger:0], nil];
#else
    NSArray *plotPoint = [NSArray arrayWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:95], nil];
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
