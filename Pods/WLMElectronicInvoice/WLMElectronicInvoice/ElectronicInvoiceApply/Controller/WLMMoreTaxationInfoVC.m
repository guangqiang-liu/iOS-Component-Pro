//
//  WLMMoreTaxationInfoVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/5.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMMoreTaxationInfoVC.h"
#import "WLMOpenInvoiceVC.h"
#import "WLMMoreTaxationInfoVM.h"
#import "WLMPackageSelectVC.h"
#import "WLMSearchInvoiceItemVC.h"
#import "WLMSelectInvoiceItemModel.h"

@interface WLMMoreTaxationInfoVC ()

@property (nonatomic, strong) UIButton *bottomButton;
@property (nonatomic, strong) WLMMoreTaxationInfoVM *moreInfoViewModel;
@property (nonatomic, assign) BOOL buttonEnabled;
@property (nonatomic, copy) NSString *invoiceName;
@end

@implementation WLMMoreTaxationInfoVC

- (instancetype)initWithViewModel:(WLMMoreTaxationInfoVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _moreInfoViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写税务信息";
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SAFE_AREA - 48);
}

-(void)renderViews {
    [super renderViews];
    [self configFormInfo];
    [self renderBottomButton];
}

- (void)bindViewModel {
    [super bindViewModel];
    // 这里的绑定，能否不生成中间变量就可以实现状态绑定？
    RAC(self.bottomButton, enabled) = RACObserve(self, buttonEnabled);
}

- (void)configFormInfo {
    [self.form addSection:[self merchantInfo]];
    [self.form addSection:[self invoiceInfo]];
    [self.form addSection:[self moreInfo]];
}

- (WLFormSectionViewModel *)merchantInfo {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 58;
    section.headerTitle = @"商户信息（必填）";
    
    dic = @{kLeftKey:@"名称", kPlaceholder:@"请输入商户名称"};
    row = [self textFieldCellWithInfo:dic];
    row.hasTopSep = YES;
    [section addItem:row];
    
    dic = @{kLeftKey:@"税号", kPlaceholder:@"请输入税号"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"地址", kPlaceholder:@"请输入地址"};
    row = [self textViewCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"联系电话", kPlaceholder:@"请输入联系电话"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"银行账号", kPlaceholder:@"请输入银行账号"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"开户行", kPlaceholder:@"请输入开户行"};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    
    return section;
}

- (WLFormSectionViewModel *)invoiceInfo {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 58;
    section.headerTitle = @"开票信息（必填）";
    
    dic = @{kLeftKey:@"征税方式", kPlaceholder:@"请选择征税方式"};
    row = [self selectPickerCellWithInfo:dic];
    row.hasTopSep = YES;
    [section addItem:row];
    
    dic = @{kLeftKey:@"开票项目", kPlaceholder:@"请输入开票项目"};
    WLFormItemViewModel *invoiceItemRow = [self selectCellWithInfo:dic];
    [section addItem:invoiceItemRow];
    
    dic = @{kLeftKey:@"商品编号", kRightKey:@"1090252020000000000"};
    row = [self rightValueCellWithInfo:dic];
    row.itemConfigBlock = ^(WLFormRightValueCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftLable.text = value[kLeftKey];
        value[kRightKey] = invoiceItemRow.value[kRightKey] ? invoiceItemRow.value[kRightKey] : value[kRightKey];
        cell.rightTitle = invoiceItemRow.value[kRightKey] ? invoiceItemRow.value[kRightKey] : value[kRightKey];
    };
    [section addItem:row];
    
    dic = @{kLeftKey:@"税率", kPlaceholder:@"请选择税率"};
    row = [self selectPickerCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"开票人", kPlaceholder:@"请输入开票人"};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    
    dic = @{kLeftKey:@"更多信息（选填）"};
    row = [self moreInfoCellWithInfo:dic];
    row.bottomSepLineMarginLeft = 0;
    [section addItem:row];
    
    return section;
}

- (WLFormSectionViewModel *)moreInfo {
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    section = [[WLFormSectionViewModel alloc] init];
    
    dic = @{kLeftKey:@"收款人", kPlaceholder:@"请输入收款人", kDispensable:@YES};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"复核人", kPlaceholder:@"请输入复核人", kDispensable:@YES};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"财务联系电话", kPlaceholder:@"请输入财务联系电话", kDispensable:@YES};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"特殊票种标识", kPlaceholder:@"请选择特殊票种标识", kDispensable:@YES};
    row = [self selectPickerCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"发票行性质", kPlaceholder:@"请选择发票行性质", kDispensable:@YES};
    row = [self selectPickerCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"优惠政策标识", kPlaceholder:@"请选择优惠政策标识", kDispensable:@YES};
    row = [self selectPickerCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"零税率标识", kPlaceholder:@"请选择零税率标识", kDispensable:@YES};
    row = [self selectPickerCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"增值税特殊管理", kRightKey:@"无", kDisableKey:@YES, kDispensable:@YES};
    row = [self textFieldCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    return section;
}

- (WLFormItemViewModel *)textFieldCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormTextInputCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormTextInputCell class];
    row.value = info.mutableCopy;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormTextInputCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftlabel.text = value[kLeftKey];
        cell.rightField.text = value[kRightKey];
        cell.rightField.enabled = ![value[kDisableKey] boolValue];
        cell.rightField.textColor = [value[kDisableKey] boolValue] ? HexRGB(0xcfcfcf) : textBlackColor;
        cell.rightField.placeholder = value[kPlaceholder];
        @strongify(self);
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
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length] || [value[kDispensable] boolValue]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    return row;
}

- (WLFormItemViewModel *)textViewCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormTextViewCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormTextViewCell class];
    row.value = info.mutableCopy;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormTextViewCell *cell, id value, NSIndexPath *indexPath) {
        @strongify(self);
        cell.leftTitle.text = value[kLeftKey];
        cell.textView.text = value[kRightKey];
        cell.textView.textColor = [value[kDisableKey] boolValue] ? HexRGB(0xcfcfcf) : textBlackColor;
        cell.textView.wl_placeHolder = value[kPlaceholder];
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
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length] || [value[kDispensable] boolValue]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    return row;
}

- (WLFormItemViewModel *)moreInfoCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormMoreInfoCell"];
    row.cellClass = [WLFormMoreInfoCell class];
    row.itemHeight = 54.f;
    row.value = info.mutableCopy;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormMoreInfoCell *cell, id value, NSIndexPath *indexPath) {
        @strongify(self);
        cell.leftTitle.text = value[kLeftKey];
        cell.moreInfoBlock = ^{
            // 这里当不加下面的strongify，就会导致内存泄漏问题，如果调试y如何使用`MLeaksFinder` 来检查内存泄漏，可以将下面一行代码注释看看
            @strongify(self);
            WLFormSectionViewModel *section = self.form.sectionArray[2];
            section.hidden = !section.hidden;
            [self.tableView reloadData];
        };
    };
    return row;
}

- (WLFormItemViewModel *)selectPickerCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormSelectCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormSelectCell class];
    row.value = info.mutableCopy;
    row.itemConfigBlock = ^(WLFormSelectCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftLable.text = value[kLeftKey];
        cell.rightTitle = value[kRightKey];
    };
    @weakify(self);
    row.didSelectCellBlock = ^(NSIndexPath *indexPath, id value, WLFormSelectCell *cell) {
        @strongify(self);
        [self selectItemWithDataSource:@[@"1", @"2", @"3", @"4"] title:value[kLeftKey] callback:^(NSString *item) {
            value[kRightKey] = item;
            cell.rightTitle = item;
            [self changeSubmitButtonState];
        }];
    };
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length] || [value[kDispensable] boolValue]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)selectCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormSelectCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormSelectCell class];
    row.value = info.mutableCopy;
    row.itemConfigBlock = ^(WLFormSelectCell *cell, id value, NSIndexPath *indexPath) {
        cell.leftLable.text = value[kLeftKey];
        cell.rightTitle = value[kRightKey];
    };
    @weakify(self);
    row.didSelectCellBlock = ^(NSIndexPath *indexPath, id value, WLFormSelectCell *cell) {
        @strongify(self);
        WLMSearchInvoiceItemVC *vc = [[WLMSearchInvoiceItemVC alloc] init];
        vc.selectInvoiceItemBlock = ^(WLMSelectInvoiceItemModel *model) {
            value[kRightKey] = model.invoiceName;
            cell.rightTitle = model.invoiceName;
            [self changeSubmitButtonState];
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:vc animated:YES];
    };
    row.valueValidateBlock = ^NSDictionary *(id value) {
        if ([value[kRightKey] length] || [value[kDispensable] boolValue]) return itemValid();
        return itemInvalid(value[kPlaceholder]);
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)rightValueCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormRightValueCell"];
    row.itemHeight = 48;
    row.cellClass = [WLFormRightValueCell class];
    row.value = info.mutableCopy;
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (void)renderBottomButton {
    [self.view addSubview:self.bottomButton];
}

- (UIButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButton.frame = CGRectMake(0, SAFE_AREA - 48, SCREEN_WIDTH, 48);
        [_bottomButton setTitleColor:white_color forState:UIControlStateNormal];
        [_bottomButton setTitle:@"下一步" forState:UIControlStateNormal];
        _bottomButton.titleLabel.font = H18;
        [_bottomButton createGradientButtonWithSize:CGSizeMake(SCREEN_WIDTH, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
        [_bottomButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButton;
}

- (void)changeSubmitButtonState {
    NSDictionary *validateParams = [self.form validateItems];
    [validateParams[kValidateRetKey] boolValue] ? (self.buttonEnabled = YES) : (self.buttonEnabled = NO);
}

- (void)nextAction {
    WLMPackageSelectVC *VC = [[WLMPackageSelectVC alloc] initWithViewModel:self.moreInfoViewModel.packageSelectViewModel];
    [self.navigationController pushViewController:VC animated:YES];
    NSDictionary *dic = [self.form validateItems];
    if (![dic[kValidateRetKey] boolValue]) {
//        [self alertMsg:dic[kValidateMsgKey]];
    } else {
        NSDictionary *params = [self.form fetchRequestParams];
        NSLog(@"%@", params);
    }
}

- (void)alertMsg:(NSString *)msg title:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *done = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:done];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)selectItemWithDataSource:(NSArray *)data title:(NSString *)title callback:(void(^)(NSString *item))callback {
    [[WLPickerViewManager shareManger] showPickerViewWithCustomDataArray:data keyMapper:@"name" tag:1 title:title cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(id selectedItem) {
        !callback ?: callback(selectedItem);
    } cancelBlock:^{
    }];
}

@end
