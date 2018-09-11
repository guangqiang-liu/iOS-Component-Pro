//
//  UILabel+WLLineSpace.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WLLineSpace)


/**
 设置lable行间距

 @param text lable文本
 @param space 行间距
 */
- (void)setLineSpaceWithText:(NSString *)text space:(CGFloat)space;


/**
 设置lable字间距

 @param text lable 文本
 @param space 字间距
 */
- (void)setWordSpaceWithText:(NSString *)text space:(CGFloat)space;
    

/**
 设置lable行间距与字间距

 @param text lable 文本
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
- (void)setSpaceWithText:(NSString *)text lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace;


/**
 设置lable特殊字符的字号和颜色

 @param text 特殊字符
 @param color 颜色
 @param font 字号
 */
- (void)setSpecificTextWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font;
    

/**
 设置lable指定位置指定长度的文本字号颜色

 @param location 指定位置
 @param length 指定长度
 @param color 颜色
 @param font 字号
 */
- (void)setSpecificTextWithLocation:(NSInteger)location length:(NSInteger)length color:(UIColor *)color font:(UIFont *)font;

/**
 计算lable的高度，支持单行和多行，带行间距

 @param text lable文本
 @param font 字号
 @param space lable行间距
 @param width lable宽度
 */
+ (CGSize)calculateLableSizeWithLableText:(NSString *)text font:(UIFont *)font lineSpace:(NSInteger)space maxWidth:(CGFloat)width;
    

/**
 计算lable的高度，不带行间距

 @param text text
 @param font 字号
 @param width 宽度
 @return size
 */
+ (CGSize)calculateLableSizeWithLableText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width;
    
@end
