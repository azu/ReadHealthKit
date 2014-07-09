# ReadHealthKit

Example project of HealthKit

![img](http://take.ms/1er4V)

* Read Height data from HealthKit
* Write Height data by [azu/WriteHealthKit](https://github.com/azu/WriteHealthKit "azu/WriteHealthKit").

## Installation

```sh
pod install
```

## API Design

This project use promise pattern.

`DataStoreManager` is wrapper of HKHealthStore.

DataStoreManager use [PromiseKit](http://promisekit.org/ "PromiseKit").

```objec
@interface DataStoreManager : NSObject
@property(nonatomic, strong) HKHealthStore *healthStore;
// authorizationToType + authorizationStatusForType
- (PMKPromise *)availableType:(HKQuantityType *) hkQuantity;

- (PMKPromise *)authorizationToType:(HKQuantityType *) hkQuantity;

- (PMKPromise *)authorizationStatusForType:(HKQuantityType *) quantityType;

- (PMKPromise *)writeSample:(HKQuantitySample *)sample;

- (PMKPromise *)fetchAllSampleForType:(HKQuantityType *) quantityType;
@end
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT