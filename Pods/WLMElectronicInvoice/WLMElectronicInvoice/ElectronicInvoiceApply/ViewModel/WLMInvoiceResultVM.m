//
//  WLMInvoiceResultVM.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceResultVM.h"
#import "WLMInvoiceResultModel.h"

@interface WLMInvoiceResultVM()

@property (nonatomic, strong, readwrite) RACCommand *resultInfoCmd;
@property (nonatomic, copy, readwrite) NSString *title;
@end

@implementation WLMInvoiceResultVM

- (instancetype)initWithService:(id<WLBViewModelServiceImpProtocol>)service params:(NSDictionary *)params {
    self = [super initWithService:service params:params];
    if (self) {
    }
    return self;
}

- (void)initialize {
    [super initialize];
    
    self.title = [self.params[@"type"] isEqualToString:@"WLMPackageSelectVM"] ? @"申请结果" : @"提交结果";
    _resultInfoCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *type) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            WLMInvoiceResultModel *model = [[WLMInvoiceResultModel alloc] init];
            if ([self.params[@"type"] isEqualToString:@"WLMPackageSelectVM"]) {
                model.navTitle = @"申请结果";
                model.stateTitle = @"申请完成";
                model.content = @"申请完成后，电票业务不会立即生效，我们会尽快派专人协助您上线电子发票功能。";
                model.buttonTitle = @"返回发现页";
            } else {
                model.navTitle = @"提交结果";
                model.stateTitle = @"发送成功";
                model.content = @"请稍后查看手机或邮箱收取";
                model.buttonTitle = @"我知道了";
            }
            [subscriber sendNext:model];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}
@end
