//
//  WLMRecordListVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMRecordListVC.h"
#import "WLMRecordListCell.h"
#import "WLMInvoiceRecprdFooterView.h"
#import "WLMRecordFiltrVC.h"
#import "WLMRequirementListVC.h"
#import "WLMRecordFiltrVC.h"

#define SCREEN_IS_X (SCREEN_HEIGHT == 812.0)
#define MAIN_NAV_HEIGHT (SCREEN_IS_X ? 88 : 64)

@interface WLMRecordListVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) WLMInvoiceRecprdFooterView *listFooterView;
@end

@implementation WLMRecordListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = white_color;
    [self setupViews];
}

- (void)setupViews {
    [self dataInitialize];
    [self setupTableView];
}

- (void)dataInitialize {
    self.dataArray = @[@"1", @"2", @"3"];
}

- (void)setupTableView {
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WLMRecordListCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"WLMRecordListCell";
    WLMRecordListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[WLMRecordListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = nil;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - getter\setter
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - MAIN_NAV_HEIGHT - 44) style:UITableViewStylePlain];
        _tableView.backgroundColor = bgColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.listFooterView;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (WLMInvoiceRecprdFooterView *)listFooterView {
    if (_listFooterView == nil) {
        _listFooterView = [[WLMInvoiceRecprdFooterView alloc] init];
        @weakify(self);
        _listFooterView.footerButtonCallback = ^{
            @strongify(self);
            UIViewController *currentVC = [self.view getCurrentViewController];
            WLMRecordFiltrVC *vc = [[WLMRecordFiltrVC alloc] init];
            [currentVC.navigationController pushViewController:vc animated:YES];
        };
    }
    return _listFooterView;
}

@end

