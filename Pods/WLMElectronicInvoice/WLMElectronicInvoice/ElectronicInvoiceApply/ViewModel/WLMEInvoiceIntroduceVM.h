//
//  WLMEInvoiceIntroduceVM.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMFillTaxationInfoVM.h"
@interface WLMEInvoiceIntroduceVM : WLBaseViewModel

@property (nonatomic, strong, readonly) WLMFillTaxationInfoVM *taxaInfoViewModel;
@end
