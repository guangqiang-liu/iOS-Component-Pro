//
//  WLMEInvoiceIntroduceVM.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMEInvoiceIntroduceVM.h"

@interface WLMEInvoiceIntroduceVM()

@property (nonatomic, strong, readwrite) WLMFillTaxationInfoVM *taxaInfoViewModel;
@end

@implementation WLMEInvoiceIntroduceVM

- (void)initialize {
    [super initialize];
    self.taxaInfoViewModel = [[WLMFillTaxationInfoVM alloc] initWithService:self.service params:nil];
}
@end
