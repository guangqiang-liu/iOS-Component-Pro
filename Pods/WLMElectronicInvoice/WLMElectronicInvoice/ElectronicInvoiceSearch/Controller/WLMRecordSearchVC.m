//
//  WLMRecordSearchVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMRecordSearchVC.h"
#import "ImageTextField.h"
#import "WLMInvoiceRecordModel.h"
#import "WLMRecordListCell.h"

@interface WLMRecordSearchVC ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) ImageTextField *textfield;
@end

@implementation WLMRecordSearchVC

#pragma mark - init
- (instancetype)initWithViewModel:(WLBaseViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
    }
    return self;
}

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self setNavigationItemRightBarButtonItem:@selector(cancelClicked) withTitle:@"取消" withTitleColor:textGrayColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self.textfield resignFirstResponder];
    [self.textfield removeFromSuperview];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupViews];
}

#pragma mark - private methods
- (void)renderViews {
    [super renderViews];
    [self.view addSubview:self.tableView];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        WLMInvoiceRecordModel *model = [[WLMInvoiceRecordModel alloc] init];
        model.invoiceAmount = @"99";
        model.companyName = @"xxxx";
        model.invoiceDate = @"2018-09-11";
        model.invoiceState = @"0";
        [tempArr addObject:model];
    }
    self.dataArray = tempArr;
    [self.tableView reloadData];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (void)setupViews {
    [self.navigationController.navigationBar addSubview:self.textfield];
}

#pragma mark - event response
- (void)cancelClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *searchString = [NSString stringWithFormat:@"%@%@", textField.text, string];
    if (searchString.length >= 5) {
        return NO;
    }
    return YES;
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (WLMRecordListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    WLMRecordListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WLMRecordListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - getter\setter
- (ImageTextField *)textfield {
    if (!_textfield) {
        _textfield = [[ImageTextField alloc] initWithFrame:CGRectMake(15, 6, SCREEN_WIDTH - 70, 30) leftImage:[WLIcon iconWithName:@"search_gray_o" size:17 color:textGrayColor] imageSize:CGSizeMake(17, 17)];
        _textfield.placeholder = @"输入抬头名称、邮箱地址、手机号搜索";
        _textfield.delegate = self;
        [_textfield becomeFirstResponder];
    }
    return _textfield;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _tableView.backgroundColor = bgColor;
        _tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 48;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
