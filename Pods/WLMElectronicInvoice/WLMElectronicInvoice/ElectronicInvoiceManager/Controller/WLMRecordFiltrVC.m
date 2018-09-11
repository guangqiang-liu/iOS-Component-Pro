//
//  WLMRecordFiltrVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMRecordFiltrVC.h"
#import "WLMRecordListCell.h"
#import "WLMEInvoiceFilterView.h"
#import "WLMRecordSearchVC.h"

@interface WLMRecordFiltrVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) WLMEInvoiceFilterView *filterView;
@property (nonatomic, strong) UIButton *filterBtn;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, assign) NSInteger selectedState;
@end

@implementation WLMRecordFiltrVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开票记录";
    [self setNavigationItemRightBarButtonItemsWithLeftSel:@selector(filterAction) leftTitle:@"筛选" leftTitleColor:textGrayColor rightSel:@selector(searchAction) rightImage:[WLIcon iconWithName:@"search_gray_o" size:17 color:textGrayColor]];
}

- (void)renderViews {
    [super renderViews];
    [self dataInitialize];
    [self setupTableView];
}

- (void)dataInitialize {
    self.dataArray = @[@"1", @"2", @"3", @"4"];
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
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.model = nil;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)filterAction {
    if (!self.filterView.isShowing) {
        [self.filterView show];
    } else {
        [self.filterView dismiss];
    }
}

- (void)searchAction {
    WLMRecordSearchVC *vc = [[WLMRecordSearchVC alloc] init];
    vc.invoiceRecordSearchBlock = ^(NSString *search) {
        NSLog(@"%@", search);
    };
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter

- (UITableView *)tableView {
    if (_tableView == nil) {
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _tableView.backgroundColor = bgColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (WLMEInvoiceFilterView *)filterView {
    if (_filterView == nil) {
        _filterView = [[WLMEInvoiceFilterView alloc] init];
        @weakify(self);
        _filterView.clickedItemCallback = ^(NSInteger state) {
            @strongify(self);
            self.selectedState = state;
//            [self loadDataForMore:NO finish:nil];
        };
    }
    return _filterView;
}

@end
