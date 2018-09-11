//
//  WLTitleWithContentModal.m
//  WLModal
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLTitleWithContentModal.h"

static const CGFloat kMarginTop = 16.0f;
static const CGFloat kGap = 8.0f;
static const CGFloat kMarginBottom = 10.0f;

@interface WLTitleWithContentModal()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@end

@implementation WLTitleWithContentModal

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 272, 212);
        self.backgroundColor = white_color;
        _title = title;
        _content = content;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.titleLable];
    [self addSubview:self.contentLable];

    CGSize titleSize = [UILabel calculateLableSizeWithLableText:self.title font:HB14 maxWidth:200];
    CGSize contentSize = [UILabel calculateLableSizeWithLableText:self.content font:H14 lineSpace:4 maxWidth:240];

    self.titleLable.frame = CGRectMake(35, kMarginTop, 200, titleSize.height);
    self.contentLable.frame = CGRectMake(16, MaxY(self.titleLable) + kGap, 240, contentSize.height);

    self.frame = CGRectMake(0, 0, 270, MaxY(self.contentLable) + kMarginBottom);
    
    [self drawCornersWithCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(12, 12) viewRect:CGRectMake(0, 0, 270, MaxY(self.contentLable) + kMarginBottom)];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.text = self.title;
        _titleLable.textColor = textBlackColor;
        _titleLable.font = HB14;
        _titleLable.numberOfLines = 0;
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

- (UILabel *)contentLable {
    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.text = self.content;
        _contentLable.textColor = textDarkGrayColor;
        _contentLable.font = H14;
        _contentLable.numberOfLines = 0;
    }
    return _contentLable;
}
@end
