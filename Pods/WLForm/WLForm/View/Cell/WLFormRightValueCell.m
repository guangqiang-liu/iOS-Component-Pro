//
//  WLFormRightValueCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/28.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormRightValueCell.h"

@interface WLFormRightValueCell()

@property (nonatomic, strong) UILabel *rightLable;
@end

@implementation WLFormRightValueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftLable];
    [self.contentView addSubview:self.rightLable];
}

- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    self.rightLable.text = rightTitle;
    CGSize leftTitleSize = [UILabel calculateLableSizeWithLableText:self.leftLable.text font:H14 maxWidth:200];
    self.leftLable.frame = CGRectMake(15, 0, WIDTH(self.contentView), HEIGHT(self.contentView));
    self.rightLable.frame = CGRectMake(leftTitleSize.width + 30, (48 - leftTitleSize.height) / 2, SCREEN_WIDTH - (leftTitleSize.width + 30 + 15), leftTitleSize.height);
}

- (UILabel *)leftLable {
    if (!_leftLable) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.textColor = HexRGB(0x999999);
        _leftLable.font = H14;
    }
    return _leftLable;
}

- (UILabel *)rightLable {
    if (!_rightLable) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.text = @"1090252020000000000";
        _rightLable.font = H14;
        _rightLable.textAlignment = NSTextAlignmentRight;
        _rightLable.textColor = textBlackColor;
    }
    return _rightLable;
}
@end
