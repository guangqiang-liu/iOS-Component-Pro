//
//  WLIconFontInfo.m
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "WLIconFontInfo.h"

@implementation WLIconFontInfo

- (instancetype)initIconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor {
    if (self = [super init]) {
        self.iconName = iconName;
        self.iconSize = iconSize;
        self.iconColor = iconColor;
        self.iconInsets = iconInsets;
        self.iconBgColor = iconBgColor;
    }
    return self;
}

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor {
    return [[WLIconFontInfo alloc] initIconInfoWithIconName:iconName iconSize:iconSize iconColor:iconColor iconInsets:UIEdgeInsetsZero iconBackgroundColor:nil];
}

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor {
    return [[WLIconFontInfo alloc] initIconInfoWithIconName:iconName iconSize:iconSize iconColor:iconColor iconInsets:UIEdgeInsetsZero iconBackgroundColor:nil];
}

@end
