//
//  WLMInvoiceResultVM.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

@interface WLMInvoiceResultVM : WLBaseViewModel

@property (nonatomic, strong, readonly) RACCommand *resultInfoCmd;
@property (nonatomic, copy, readonly) NSString *title;

@end
