//
//  WLFormBottomTipCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormBottomTipCell.h"

@interface WLFormBottomTipCell()

@property (nonatomic, strong) UILabel *tipLable;

@end

@implementation WLFormBottomTipCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = clear_color;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.tipLable];
}

- (void)setTipStr:(NSString *)tipStr {
    _tipStr = tipStr;
    self.tipLable.text = tipStr;
    CGSize tipSize = [UILabel calculateLableSizeWithLableText:tipStr font:H12 maxWidth:SCREEN_WIDTH - 40];
    self.tipLable.frame = CGRectMake(20, 0, SCREEN_WIDTH - 40, tipSize.height + 32);
}

- (UILabel *)tipLable {
    if (!_tipLable) {
        _tipLable = [[UILabel alloc] init];
        _tipLable.frame = CGRectMake(20, 0, SCREEN_WIDTH - 40, HEIGHT(self.contentView));
        _tipLable.textColor = HexRGB(0x999999);
        _tipLable.font = H12;
        _tipLable.numberOfLines = 2;
        _tipLable.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLable;
}

@end
