//
// Created by azu on 2014/07/16.
//


#import <Foundation/Foundation.h>

@class HKQuantityType;
@class PMKPromise;


@interface StatisticsViewModel : NSObject
- (PMKPromise *)fetchStatistics;

- (HKQuantityType *)managedType;
@end