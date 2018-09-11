//
//  WLAlertModal.m
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLAlertModal.h"

@interface WLAlertModal()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *contentLable;
@end

@implementation WLAlertModal

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 272, 212);
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 5;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.titleLable];
    [self addSubview:self.contentLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.left.mas_equalTo(35);
        make.right.equalTo(self).offset(-35);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self.titleLable.mas_bottom).offset(8);
    }];
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
}

//- (void)updateConstraints {
//    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(20);
//        make.left.mas_equalTo(35);
//        make.right.equalTo(self).offset(-35);
//        make.centerX.equalTo(self.mas_centerX);
//    }];
//    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(16);
//        make.right.equalTo(self.mas_right).offset(-16);
//        make.top.equalTo(self.titleLable.mas_bottom).offset(10);
//    }];
//
//    [super updateConstraints];
//}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLable.text = title;
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.contentLable.text = content;
    if (!self.title) {
        [self.contentLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.right.equalTo(self.mas_right).offset(-16);
            make.top.equalTo(self.titleLable.mas_bottom).offset(0);
        }];
    }
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = textBlackColor;
        _titleLable.font = H16;
        _titleLable.numberOfLines = 2;
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.backgroundColor = red_color;
    }
    return _titleLable;
}

- (UILabel *)contentLable {
    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.textColor = textDarkGrayColor;
        _contentLable.font = H14;
        _contentLable.numberOfLines = 0;
        _contentLable.backgroundColor = magenta_color;
    }
    return _contentLable;
}

@end
