//
//  WLMFillTaxationInfoVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/5.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMFillTaxationInfoVC.h"
#import "WLMMoreTaxationInfoVC.h"
#import "WLMFillTaxationInfoVM.h"

@interface WLMFillTaxationInfoVC ()

@property (nonatomic, assign) BOOL buttonEnable;
@property (nonatomic, strong) NSMutableDictionary *paramsDic;
@property (nonatomic, strong) WLMFillTaxationInfoVM *infoViewModel;
@end

@implementation WLMFillTaxationInfoVC

- (instancetype)initWithViewModel:(WLMFillTaxationInfoVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _infoViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写税务信息";
}

- (void)renderViews {
    [super renderViews];
    [self configFormInfo];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (void)configFormInfo {
    [self.form addSection:[self taxationInfoSection]];
}

- (WLFormSectionViewModel *)taxationInfoSection {
    
    WLFormSectionViewModel *section = nil;
    WLFormItemViewModel *row = nil;
    NSDictionary *dic = @{};
    
    section = [[WLFormSectionViewModel alloc] init];
    section.headerHeight = 58;
    section.headerTitle = @"税务信息";
    
    dic = @{kLeftKey:@"税控盘类型", @"leftButtonTitle":@"航信金税盘", @"rightButtonTitle":@"百望税控盘"};
    row = [self radioCellWithInfo:dic];
    row.hasTopSep = YES;
    [section addItem:row];
    
    dic = @{kLeftKey:@"税控盘号", kPlaceholder:@"请输入税控盘号"};
    row = [self textFieldCellWithInfo:dic];
    [section addItem:row];
    
    dic = @{kLeftKey:@"是否已至税务局开通电子发票业务", @"leftButtonTitle":@"未开通", @"rightButtonTitle":@"已开通"};
    row = [self radioCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    
    dic = @{kLeftKey:@"无税盘或者未开通电票业务？点击这里了解"};
    row = [self bottomTipButtonCellWithInfo:dic];
    row.hasBottomSep = NO;
    [section addItem:row];
    
    dic = @{kLeftKey:@"下一步"};
    row = [self bottomButtonCellWithInfo:dic];
    row.bottomSepLineMarginLeft = 0;
    [section addItem:row];
    return section;
}

- (WLFormItemViewModel *)radioCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormRadioCell"];
    row.itemHeight = 48.f;
    row.cellClass = [WLFormRadioCell class];
    row.value = info.mutableCopy;
    row.itemConfigBlock = ^(WLFormRadioCell *cell, id value, NSIndexPath *indexPath) {
        cell.radioInfo = info;
        value[kRightKey] = @0;
        cell.radioCellActionBlock = ^(NSNumber *isOk) {
            value[kRightKey] = isOk;
        };
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)textFieldCellWithInfo:(NSDictionary *)userInfo {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormTextInputCell"];
    row.itemHeight = 48.f;
    row.cellClass = [WLFormTextInputCell class];
    row.value = userInfo.mutableCopy;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormTextInputCell *cell, id value, NSIndexPath *indexPath) {
        @strongify(self);
        cell.leftlabel.text = value[kLeftKey];
        cell.rightField.text = value[kRightKey];
        cell.rightField.enabled = ![value[kDisableKey] boolValue];
        cell.rightField.placeholder = value[kPlaceholder];
        cell.textChangeBlock = ^(NSString *text) {
            @strongify(self);
            value[kRightKey] = text;
            text.length ? (self.buttonEnable = YES) : (self.buttonEnable = NO);
        };
    };
    row.requestParamsConfigBlock = ^(id value) {
        NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:1];
        ret[value[kLeftKey]] = value[kRightKey];
        return ret;
    };
    return row;
}

- (WLFormItemViewModel *)bottomTipButtonCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormBottomTipButtonCell"];
    row.cellClass = [WLFormBottomTipButtonCell class];
    row.itemHeight = 48.f;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormBottomTipButtonCell *cell, id value, NSIndexPath *indexPath) {
        @strongify(self);
        [cell.tipButton setTitle:info[kLeftKey] forState:UIControlStateNormal];
        [cell.tipButton whenTapped:^{
            @strongify(self);
             [self renderModal];
        }];
    };
    return row;
}

- (WLFormItemViewModel *)bottomButtonCellWithInfo:(NSDictionary *)info {
    WLFormItemViewModel *row = nil;
    row = [[WLFormItemViewModel alloc] initFormItemWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"WLFormBottomButtonCell"];
    row.cellClass = [WLFormBottomButtonCell class];
    row.itemHeight = 78.f;
    @weakify(self);
    row.itemConfigBlock = ^(WLFormBottomButtonCell *cell, id value, NSIndexPath *indexPath) {
        @strongify(self);
        RAC(cell.button, enabled) = RACObserve(self, buttonEnable);
        [cell.button setTitle:info[kLeftKey] forState:UIControlStateNormal];
        [cell.button whenTapped:^{
            @strongify(self);
            [self submitForm];
        }];
    };
    return row;
}

- (void)submitForm {
    NSDictionary *dic = [self.form validateItems];
    if (![dic[kValidateRetKey] boolValue]) {
        [self alertMsg:dic[kValidateMsgKey]];
    } else {
        NSDictionary *requestParams = [self.form fetchRequestParams];
        NSNumber *opened = requestParams[@"是否已至税务局开通电子发票业务"];
        if (![opened boolValue]) {
            WLTitleWithContentModal *view = [[WLTitleWithContentModal alloc] initWithTitle:@"友情提示" content:@"开通该业务后，须由财务或法人携带相关材料，至所属税务分局进行电子发票发行申请。如需帮助，请联系客户经理"];
            WLModal *modal = [[WLModal alloc] init];
            modal.buttonTitles = @[@"暂不开通", @"确认开通"];
            @weakify(self);
            [modal setOnButtonTouchUpInside:^(WLModal *modal, NSInteger buttonIndex) {
                @strongify(self);
                buttonIndex != 1 ?: [self formRequestWithParams:requestParams];
                [modal close];
            }];
            [modal addContentView:view];
            [modal show];
        } else {
            [self formRequestWithParams:requestParams];
        }
    }
}

- (void)formRequestWithParams:(NSDictionary *)params {
//    [[self.infoViewModel.submitFormCmd execute:params] subscribeNext:^(id  _Nullable x) {
//        WLMMoreTaxationInfoVC *VC = [[WLMMoreTaxationInfoVC alloc] initWithViewModel:self.infoViewModel.moreInfoViewModel];
//        [self.navigationController pushViewController:VC animated:YES];
//    }];
    WLMMoreTaxationInfoVC *VC = [[WLMMoreTaxationInfoVC alloc] initWithViewModel:self.infoViewModel.moreInfoViewModel];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)alertMsg:(NSString *)msg title:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *done = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:done];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)alertMsg:(NSString *)msg {
    [self alertMsg:nil title:msg];
}
    
- (void)renderModal {
    WLModal *modal = [[WLModal alloc] init];
    WLPurchaseInvoiceStepModal *view = [[WLPurchaseInvoiceStepModal alloc] init];
    view.closeModalActionBlock = ^{
        [modal close];
    };
    [modal addContentView:view];
    [modal show];
}

- (void)dealloc {
    NSLog(@"WLMFillTaxationInfoVC");
}

@end
