//
//  WLMFillTaxationInfoVM.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMFillTaxationInfoVM.h"

@interface WLMFillTaxationInfoVM()

@property (nonatomic, strong, readwrite) WLMMoreTaxationInfoVM *moreInfoViewModel;
@property (nonatomic, strong, readwrite) RACCommand *submitFormCmd;
@end

@implementation WLMFillTaxationInfoVM

- (instancetype)initWithService:(id<WLBViewModelServiceImpProtocol>)service params:(NSDictionary *)params {
    self = [super initWithService:service params:params];
    if (self) {
    }
    return self;
}

- (void)initialize {
    [super initialize];
    
    self.moreInfoViewModel = [[WLMMoreTaxationInfoVM alloc] initWithService:self.service params:nil];
    
    self.submitFormCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSDictionary *dic) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            [params setObject:@"2323232323" forKey:@"merchantNo"];
            [params setObject:dic[@"税控盘类型"] forKey:@"diskType"];
            [params setObject:dic[@"税控盘号"] forKey:@"diskNumber"];
            [params setObject:dic[@"是否已至税务局开通电子发票业务"] forKey:@"taxBussinessStatus"];
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            
//            [[[__NETWL configPostPathKey:@"net_ei_fill_tax_info" postParams:params] setLoadMode:RequestLoadShowLoading | RequestLoadShowErrorTips] requestCallBack:^(LRResponseModel *responseModel) {
//                if (responseModel.success) {
//                    [subscriber sendNext:responseModel];
//                    [subscriber sendCompleted];
//                } else {
//                    [subscriber sendCompleted];
//                }
//            }];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

@end
