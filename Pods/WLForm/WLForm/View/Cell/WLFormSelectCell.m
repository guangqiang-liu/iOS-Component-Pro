//
//  WLFormSelectCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSelectCell.h"

@interface WLFormSelectCell()

@property (nonatomic, strong) UIImageView *arrowImg;
@end

@implementation WLFormSelectCell

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
    [self.contentView addSubview:self.arrowImg];
}

- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    self.rightLable.text = rightTitle;
    CGSize leftTitleSize = [UILabel calculateLableSizeWithLableText:rightTitle font:H14 maxWidth:200];
    self.leftLable.frame = CGRectMake(15, 0, WIDTH(self.contentView), HEIGHT(self.contentView));
    self.rightLable.frame = CGRectMake(leftTitleSize.width + 30, (48 - leftTitleSize.height) / 2, SCREEN_WIDTH - (leftTitleSize.width + 30 + 15 + 20), leftTitleSize.height);
}

- (UILabel *)leftLable {
    if (!_leftLable) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.textColor = HexRGB(0x999999);
        _leftLable.font = H14;
    }
    return _leftLable;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.frame = CGRectMake(SCREEN_WIDTH - (15 + 15), (48 - 15) / 2, 15, 15);
        _arrowImg.image = [WLIcon iconWithName:@"right_arrow_o" size:12 color:HexRGB(0xDEDEDE)];
    }
    return _arrowImg;
}

- (UILabel *)rightLable {
    if (!_rightLable) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.font = H14;
        _rightLable.textAlignment = NSTextAlignmentRight;
        _rightLable.textColor = textBlackColor;
    }
    return _rightLable;
}

@end
