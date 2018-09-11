//
//  WLMOpenInvoiceVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/7.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMOpenInvoiceVC.h"
#import "WLMResendInvoiceVC.h"

@interface WLMOpenInvoiceVC ()

@property (nonatomic, assign) BOOL buttonEnabled;
@end

@implementation WLMOpenInvoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"开票";
}

- (void)renderViews {
    [super renderViews];
    [self configFormInfo];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (void)configFormInfo {
    [self.form addSection:[self invoiceDetail]];
    [self.form addSection:[self receiveMode]];
}

- (WLFormSectionViewModel *)invoiceDetail {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 58;
    section.headerTitle = @"发票详情";
    
    dic = @{kLeftKey:@"发票金额（请确认金额）", kPlaceholder:@"请输入金额"};
    row = [self textFieldSumCellWithInfo:dic];
    row.hasTopSep = YES;
    [section addItem:row];
    
    dic = @{kLeftKey:@"发票内容"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"发票抬头"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"税号"};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    return section;
}

- (WLFormSectionViewModel *)receiveMode {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 58;
    section.headerTitle = @"接受方式";
    
    dic = @{kLeftKey:@"手机号码"};
    row = [self textFieldCellWithInfo:dic];
    row.hasTopSep = YES;
    [section addItem:row];
    
    dic = @{kLeftKey:@"电子邮箱"};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    
    dic = @{kLeftKey:@"确认开票"};
    row = [self bottomButtonCellWithInfo:dic];
    row.bottomSepLineMarginLeft = 0;
    [section addItem:row];
    return section;
}

- (WLFormItemViewModel *)textFieldSumCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormSumTextInputCell"];
    row.itemHeight = 68;
    row.cellClass = [WLFormSumTextInputCell class];
    row.value = info.mutableCopy;
    row.itemConfigBlock = ^(WLFormSumTextInputCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftLable.text = value[kLeftKey];
        cell.rightInput.text = value[kRightKey];
        cell.rightInput.enabled = ![value[kDisableKey] boolValue];
        cell.rightInput.placeholder = value[kPlaceholder];
        __weak typeof(cell) weakCell = cell;
        cell.textChangeBlock = ^(NSString *text) {
            value[kRightKey] = text;
            text.length ? (weakCell.rightInput.font = HB26) : (weakCell.rightInput.font = H14);
            text.length ? (self.buttonEnabled = YES) : (self.buttonEnabled = NO);
        };
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)textFieldCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormTextInputCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormTextInputCell class];
    row.value = info.mutableCopy;
    row.itemConfigBlock = ^(WLFormTextInputCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftlabel.text = value[kLeftKey];
        cell.rightField.text = value[kRightKey];
        cell.rightField.enabled = ![value[kDisableKey] boolValue];
        cell.rightField.placeholder = value[kPlaceholder];
        cell.textChangeBlock = ^(NSString *text) {
            value[kRightKey] = text;
        };
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)bottomButtonCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormBottomButtonCell"];
    row.cellClass = [WLFormBottomButtonCell class];
    row.itemHeight = 78.f;
    __weak typeof(self) weakSelf = self;
    row.itemConfigBlock = ^(WLFormBottomButtonCell *cell, id value, NSIndexPath *indexPath) {
        [cell.button setTitle:info[kLeftKey] forState:UIControlStateNormal];
        RAC(cell.button, enabled) = RACObserve(self, buttonEnabled);
        [cell.button whenTapped:^{
            WLMResendInvoiceVC *VC = [[WLMResendInvoiceVC alloc] init];
            [weakSelf.navigationController pushViewController:VC animated:YES];
        }];
    };
    return row;
}

@end
