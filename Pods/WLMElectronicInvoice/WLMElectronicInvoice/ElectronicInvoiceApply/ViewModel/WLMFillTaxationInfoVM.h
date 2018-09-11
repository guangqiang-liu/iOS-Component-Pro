//
//  WLMFillTaxationInfoVM.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMMoreTaxationInfoVM.h"
@interface WLMFillTaxationInfoVM : WLBaseViewModel

@property (nonatomic, strong, readonly) WLMMoreTaxationInfoVM *moreInfoViewModel;
@property (nonatomic, strong, readonly) RACCommand *submitFormCmd;
@end
