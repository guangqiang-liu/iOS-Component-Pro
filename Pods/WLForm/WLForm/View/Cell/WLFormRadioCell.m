//
//  WLFormRadioCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormRadioCell.h"
#import "WLForm.h"

@interface WLFormRadioCell()

@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation WLFormRadioCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = white_color;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftTitle];
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightButton];
}

- (void)setRadioInfo:(NSDictionary *)radioInfo {
    _radioInfo = radioInfo;
    self.leftTitle.text = radioInfo[kLeftKey];
    self.leftTitle.frame = CGRectMake(15, 0, 135, 48);
    
    NSString *rightButtonTitle = radioInfo[@"rightButtonTitle"];
    CGSize rightButtonSize = [self.rightButton sizeWithText:rightButtonTitle font:H14];
    [self.rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH - 15 - rightButtonSize.width - 24, (48 - 16) / 2 , rightButtonSize.width + 30, 16);
    
    NSString *leftButtonTitle = radioInfo[@"leftButtonTitle"];
    CGSize leftButtonSize = [self.leftButton sizeWithText:leftButtonTitle font:H14];
    [self.leftButton setTitle:leftButtonTitle forState:UIControlStateNormal];
    self.leftButton.frame = CGRectMake(MinX(self.rightButton) - (leftButtonSize.width + 24 + 15), (48 - 16) / 2, leftButtonSize.width + 30, 16);
}

- (void)leftButtonClick:(UIButton *)button {
    [self.leftButton setImage:[WLIcon iconWithName:@"selected_cycyle_o" size:16 color:HexRGB(0xF94B4A)] forState:UIControlStateNormal];
    [self.rightButton setImage:[WLIcon iconWithName:@"unselected_cycyle_o" size:16 color:HexRGB(0xDEDEDE)] forState:UIControlStateNormal];
    !self.radioCellActionBlock ?: self.radioCellActionBlock(@0);
}

- (void)rightButtonClick:(UIButton *)button {
    [self.leftButton setImage:[WLIcon iconWithName:@"unselected_cycyle_o" size:16 color:HexRGB(0xDEDEDE)] forState:UIControlStateNormal];
    [self.rightButton setImage:[WLIcon iconWithName:@"selected_cycyle_o" size:16 color:HexRGB(0xF94B4A)] forState:UIControlStateNormal];
    !self.radioCellActionBlock ?: self.radioCellActionBlock(@1);
}

- (UILabel *)leftTitle {
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.textColor = HexRGB(0x999999);
        _leftTitle.font = H14;
        _leftTitle.numberOfLines = 2;
    }
    return _leftTitle;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
        _leftButton.titleLabel.font = H14;
        [_leftButton setImage:[WLIcon iconWithName:@"selected_cycyle_o" size:16 color:HexRGB(0xF94B4A)] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:8];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
        _rightButton.titleLabel.font = H14;
        [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:[WLIcon iconWithName:@"unselected_cycyle_o" size:16 color:HexRGB(0xDEDEDE)] forState:UIControlStateNormal];
        [_rightButton layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:8];
    }
    return _rightButton;
}

@end
