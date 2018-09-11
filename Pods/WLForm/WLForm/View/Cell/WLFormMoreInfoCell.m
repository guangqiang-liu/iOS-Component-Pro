//
//  WLFormMoreInfoCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormMoreInfoCell.h"

@interface WLFormMoreInfoCell()

@property (nonatomic, strong) UIView *sepLine;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, assign) BOOL isSpread;
@end

@implementation WLFormMoreInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.isSpread = NO;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.sepLine];
    [self.contentView addSubview:self.leftTitle];
    [self.contentView addSubview:self.rightButton];
}

- (void)foldClick {
    self.isSpread =! self.isSpread;
    [self.rightButton setImage:self.isSpread ? [WLIcon iconWithName:@"arrow_up_o" size:15 color:HexRGB(0x999999)] : [WLIcon iconWithName:@"arrow_down_o" size:15 color:HexRGB(0x999999)] forState:UIControlStateNormal];
    if (self.moreInfoBlock) {
        self.moreInfoBlock();
    }
}

- (UIView *)sepLine {
    if (!_sepLine) {
        _sepLine = [[UIView alloc] init];
        _sepLine.frame = CGRectMake(0, 0, SCREEN_WIDTH, 10);
        _sepLine.backgroundColor = sepLineColor;
    }
    return _sepLine;
}

- (UILabel *)leftTitle {
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc] init];
        CGSize titleSize = [_leftTitle sizeWithText:@"更多信息（选填）" font:H14];
        _leftTitle.frame = CGRectMake(15, (54 - titleSize.height) / 2 + 5, SCREEN_WIDTH, titleSize.height);
        _leftTitle.textColor = HexRGB(0x434343);
        _leftTitle.font = H14;
        [_leftTitle whenTapped:^{
            [self foldClick];
        }];
    }
    return _leftTitle;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(SCREEN_WIDTH - 40, (54 - 20) / 2 + 5, 30, 20);
        [_rightButton setImage:[WLIcon iconWithName:@"arrow_up_o" size:15 color:HexRGB(0x999999)] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(foldClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
