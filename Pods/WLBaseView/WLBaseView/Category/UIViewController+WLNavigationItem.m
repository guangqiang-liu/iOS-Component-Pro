//
//  UIViewController+WLNavigationItem.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "UIViewController+WLNavigationItem.h"

#define kNavItemFont [UIFont systemFontOfSize:14]

@implementation UIViewController (WLNavigationItem)

- (void)setNavigationItemBackItem {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 44, 44);
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"WLBaseView")];
    UIImage *image = [UIImage imageNamed:@"icon_back" inBundle:bundle compatibleWithTraitCollection:nil];
    [itemBtn setImage:image forState:UIControlStateNormal];
    [itemBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    itemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [itemBtn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.leftBarButtonItem = item;
    
    // 注意：此api只能在iOS 11之前的系统生效
//    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    spaceItem.width = -5;
//    self.navigationItem.leftBarButtonItems = @[spaceItem, item];
}

- (void)setNavigationItemLeftBarButtonItem:(SEL)btnSel withTitle:(NSString *)title withTitleColor:(UIColor *)color {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 60, 60);
    [itemBtn setTitle:title forState:UIControlStateNormal];
    [itemBtn setTitleColor:color forState:UIControlStateNormal];
    itemBtn.titleLabel.font = kNavItemFont;
    [itemBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [itemBtn addTarget:self action:btnSel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setNavigationItemLeftBarButtonItem:(SEL)btnSel withImage:(UIImage *)image {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 44, 44);
    [itemBtn setImage:image forState:UIControlStateNormal];
    [itemBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    itemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [itemBtn addTarget:self action:btnSel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setNavigationItemRightBarButtonItem:(SEL)btnSel withImage:(UIImage *)image {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 44, 44);
    [itemBtn setImage:image forState:UIControlStateNormal];
    [itemBtn addTarget:self action:btnSel forControlEvents:UIControlEventTouchUpInside];
    [itemBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    itemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setNavigationItemRightBarButtonItem:(SEL)btnSel withTitle:(NSString *)title withTitleColor:(UIColor *)color {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 60, 60);
    [itemBtn setTitle:title forState:UIControlStateNormal];
    [itemBtn setTitleColor:color forState:UIControlStateNormal];
    itemBtn.titleLabel.font = kNavItemFont;
    [itemBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    itemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [itemBtn addTarget:self action:btnSel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setNavigationItemRightBarButtonItemsWithLeftSel:(SEL)leftSel leftTitle:(NSString *)title leftTitleColor:(UIColor *)color rightSel:(SEL)rightSel rightImage:(UIImage *)rightImage {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 60, 60);
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    leftBtn.titleLabel.font = kNavItemFont;
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, -5)];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [leftBtn addTarget:self action:leftSel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:rightImage forState:UIControlStateNormal];
    [rightBtn addTarget:self action:rightSel forControlEvents:UIControlEventTouchUpInside];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItems = @[rightItem, leftItem];
}

- (void)popVC {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissVC {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
