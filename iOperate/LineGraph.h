//
//  LineGraph.h
//  iOperate
//
//  Created by Max Gilbert on 7/30/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineGraph : NSObject
-(void)addPoint:(float)x:(float)y;
-(NSArray*)allPoints;
@property(nonatomic) float plotX;
@property(nonatomic) float plotY;
@end
