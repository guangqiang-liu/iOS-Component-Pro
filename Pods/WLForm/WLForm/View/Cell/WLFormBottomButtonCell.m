//
//  WLFormBottomButtonCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormBottomButtonCell.h"
#import "UIButton+Gradient.h"

@interface WLFormBottomButtonCell()

@end

@implementation WLFormBottomButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = clear_color;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview: self.button];
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(15, 16, SCREEN_WIDTH - 30, 44);
        [_button setTitleColor:white_color forState:UIControlStateNormal];
        _button.titleLabel.font = H18;
        _button.layer.cornerRadius = 4;
        _button.layer.masksToBounds = YES;
        [_button createGradientButtonWithSize:CGSizeMake(SCREEN_WIDTH - 30, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
    }
    return _button;
}

@end
