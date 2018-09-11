//
//  WLMEInvoiceIntroduceVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMEInvoiceIntroduceVC.h"
#import "WLMFillTaxationInfoVC.h"
#import "WLMEInvoiceIntroduceVM.h"

@interface WLMEInvoiceIntroduceVC ()

@property (nonatomic, strong) UIButton *bottomButton;
@property (nonatomic, strong) WLMEInvoiceIntroduceVM *introduceViewModel;
@end

@implementation WLMEInvoiceIntroduceVC

- (instancetype)initWithViewModel:(WLMEInvoiceIntroduceVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _introduceViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"电子发票介绍";
}

- (void)renderViews {
    [super renderViews];
    [self.view addSubview:self.bottomButton];
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (UIButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT - 48 - 64, SCREEN_WIDTH, 48);
        [_bottomButton setTitle:@"申请开通" forState:UIControlStateNormal];
        [_bottomButton setTitleColor:white_color forState:UIControlStateNormal];
        _bottomButton.titleLabel.font = H18;
        [_bottomButton createGradientButtonWithSize:_bottomButton.frame.size colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
        [_bottomButton whenTapped:^{
            WLMFillTaxationInfoVC *VC = [[WLMFillTaxationInfoVC alloc] initWithViewModel:self.introduceViewModel.taxaInfoViewModel];
            [self.navigationController pushViewController:VC animated:YES];
        }];
    }
    return _bottomButton;
}

@end
