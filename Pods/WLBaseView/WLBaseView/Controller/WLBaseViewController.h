//
//  WLBaseViewController.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+WLNavigationItem.h"
#import "WLBaseViewControllerProtocol.h"

typedef NS_ENUM(NSInteger, StatusBarStyle) {
    StatusBarStyleBlack,
    StatusBarStyleWhite
};

@interface WLBaseViewController : UIViewController<WLBaseViewControllerProtocol>


/**
 是否隐藏导航左按钮
 */
@property (nonatomic, assign, getter=isLeftBarBtnHidden) BOOL leftBarBtnHidden;

/**
 *  是否显示导航栏的toolbar
 */
@property (nonatomic, assign, getter=isToolbarHidden) BOOL toolbarHidden;


/**
 *  是否显示Navigation bar
 */
@property (nonatomic, assign, getter=isNavigationBarHidden) BOOL navigationBarHidden;


/**
 *  导航栏背景图
 */
@property (nonatomic, strong) UIImage *navigationBarImage;


/**
 *  状态栏样式
 */
@property (nonatomic, assign) StatusBarStyle statusBarStyle;


/**
 *  title颜色
 */
@property (nonatomic, strong) UIColor *titleColor;


/**
 *  富文本title，如果设置了则title，titlecolor失效
 */
@property (nonatomic, copy) NSDictionary *titleTextAttributes;

@end
