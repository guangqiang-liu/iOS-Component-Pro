//
//  WLMMoreTaxationInfoVM.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMMoreTaxationInfoVM.h"

@interface WLMMoreTaxationInfoVM()

@property (nonatomic, strong, readwrite) WLMPackageSelectVM *packageSelectViewModel;
@end

@implementation WLMMoreTaxationInfoVM

- (void)initialize {
    [super initialize];
    self.packageSelectViewModel = [[WLMPackageSelectVM alloc] initWithService:self.service params:nil];
}

@end
