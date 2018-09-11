//
//  WLMPackageSelectVM.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

@class WLMInvoiceResultVM;

@interface WLMPackageSelectVM : WLBaseViewModel

@property (nonatomic, strong, readonly) WLMInvoiceResultVM *resultViewModel;
@property (nonatomic, strong, readonly) RACCommand *submitCmd;
@end
