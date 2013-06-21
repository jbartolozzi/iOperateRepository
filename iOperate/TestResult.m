//
//  TestResult.m
//  iOperate
//
//  Created by Max Gilbert on 6/21/13.
//  Copyright (c) 2013 SIG Center. All rights reserved.
//

#import "TestResult.h"

@interface TestResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation TestResult
# define ALL_RESULTS_KEY @"TestResult_All"
# define START_KEY @"StartDate"
# define END_KEY @"EndDate"
# define GRADE_KEY @"Grade"
+ (NSArray *) allTestResults{
    NSMutableArray *allTestResults =[[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY] allValues]){
        TestResult *result = [[TestResult alloc]initFromPropertyList:plist];
        [allTestResults addObject:result];
    }
    return allTestResults;
}

-(id)initFromPropertyList:(id)plist{
    self = [self init];
    if(self){
        if( [plist isKindOfClass:[NSDictionary class]]){
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary [END_KEY];
            _grade = [resultDictionary [GRADE_KEY] floatValue];
            if(!_start||!_end){
                self = nil;
            }
        }
    }
    return self;
}
-(void)synchronize{
    NSMutableDictionary *mutableTestResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if(!mutableTestResultsFromUserDefaults) mutableTestResultsFromUserDefaults = [[NSMutableDictionary alloc]init];
    mutableTestResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableTestResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(id)asPropertyList{
    return @{ START_KEY: self.start, END_KEY: self.end, GRADE_KEY:@(self.grade)};
}
- (id) init{
    self = [super init];
    if (self){
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}
-(NSTimeInterval)duration{
    return [self.end timeIntervalSinceDate:self.start];
}

-(void)setGrade:(float)grade{
    _grade = grade;
    self.end= [NSDate date];
    [self synchronize];
}
/*#define ALL_RESULTS_KEY @"comments_ALL"
 
 -(void)changedComment:(UITextView *)sender{
 //_comments = [NSString stringWithString:sender.text];
 }
 -(void)setComments:(NSString *)comments{
 _comments = comments;
 [self synchronize];
 
 }
 
 + (NSString *) returnComments{
 NSString * resultComments = [[NSString alloc] init];
 for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]){
 resultComments = [[NSString alloc] initFromPropertyList:plist];
 }
 }
 -(id)initFromPropertyList:(id)plist{
 self = [self init];
 if(self){
 if([plist isKindOfClass:[NSDictionary class]]){
 NSDictionary *resultsDictionary = (NSDictionary *)plist;
 _comments = resultsDictionary[@"comments2"];
 }
 }
 return self;
 }*/
@end
