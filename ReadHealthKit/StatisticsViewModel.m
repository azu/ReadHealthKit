//
// Created by azu on 2014/07/16.
//


#import <HealthKit/HealthKit.h>
#import <PromiseKit/Promise.h>
#import "StatisticsViewModel.h"
#import "DataStoreManager.h"


@interface StatisticsViewModel ()
@property(nonatomic, strong) DataStoreManager *manager;
@end

@implementation StatisticsViewModel {

}
- (instancetype)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _manager = [[DataStoreManager alloc] init];

    return self;
}


- (PMKPromise *)fetchStatistics {
    return [self.manager statisticsForType:self.managedType predicate:nil options:HKStatisticsOptionDiscreteMax].then(^(HKStatistics *statistics) {
        // fulled maximum, but the other to be null.
        return statistics.maximumQuantity;
    });
}

- (HKQuantityType *)managedType {
    HKQuantityType *heightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    return heightType;
}
@end