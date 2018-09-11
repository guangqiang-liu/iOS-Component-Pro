//
//  UITextView+WLTextView.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/30.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (WLTextView)

@property (nonatomic, copy) NSString *wl_placeHolder;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIColor *wl_placeHolderColor;
@end
