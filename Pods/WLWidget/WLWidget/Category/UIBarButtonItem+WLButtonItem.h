//
//  UIBarButtonItem+WLButtonItem.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WLButtonItem)


/**
 创建buttonItem

 @param target target 对象
 @param action action
 @param title title
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title;


/**
 创建buttonItem

 @param target target 对象
 @param action action
 @param title title
 @param color color
 @param font font
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font;


/**
 创建buttonItem

 @param target target 对象
 @param action action
 @param title title
 @param titleEdgeInsets title 偏移量
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;


/**
 创建buttonItem

 @param target target
 @param action action
 @param title title
 @param color color
 @param font font
 @param titleEdgeInsets titleEdgeInsets
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;


/**
 创建buttonItem

 @param target target
 @param action action
 @param image image
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image;


/**
 创建buttonItem

 @param target target
 @param action action
 @param image image
 @param imageEdgeInsets imageEdgeInsets
 @return buttonItem
 */
+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

+ (UIBarButtonItem *)addButtonItemFixedSpaceWithWidth:(CGFloat)width;

@end
