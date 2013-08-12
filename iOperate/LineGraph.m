//
//  LineGraph.m
//  iOperate
//
//  Created by Max Gilbert on 7/30/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "LineGraph.h"
@interface LineGraph()
@property(strong,nonatomic)NSMutableArray* points;
@end

@implementation LineGraph
- (id)initFromPoint:(float)x:(float)y{
    self = [super init];
    if (self){
        _plotX = x;
        _plotY = y;
    }
    return self;
}
- (id) init{
    self = [super init];
    if (self){
        _plotX = 0;
        _plotY = 0;
    }
    return self;
}
-(NSMutableArray*)points{
    if(!_points){
        _points=[[NSMutableArray alloc]init];
    }
    return _points;
}
-(void)addPoint:(float)x:(float)y{
    [self.points addObject:[NSNumber numberWithFloat:x]];
    [self.points addObject:[NSNumber numberWithFloat:y]];
}
-(NSArray *) allPoints{
    return _points;
}

@end
