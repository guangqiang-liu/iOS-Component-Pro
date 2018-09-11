//
//  WLBaseViewModel.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseViewModel.h"
#import "WLBViewModelServiceImpProtocol.h"

@interface WLBaseViewModel()

// service 只会存在于VM中
@property (nonatomic, strong, readwrite) id<WLBViewModelServiceImpProtocol> service;
@property (nonatomic, copy, readwrite) NSDictionary *params;
@end

@implementation WLBaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    WLBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithService:params:)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewModel)
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithService:(id<WLBViewModelServiceImpProtocol>)service params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        _service = service;
        _params = params;
    }
    return self;
}

- (void)initialize {
}

@end
