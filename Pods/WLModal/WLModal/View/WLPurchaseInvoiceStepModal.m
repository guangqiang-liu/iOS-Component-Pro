//
//  WLPurchaseInvoiceStepModal.m
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLPurchaseInvoiceStepModal.h"

@interface WLPurchaseInvoiceStepModal()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *remarkLable;
@property (nonatomic, strong) UIButton *button;
@end

@implementation WLPurchaseInvoiceStepModal

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 272, 367);
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 5;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.titleLable];
    [self addSubview:[self createContentLableWithText:@"携带税务登记证件、税控系统IC卡、经办人身份证、公章等材料前往就 近百望或航信服务站购买设备。" rect:CGRectMake(41, 60, 214, 63)]];
    [self addSubview:[self createContentLableWithText:@"至所属税务分局进行电子发票发行申请。" rect:CGRectMake(41, 139, 214, 42)]];
    [self addSubview:[self createContentLableWithText:@"领取空白电子发票。" rect:CGRectMake(41, 197, 214, 42)]];
    [self addSubview:self.remarkLable];
    [self addSubview:self.button];
    
    [self addSubview:[self createStepLableWithText:@"1" origin:CGPointMake(16, 58)]];
    [self addSubview:[self createStepLableWithText:@"2" origin:CGPointMake(16, 138)]];
    [self addSubview:[self createStepLableWithText:@"3" origin:CGPointMake(16, 195)]];
    
    [self addSubview:[self createLineViewWithRect:CGRectMake(24, 84, 1, 50)]];
    [self addSubview:[self createLineViewWithRect:CGRectMake(24, 164,1, 26)]];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(0, 24, WIDTH(self), 20);
        _titleLable.text = @"购买税盘及电票业务办理";
        _titleLable.font = H16;
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = HexRGB(0x434343);
    }
    return _titleLable;
}

- (UILabel *)remarkLable {
    if (!_remarkLable) {
        _remarkLable = [[UILabel alloc] init];
        _remarkLable.frame = CGRectMake(16, 239, 240, 36);
        _remarkLable.textColor = HexRGB(0x999999);
        _remarkLable.font = H12;
        _remarkLable.numberOfLines = 0;
        _remarkLable.text = @"备注：以上材料为通常税务部门所需，如税务部门有新要求或新规定应以税务部门为准。";
        [_remarkLable sizeToFit];
    }
    return _remarkLable;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(73, 299, 128, 44);
        [_button setTitle:@"我知道了" forState:UIControlStateNormal];
        [_button setTitleColor:white_color forState:UIControlStateNormal];
        _button.titleLabel.font = H16;
        _button.layer.cornerRadius = 22;
        _button.layer.masksToBounds = YES;
        [_button createGradientButtonWithSize:CGSizeMake(128, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:(GradientFromLeftToRight)];
        [_button whenTapped:^{
            !self.closeModalActionBlock ?: self.closeModalActionBlock();
        }];
    }
    return _button;
}

- (UILabel *)createContentLableWithText:(NSString *)text rect:(CGRect)rect {
    UILabel *contentLable = [[UILabel alloc] init];
    contentLable.frame = rect;
    contentLable.textColor = HexRGB(0x666666);
    contentLable.font = H14;
    contentLable.numberOfLines = 0;
    contentLable.text = text;
    [contentLable sizeToFit];
    return contentLable;
}

- (UILabel *)createStepLableWithText:(NSString *)text origin:(CGPoint)point {
    UILabel *numLable = [[UILabel alloc] init];
    numLable.text = text;
    numLable.frame = CGRectMake(point.x, point.y, 18, 18);
    numLable.layer.cornerRadius = 9;
    numLable.layer.masksToBounds = YES;
    numLable.backgroundColor = HexRGB(0xFF4B4A);
    numLable.textAlignment = NSTextAlignmentCenter;
    numLable.textColor = white_color;
    return numLable;
}

- (UIView *)createLineViewWithRect:(CGRect)rect {
    UIView *line = [[UIView alloc] init];
    line.frame = rect;
    line.backgroundColor = sepLineColor;
    return line;
}

@end
