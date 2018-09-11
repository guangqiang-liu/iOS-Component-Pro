//
//  WLFormSumTextInputCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSumTextInputCell.h"

@interface WLFormSumTextInputCell()

@property (nonatomic, strong) UILabel *unitLable;
@end

@implementation WLFormSumTextInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftLable];
    [self.contentView addSubview:self.unitLable];
    [self.contentView addSubview:self.rightInput];
}

- (void)textFieldDidChange:(UITextField *)field {
    !self.textChangeBlock ?: self.textChangeBlock(field.text);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize leftTitleSize = [self.leftLable sizeWithText:self.leftLable.text font:H14];
    self.leftLable.frame = CGRectMake(15, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.rightInput.frame = CGRectMake(leftTitleSize.width + 30, 10, SCREEN_WIDTH - (leftTitleSize.width + 30 + 15 + 20), self.contentView.frame.size.height - 2 * 10);
    self.unitLable.frame = CGRectMake(SCREEN_WIDTH - 30, 0, 15, self.contentView.frame.size.height);
}

- (void)setTextChangeBlock:(void (^)(NSString *))textChangeBlock {
    _textChangeBlock = [textChangeBlock copy];
    [_rightInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (UILabel *)leftLable {
    if (!_leftLable) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.textColor = textGrayColor;
        _leftLable.font = H14;
    }
    return _leftLable;
}

- (UILabel *)unitLable {
    if (!_unitLable) {
        _unitLable = [[UILabel alloc] init];
        _unitLable.text = @"元";
        _unitLable.textColor = textBlackColor;
        _unitLable.font = H14;
    }
    return _unitLable;
}

- (UITextField *)rightInput {
    if (!_rightInput) {
        _rightInput = [[UITextField alloc] init];
        _rightInput.textAlignment = NSTextAlignmentRight;
        _rightInput.textColor = HexRGB(0x434343);
        _rightInput.font = H14;
    }
    return _rightInput;
}
@end
