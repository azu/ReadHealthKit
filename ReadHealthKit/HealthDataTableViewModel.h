//
// Created by azu on 2014/07/09.
//


#import <Foundation/Foundation.h>

@class DataStoreManager;
@class PMKPromise;
@class HKQuantityType;


@interface HealthDataTableViewModel : NSObject
@property(nonatomic, strong) DataStoreManager *dataStoreManager;

@property(nonatomic, strong) NSArray *heightDataList;

- (NSInteger)numberOfData;

- (NSString *)heightTextAtIndexPath:(NSIndexPath *) path;

- (NSString *)dateTextAtIndexPath:(NSIndexPath *) path;

- (HKQuantityType *)managedType;

- (PMKPromise *)reloadData;
@end