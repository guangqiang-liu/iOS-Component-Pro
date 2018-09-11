//
//  WLIconFontInfo.h
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLIconFontInfo : NSObject

@property (nonatomic, copy) NSString *fontName;

@property (nonatomic, copy) NSString *iconName;

@property (nonatomic, assign) NSInteger iconSize;

@property (nonatomic, strong) UIColor *iconColor;

@property (nonatomic, strong) UIColor *iconBgColor;

@property (nonatomic, assign) UIEdgeInsets iconInsets;

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor;

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor;

@end
