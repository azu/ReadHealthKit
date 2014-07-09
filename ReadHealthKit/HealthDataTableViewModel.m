//
// Created by azu on 2014/07/09.
//


#import <PromiseKit/Promise.h>
#import "HealthDataTableViewModel.h"
#import "DataStoreManager.h"
#import <UIKit/UIKit.h>

@implementation HealthDataTableViewModel {

}
- (instancetype)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _dataStoreManager = [[DataStoreManager alloc] init];

    return self;
}

- (HKQuantityType *)managedType {
    HKQuantityType *heightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    return heightType;
}

- (PMKPromise *)reloadData {
    PMKPromise *availablePromise = [self.dataStoreManager availableType:self.managedType];
    return availablePromise.then(^{
        return [self.dataStoreManager fetchAllSampleForType:self.managedType];
    }).then(^(NSArray *result) {
        self.heightDataList = result;
        return result;
    });
}

- (NSInteger)numberOfData {
    return [self.heightDataList count];
}

- (NSString *)heightTextAtIndexPath:(NSIndexPath *) path {
    HKQuantitySample *sample = self.heightDataList[path.row];
    return sample.quantity.description;
}

- (NSString *)dateTextAtIndexPath:(NSIndexPath *) path {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    HKQuantitySample *sample = self.heightDataList[path.row];
    return [formatter stringFromDate:sample.endDate];
}

@end