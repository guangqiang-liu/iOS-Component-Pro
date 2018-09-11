//
//  WLMSelectApplyMerchantVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMSelectApplyMerchantVC.h"
#import "WLMSelectApplyMerchantCell.h"
#import "WLMEInvoiceIntroduceVC.h"
#import "WLMEInvoiceIntroduceVM.h"
#import "WLMSelectedApplyMerchantVM.h"
#import "WLMSelectedApplyMerchantModel.h"
#import "WLMResendInvoiceVC.h"
#import "WLMInvoiceManagerListVC.h"
#import "WLMInvoiceDetailVC.h"
#import "WLMMoreTaxationInfoVC.h"
#import "WLMEInvoiceProtocolVC.h"
#import "WLMRecordFiltrVC.h"

@interface WLMSelectApplyMerchantVC()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WLMSelectedApplyMerchantVM *merchantViewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation WLMSelectApplyMerchantVC

#pragma mark - init
- (instancetype)initWithViewModel:(WLMSelectedApplyMerchantVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _merchantViewModel = viewModel;
    }
    return self;
}

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"请选择申请开通门店";
    [self setNavigationItemRightBarButtonItem:@selector(xx) withTitle:@"提交" withTitleColor:red_color];
}

- (void)xx {
    WLMMoreTaxationInfoVC *VC = [[WLMMoreTaxationInfoVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - public method
- (void)renderViews {
    [super renderViews];
    [self.view addSubview:self.tableView];
//    [self setNavigationItemRightBarButtonItem:@selector(testAction) withTitle:@"电票管理" withTitleColor:red_color];
}

- (void)bindViewModel {
    [super bindViewModel];
    [[[self.merchantViewModel.merchantListCmd execute:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSArray *modelArr) {
        self.dataArray = modelArr;
        [self.tableView reloadData];
    }];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (WLMSelectApplyMerchantCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    WLMSelectApplyMerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WLMSelectApplyMerchantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    WLMEInvoiceIntroduceVC *VC = [[WLMEInvoiceIntroduceVC alloc] initWithViewModel:self.merchantViewModel.introduceViewModel];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - getter\setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView.backgroundColor = bgColor;
        _tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 70;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma private method
- (void)testAction {
//    WLMInvoiceManagerListVC *VC = [[WLMInvoiceManagerListVC alloc] init];
    WLMInvoiceDetailVC *VC = [[WLMInvoiceDetailVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
