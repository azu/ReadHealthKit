//
//  StatisticsViewController.m
//  ReadHealthKit
//
//  Created by azu on 2014/07/15.
//  Copyright (c) 2014年 azu. All rights reserved.
//

#import "StatisticsViewController.h"
#import "DataStoreManager.h"
#import "StatisticsViewModel.h"
#import "Promise.h"

@interface StatisticsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property(nonatomic, strong) StatisticsViewModel *model;
@end

@implementation StatisticsViewController {
}
- (StatisticsViewModel *)model {
    if (_model == nil) {
        _model = [[StatisticsViewModel alloc] init];
    }
    return _model;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 統計データの取得表示
    [self.model fetchStatistics].then(^(HKQuantity *quantity) {
        self.maxLabel.text = quantity.description;
    });
}


@end
