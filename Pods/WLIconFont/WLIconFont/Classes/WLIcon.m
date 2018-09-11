//
//  WLIcon.m
//  WLIconFont_Example
//
//  Created by 刘光强 on 2018/3/13.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "WLIcon.h"
#import "WLIconFontConfig.h"
#import "WLIconFontInfo.h"
#import "UIImage+WLIconFont.h"

@implementation WLIcon

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:UIEdgeInsetsZero backgroundColor:nil];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:iconInsets backgroundColor:nil];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor backgroundColor:(UIColor *)iconBgColor {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:UIEdgeInsetsZero backgroundColor:iconBgColor];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets backgroundColor:(UIColor *)iconBgColor {
    NSString *fontUnicode = [self matchIconCodeWithName:iconName];
    WLIconFontInfo *fontInfo = [WLIconFontInfo iconInfoWithIconName:fontUnicode iconSize:iconSize iconColor:iconColor iconInsets:iconInsets iconBackgroundColor:iconBgColor];
    NSString *fontname = [WLIconFontConfig fontName];
    fontInfo.fontName = fontname;
    return [UIImage imageWithIconInfo:fontInfo];
}

+ (NSString *)matchIconCodeWithName:(NSString *)iconName {
    NSDictionary *fontDic = [WLIconFontConfig glyphMap];
    NSString *code = fontDic[iconName];
    return code ?: iconName;
}

@end
