//
//  WLInvoiceQrModal.m
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLInvoiceQrModal.h"

@interface WLInvoiceQrModal()

@property (nonatomic, strong) UILabel *qrCode;
@property (nonatomic, strong) UIImageView *qrImage;
@end

@implementation WLInvoiceQrModal

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
    [self addSubview:self.qrCode];
    [self addSubview:self.qrImage];
    
    UIButton *cancleButton = [self createButtonWithTitle:@"取消绑定" titleColor:HexRGB(0x999999) borderColor:HexRGB(0xDEDEDE) rect:CGRectMake(16, 224, 116, 38)];
    [cancleButton whenTapped:^{
    
    }];
    [self addSubview:cancleButton];
    
    UIButton *bindButton = [self createButtonWithTitle:@"确认绑定" titleColor:HexRGB(0xFF4B4A) borderColor:HexRGB(0xFF4B4A) rect:CGRectMake(140, 224, 116, 38)];
    [bindButton whenTapped:^{
        
    }];
    [self addSubview:bindButton];
}

- (void)setQrCodeStr:(NSString *)qrCodeStr {
    _qrCodeStr = qrCodeStr;
    self.qrCode.text = qrCodeStr;
}

- (void)setImgUrl:(NSString *)imgUrl {
    _imgUrl = imgUrl;
    [self.qrImage sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil];
}

- (UILabel *)qrCode {
    if (!_qrCode) {
        _qrCode = [[UILabel alloc] init];
        _qrCode.frame = CGRectMake(0, 8, WIDTH(self), 16);
        _qrCode.textColor = HexRGB(0x434343);
        _qrCode.font = H12;
        _qrCode.textAlignment = NSTextAlignmentCenter;
    }
    return _qrCode;
}

- (UIImageView *)qrImage {
    if (!_qrImage) {
        _qrImage = [[UIImageView alloc] init];
        _qrImage.frame = CGRectMake(48, 32, 176, 176);
        _qrImage.backgroundColor = white_color;
    }
    return _qrImage;
}

- (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color borderColor:(UIColor *)borderColor rect:(CGRect)rect {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.layer.borderWidth = 1;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = H14;
    return button;
}

@end
