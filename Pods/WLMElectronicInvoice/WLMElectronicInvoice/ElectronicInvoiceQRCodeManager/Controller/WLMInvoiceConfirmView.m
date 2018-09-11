//
//  WLMInvoiceConfirmView.m
//  WLMElectronicInvoice
//
//  Created by Saturday on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceConfirmView.h"

@interface WLMInvoiceConfirmView()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *qrImage;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *submitBtn;

@end


@implementation WLMInvoiceConfirmView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 272, 278);
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 4;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.titleLable];
    [self addSubview:self.qrImage];
    [self addSubview:self.cancelBtn];
    [self addSubview:self.submitBtn];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(0, 8, WIDTH(self), 20);
        _titleLable.text = @"Y900 013 893";
        _titleLable.font = SYS_FONT(12);
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = HexRGB(0x434343);
    }
    return _titleLable;
}

- (UIImageView *)qrImage {
    if (!_qrImage) {
        _qrImage = [[UIImageView alloc] init];
        _qrImage.frame = CGRectMake((WIDTH(self) - 176) / 2, 32, 176, 176);
        _qrImage.backgroundColor = lightGray_color;
    }
    return _qrImage;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(16, 226, WIDTH(self) / 2 - 20, 38);
        [_cancelBtn setTitle:@"取消绑定" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = SYS_FONT(14);
        _cancelBtn.layer.cornerRadius = 4;
        _cancelBtn.layer.masksToBounds = YES;
        _cancelBtn.layer.borderColor = HexRGB(0x999999).CGColor;
        _cancelBtn.layer.borderWidth = 0.5;
        [_cancelBtn whenTapped:^{
            !self.invoiceConfirmBlock ?: self.invoiceConfirmBlock(@"1");
        }];
    }
    return _cancelBtn;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(WIDTH(self) / 2 + 4, 226, WIDTH(self) / 2 - 20, 38);
        [_submitBtn setTitle:@"确认绑定" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:HexRGB(0xFF4B4A) forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = SYS_FONT(14);
        _submitBtn.layer.cornerRadius = 4;
        _submitBtn.layer.masksToBounds = YES;
        _submitBtn.layer.borderColor = HexRGB(0xFF4B4A).CGColor;
        _submitBtn.layer.borderWidth = 0.5;
        [_submitBtn whenTapped:^{
            !self.invoiceConfirmBlock ?: self.invoiceConfirmBlock(@"2");
        }];
    }
    return _submitBtn;
}

@end
