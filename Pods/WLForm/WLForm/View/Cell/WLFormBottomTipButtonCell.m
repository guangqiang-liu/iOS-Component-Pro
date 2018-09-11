//
//  WLFormBottomTipButtonCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/15.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormBottomTipButtonCell.h"

@interface WLFormBottomTipButtonCell()
    
@end

@implementation WLFormBottomTipButtonCell
    
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.backgroundColor = clear_color;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.tipButton];
}

- (UIButton *)tipButton {
    if(!_tipButton) {
        _tipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tipButton.frame = CGRectMake(0, 0, SCREEN_WIDTH, 54);
        [_tipButton setTitle:@"button" forState:UIControlStateNormal];
        [_tipButton setTitleColor:textGrayColor forState:UIControlStateNormal];
        _tipButton.titleLabel.font = H12;
        [_tipButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
        [_tipButton setImage:[WLIcon iconWithName:@"tip_o" size:16 color:HexRGB(0xCFCFCF)] forState:UIControlStateNormal];
    }
    return _tipButton;
}
@end
