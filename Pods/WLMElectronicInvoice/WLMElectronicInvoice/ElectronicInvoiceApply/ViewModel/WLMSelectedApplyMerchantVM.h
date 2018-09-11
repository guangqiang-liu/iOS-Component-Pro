//
//  WLMSelectedApplyMerchantVM.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMEInvoiceIntroduceVM.h"

@interface WLMSelectedApplyMerchantVM : WLBaseViewModel

@property (nonatomic, strong, readonly) RACCommand *merchantListCmd;

@property (nonatomic, strong, readonly) WLMEInvoiceIntroduceVM *introduceViewModel;
@end
