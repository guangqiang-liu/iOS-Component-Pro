//
//  UILabel+WLLineSpace.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UILabel+WLLineSpace.h"

@implementation UILabel (WLLineSpace)

- (void)setLineSpaceWithText:(NSString *)text space:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}
    
- (void)setWordSpaceWithText:(NSString *)text space:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}
    
- (void)setSpaceWithText:(NSString *)text lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)setSpecificTextWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font {
    if (text) {
        NSMutableAttributedString *editPriceStr = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSRange range = [self.text rangeOfString:text];
        if (color) {
            [editPriceStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(range.location, range.length)];
        }
        if (font != 0) {
            [editPriceStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(range.location, range.length)];
        }
        self.attributedText = editPriceStr;
    }
}
    
- (void)setSpecificTextWithLocation:(NSInteger)location length:(NSInteger)length color:(UIColor *)color font:(UIFont *)font {
    NSMutableAttributedString *editPriceStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    if (color) {
        [editPriceStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(location, length)];
    }
    if (font != 0) {
        [editPriceStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(location, length)];
    }
    self.attributedText = editPriceStr;
}
    
+ (CGSize)calculateLableSizeWithLableText:(NSString *)text font:(UIFont *)font lineSpace:(NSInteger)space maxWidth:(CGFloat)width {
    if (![text length]) return CGSizeMake(width, 0.01f);
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [attributeString boundingRectWithSize:CGSizeMake(width, [UIScreen mainScreen].bounds.size.height) options:options context:nil].size;
    // 设置行间距，内容全为中文，只显示一行时的计算误差
    if ((size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([[self class] containChinese:text]) {
            size = CGSizeMake(size.width, size.height - paragraphStyle.lineSpacing);
        }
    }
    return size;
}
    
+ (CGSize)calculateLableSizeWithLableText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width {
    if (![text length]) return CGSizeMake(width, 0.01f);
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [attributeString boundingRectWithSize:CGSizeMake(width, [UIScreen mainScreen].bounds.size.height) options:options context:nil].size;
    if ((size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:text]) {
            size = CGSizeMake(size.width, size.height - paragraphStyle.lineSpacing);
        }
    }
    return size;
}
    
// 判断内容中是否全部为汉字
+ (BOOL)containChinese:(NSString *)str {
    for(NSInteger i = 0; i < [str length]; i++) {
        int a = [str characterAtIndex:i];
        if(a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}
@end
