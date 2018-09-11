//
//  WLIcon.h
//  WLIconFont_Example
//
//  Created by 刘光强 on 2018/3/13.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLIcon : NSObject

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor backgroundColor:(UIColor *)iconBgColor;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets backgroundColor:(UIColor *)iconBgColor;

+ (NSString *)matchIconCodeWithName:(NSString *)iconName;

@end
