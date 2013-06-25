//
//  TestResult.h
//  iOperate
//
//  Created by Max Gilbert on 6/21/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestResult : NSObject
+ (NSArray *) allTestResults;

@property(readonly, nonatomic)NSDate *start;
@property(readonly, nonatomic)NSDate *end;
@property(readonly, nonatomic)NSTimeInterval duration;
@property(nonatomic) float grade;
@end
