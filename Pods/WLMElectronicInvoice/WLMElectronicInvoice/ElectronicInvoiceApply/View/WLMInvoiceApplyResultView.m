//
//  WLMInvoiceApplyResultView.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/9.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceApplyResultView.h"
#import "WLMInvoiceResultModel.h"
#import "WLMInvoiceResultVM.h"

@interface WLMInvoiceApplyResultView()

@property (nonatomic, strong) UIImageView *stateImage;
@property (nonatomic, strong) UIImageView *shadowImage;
@property (nonatomic, strong) UILabel *stateLable;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) WLMInvoiceResultVM *resultViewModel;
@end

@implementation WLMInvoiceApplyResultView

- (instancetype)initWithViewModel:(WLMInvoiceResultVM *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _resultViewModel = viewModel;
    }
    return self;
}

- (void)renderViews {
    [super renderViews];
    self.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [self addSubview:self.stateImage];
    [self addSubview:self.shadowImage];
    [self addSubview:self.stateLable];
    [self addSubview:self.contentLable];
    [self addSubview:self.button];
    
    [self.stateImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(40);
        make.width.height.mas_equalTo(55);
    }];
    
    [self.shadowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.stateImage.mas_bottom).offset(10);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(4);
    }];
    
    [self.stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.equalTo(self).offset(-16);
        make.top.equalTo(self.shadowImage.mas_bottom).offset(10);
    }];
    
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.equalTo(self).offset(-16);
        make.top.equalTo(self.stateLable.mas_bottom).offset(10);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.equalTo(self).offset(-16);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.contentLable.mas_bottom).offset(32);
    }];
}

- (void)bindViewModel {
    [super bindViewModel];
    [[[self.resultViewModel.resultInfoCmd execute:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(WLMInvoiceResultModel *model) {
        self.stateLable.text = model.stateTitle;
        self.contentLable.text = model.content;
        [self.button setTitle:model.buttonTitle forState:UIControlStateNormal];
    }];
}

- (UIImageView *)stateImage {
    if (!_stateImage) {
        _stateImage = [[UIImageView alloc] init];
        _stateImage.image = UIImageName(@"invoice_apply_success");
    }
    return _stateImage;
}

- (UIImageView *)shadowImage {
    if (!_shadowImage) {
        _shadowImage = [[UIImageView alloc] init];
        _shadowImage.image = UIImageName(@"invoice_apply_shadow");
    }
    return _shadowImage;
}

- (UILabel *)stateLable {
    if (!_stateLable) {
        _stateLable = [[UILabel alloc] init];
        _stateLable.textColor = textBlackColor;
        _stateLable.font = HB16;
        _stateLable.text = @"申请成功";
        _stateLable.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLable;
}

- (UILabel *)contentLable {
    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.textColor = textGrayColor;
        _contentLable.font = H14;
        _contentLable.text = @"申请完成后，电票业务不会立即生效，我们会尽快派专人协助您上线电子发票功能。";
        _contentLable.numberOfLines = 0;
        _contentLable.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLable;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:white_color forState:UIControlStateNormal];
        _button.titleLabel.font = H18;
        _button.layer.cornerRadius = 4;
        _button.layer.masksToBounds = YES;
        [_button setTitle:@"返回发现页" forState:UIControlStateNormal];
        [_button createGradientButtonWithSize:CGSizeMake(SCREEN_WIDTH - 30, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
    }
    return _button;
}

@end
