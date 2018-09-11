//
//  WLTitleModal.m
//  WLModal
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLTitleModal.h"

static const CGFloat kMarginTop = 20.0f;
static const CGFloat kMarginBottom = 20.0f;

@interface WLTitleModal()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, copy) NSString *title;
@end

@implementation WLTitleModal

- (instancetype)initWithTitle:(NSString *)title font:(UIFont *)font {
    self = [super init];
    if (self) {
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 5;
        CGSize titleSize = [UILabel calculateLableSizeWithLableText:title font:font lineSpace:5 maxWidth:200];
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(35, 20, 200, titleSize.height);
        titleLable.text = title;
        titleLable.textColor = textBlackColor;
        titleLable.font = font;
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentCenter;

        [self addSubview:titleLable];
        self.frame = CGRectMake(0, 0, 270, kMarginTop + titleSize.height + kMarginBottom);
    }
    return self;
}

@end
