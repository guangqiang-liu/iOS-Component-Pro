//
//  WLMResendInvoiceVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/7.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMResendInvoiceVC.h"
#import "WLMPackageSelectVC.h"
#import "WLMResendInvoiceVM.h"
#import "WLMInvoiceDetailVC.h"

@interface WLMResendInvoiceVC ()

@property (nonatomic, strong) WLMResendInvoiceVM *invoiceViewModel;
@property (nonatomic, assign) BOOL buttonEnabled;
@end

@implementation WLMResendInvoiceVC

- (instancetype)initWithViewModel:(WLMResendInvoiceVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _invoiceViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重开电子发票";
}

- (void)renderViews {
    [super renderViews];
    [self configFormInfo];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (void)configFormInfo {
    [self.form addSection:[self resendInvoice]];
}

- (WLFormSectionViewModel *)resendInvoice {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 10;
    section.headerTopSepLineHeight = 10;
    section.headerTopSepLineColor = sepLineColor;
    
    dic = @{kLeftKey:@"电子邮箱", kPlaceholder:@"请输入电子邮箱"};
    row = [self textFieldCellWithInfo:dic];
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    [section addItem:row];
    
    dic = @{kLeftKey:@"手机号码", kPlaceholder:@"请输入手机号码"};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    [section addItem:row];
    
    dic = @{kLeftKey:@"说明：请重新确认信息后点击提交开票"};
    row = [self bottomTipCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"提交"};
    row = [self bottomButtonCellWithInfo:dic];
    [section addItem:row];
    return section;
}


- (WLFormItemViewModel *)textFieldCellWithInfo:(NSDictionary *)userInfo {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormTextInputCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormTextInputCell class];
    row.value = userInfo.mutableCopy;
    row.itemConfigBlock = ^(WLFormTextInputCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftlabel.text = value[kLeftKey];
        cell.rightField.text = value[kRightKey];
        cell.rightField.enabled = ![value[kDisableKey] boolValue];
        cell.rightField.placeholder = value[kPlaceholder];
        @weakify(self);
        cell.textChangeBlock = ^(NSString *text) {
            @strongify(self);
            value[kRightKey] = text;
            [self changeSubmitButtonState];
        };
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)bottomTipCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormBottomTipCell"];
    row.cellClass = [WLFormBottomTipCell class];
    row.itemHeight = 54.f;
    row.itemConfigBlock = ^(WLFormBottomTipCell *cell, id value, NSIndexPath *indexPath) {
        cell.tipStr = info[kLeftKey];
    };
    return row;
}

- (WLFormItemViewModel *)bottomButtonCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormBottomButtonCell"];
    row.cellClass = [WLFormBottomButtonCell class];
    row.itemHeight = 78.f;
    row.itemConfigBlock = ^(WLFormBottomButtonCell *cell, id value, NSIndexPath *indexPath) {
        [cell.button setTitle:info[kLeftKey] forState:UIControlStateNormal];
        RAC(cell.button, enabled) = RACObserve(self, buttonEnabled);
        [cell.button whenTapped:^{
            WLMInvoiceDetailVC *VC = [[WLMInvoiceDetailVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }];
    };
    return row;
}

- (void)changeSubmitButtonState {
    NSDictionary *validateParams = [self.form validateItems];
    [validateParams[kValidateRetKey] boolValue] ? (self.buttonEnabled = YES) : (self.buttonEnabled = NO);
}

@end
