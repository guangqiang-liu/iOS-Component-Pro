//
//  UIBarButtonItem+WLButtonItem.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIBarButtonItem+WLButtonItem.h"
@implementation UIBarButtonItem (WLButtonItem)

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title {
    return [self createItemWithTarget:target action:action title:title titleColor:nil titleFont:nil titleEdgeInsets:UIEdgeInsetsZero];
}

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font {
    return [self createItemWithTarget:target action:action title:title titleColor:color titleFont:font titleEdgeInsets:UIEdgeInsetsZero];
}

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    return [self createItemWithTarget:target action:action title:title titleColor:nil titleFont:nil titleEdgeInsets:titleEdgeInsets];
}

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button sizeToFit];
    button.frame = CGRectMake(0, 0, 40, 40);
    button.titleEdgeInsets = titleEdgeInsets;
    button.backgroundColor = [UIColor magentaColor];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image {
    return [self createItemWithTarget:target action:action image:image];
}

+ (UIBarButtonItem *)createItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button sizeToFit];
    if (button.bounds.size.width < 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    button.imageEdgeInsets = imageEdgeInsets;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)addButtonItemFixedSpaceWithWidth:(CGFloat)width {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}
@end
