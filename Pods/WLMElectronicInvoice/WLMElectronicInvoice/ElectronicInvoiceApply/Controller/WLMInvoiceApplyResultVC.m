//
//  WLMInvoiceApplyResultVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/9.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceApplyResultVC.h"
#import "WLMInvoiceApplyResultView.h"
#import "WLMOpenInvoiceVC.h"
#import "WLMInvoiceResultModel.h"
#import "WLMInvoiceResultVM.h"
#import "WLMInvoiceManagerListVC.h"

@interface WLMInvoiceApplyResultVC ()

@property (nonatomic, strong) WLMInvoiceApplyResultView *resultView;
@property (nonatomic, strong) WLMInvoiceResultVM *resutViewModel;
@end

@implementation WLMInvoiceApplyResultVC

- (instancetype)initWithViewModel:(WLMInvoiceResultVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _resutViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)renderViews {
    [super renderViews];
    [self.view addSubview:self.resultView];
}

- (void)bindViewModel {
    [super bindViewModel];
    RAC(self, title) = RACObserve(self.resutViewModel, title);
}

- (WLMInvoiceApplyResultView *)resultView {
    if (!_resultView) {
        _resultView = [[WLMInvoiceApplyResultView alloc] initWithViewModel:self.resutViewModel];
        @weakify(self);
        [_resultView.button whenTapped:^{
            @strongify(self);
            WLMOpenInvoiceVC *VC = [[WLMOpenInvoiceVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }];
    }
    return _resultView;
}

- (void)dealloc {
    NSLog(@"WLMInvoiceApplyResultVC");
}

@end
