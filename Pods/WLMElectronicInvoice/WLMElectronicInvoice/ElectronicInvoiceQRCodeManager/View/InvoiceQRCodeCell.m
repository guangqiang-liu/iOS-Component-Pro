//
//  InvoiceQRCodeCell.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/17.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "InvoiceQRCodeCell.h"

@interface InvoiceQRCodeCell()

@property (nonatomic, strong) UILabel *invoiceId;
@property (nonatomic, strong) UIImageView *QRCodeImg;
@property (nonatomic, strong) UIButton *unbindBtn;
@property (nonatomic, strong) UIButton *saveBtn;

@end


@implementation InvoiceQRCodeCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 5;
        self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f); //[水平偏移, 垂直偏移]
        self.layer.shadowOpacity = 0.2f; // 0.0 ~ 1.0 的值
        self.layer.shadowRadius = 4.0f; // 阴影发散的程度
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.invoiceId];
    [self.contentView addSubview:self.QRCodeImg];
    [self.contentView addSubview:self.unbindBtn];
    [self.contentView addSubview:self.saveBtn];
}

- (UILabel *)invoiceId {
    if (!_invoiceId) {
        _invoiceId = [[UILabel alloc] init];
        _invoiceId.frame = CGRectMake(0, 16, 120, 16);
        _invoiceId.center = CGPointMake(self.contentView.frame.size.width / 2, 16);
        _invoiceId.textColor = HexRGB(0x434343);
        _invoiceId.font = SYS_FONT(12);
        _invoiceId.textAlignment = NSTextAlignmentCenter;
        _invoiceId.text = @"Y900 013 893";
    }
    return _invoiceId;
}

- (UIImageView *)QRCodeImg {
    if (!_QRCodeImg) {
        _QRCodeImg = [[UIImageView alloc] init];
        _QRCodeImg.frame = CGRectMake(8, 32, self.frame.size.width - 16, self.frame.size.width - 16);
        _QRCodeImg.backgroundColor = lightGray_color;
    }
    return _QRCodeImg;
}

- (UIButton *)unbindBtn {
    if (!_unbindBtn) {
        _unbindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _unbindBtn.frame = CGRectMake(16, self.frame.size.width + 24, 60, 24);
        _unbindBtn.titleLabel.font = SYS_FONT(14);
        [_unbindBtn setTitle:@"解绑" forState:UIControlStateNormal];
        [_unbindBtn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
        _unbindBtn.layer.cornerRadius = 4;
        _unbindBtn.layer.borderColor = HexRGB(0x999999).CGColor;
        _unbindBtn.layer.borderWidth = 0.5;
    }
    return _unbindBtn;
}

- (UIButton *)saveBtn {
    if (!_saveBtn) {
        _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveBtn.frame = CGRectMake(self.frame.size.width - 76, self.frame.size.width + 24, 60, 24);
        _saveBtn.titleLabel.font = SYS_FONT(14);
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [_saveBtn setTitleColor:HexRGB(0xFF4B4A) forState:UIControlStateNormal];
        _saveBtn.layer.cornerRadius = 4;
        _saveBtn.layer.borderColor = HexRGB(0xFF4B4A).CGColor;
        _saveBtn.layer.borderWidth = 0.5;
    }
    return _saveBtn;
}

@end

