//
//  WLFormTextInputCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormTextInputCell.h"

@implementation WLFormTextInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftlabel];
    [self.contentView addSubview:self.rightField];
}

- (void)textFieldDidChange:(UITextField *)field {
    !self.textChangeBlock ?: self.textChangeBlock(field.text);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize leftTitleSize = [self.leftlabel sizeWithText:self.leftlabel.text font:H14];
    self.leftlabel.frame = CGRectMake(15, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.rightField.frame = CGRectMake(leftTitleSize.width + 30, 10, SCREEN_WIDTH - (leftTitleSize.width + 30 + 15), self.contentView.frame.size.height - 2 * 10);
}

- (void)setTextChangeBlock:(void (^)(NSString *))textChangeBlock {
    _textChangeBlock = [textChangeBlock copy];
    [_rightField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (UILabel *)leftlabel {
    if (!_leftlabel) {
        _leftlabel = [[UILabel alloc] init];
        _leftlabel.font = H14;
        _leftlabel.textColor = HexRGB(0x999999);
    }
    return _leftlabel;
}

- (UITextField *)rightField {
    if (!_rightField) {
        _rightField = [[UITextField alloc] init];
        _rightField.textAlignment = NSTextAlignmentRight;
        _rightField.textColor = HexRGB(0x434343);
        _rightField.font = H14;
    }
    return _rightField;
}
@end
