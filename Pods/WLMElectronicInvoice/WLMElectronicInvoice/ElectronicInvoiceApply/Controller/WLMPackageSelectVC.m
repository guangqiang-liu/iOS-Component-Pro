//
//  WLMPackageSelectVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/9.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMPackageSelectVC.h"
#import "WLMPackageSelectView.h"
#import "WLMInvoiceApplyResultVC.h"
#import "WLMPackageSelectVM.h"

@interface WLMPackageSelectVC ()

@property (nonatomic, strong) WLMPackageSelectView *packageView;
@property (nonatomic, strong) WLMPackageSelectVM *packageViewModel;
@end

@implementation WLMPackageSelectVC

- (instancetype)initWithViewModel:(WLMPackageSelectVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _packageViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"套餐选择";
}

- (void)renderViews {
    [super renderViews];
     [self.view addSubview:self.packageView];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (WLMPackageSelectView *)packageView {
    if (!_packageView) {
        _packageView = [[WLMPackageSelectView alloc] initWithViewModel:self.packageViewModel];
        @weakify(self);
        _packageView.packageSelectBlock = ^(NSNumber * packageType) {
            @strongify(self);
            [[[self.packageViewModel.submitCmd execute:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id  _Nullable x) {
                WLMInvoiceApplyResultVC *VC = [[WLMInvoiceApplyResultVC alloc] initWithViewModel:self.packageViewModel.resultViewModel];
                [self.navigationController pushViewController:VC animated:YES];
            }];
        };
    }
    return _packageView;
}

@end
