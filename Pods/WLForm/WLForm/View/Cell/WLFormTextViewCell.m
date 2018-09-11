//
//  WLFormTextViewCell.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/29.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormTextViewCell.h"

@interface WLFormTextViewCell()<UITextViewDelegate>

@end

@implementation WLFormTextViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftTitle];
    [self.contentView addSubview:self.textView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize leftTitleSize = [self.leftTitle sizeWithText:self.leftTitle.text font:H14];
    self.leftTitle.frame = CGRectMake(15, 0, leftTitleSize.width, HEIGHT(self.contentView));
    self.textView.frame = CGRectMake(leftTitleSize.width + 30, 5, SCREEN_WIDTH - (leftTitleSize.width + 30 + 15), HEIGHT(self.contentView) -10);
}

- (void)setTextChangeBlock:(void (^)(NSString *))textChangeBlock {
    _textChangeBlock = [textChangeBlock copy];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self contentSizeToFit];
}

- (void)textViewDidChange:(UITextView *)textView {
    !self.textChangeBlock ?: self.textChangeBlock(textView.text);
}

- (void)contentSizeToFit {
    CGSize contentSize = self.textView.contentSize;
    UIEdgeInsets offset;
    CGSize newSize = contentSize;
    if(contentSize.height <= self.textView.frame.size.height) {
        CGFloat offsetY = (self.textView.frame.size.height - contentSize.height) / 2;
        offset = UIEdgeInsetsMake(offsetY, 0, 0, 0);
    } else {
        newSize = self.textView.frame.size;
        offset = UIEdgeInsetsZero;
        while (contentSize.height > self.textView.frame.size.height) {
            contentSize = self.textView.contentSize;
        }
        newSize = contentSize;
    }
    [self.textView setContentSize:newSize];
    [self.textView setContentInset:offset];
}

- (UILabel *)leftTitle {
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.textColor = textGrayColor;
        _leftTitle.font = H14;
    }
    return _leftTitle;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.textColor = textBlackColor;
        _textView.font = H14;
        _textView.textAlignment = NSTextAlignmentRight;
        _textView.delegate = self;
    }
    return _textView;
}
@end
