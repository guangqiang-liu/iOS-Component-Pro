//
//  UIButton+WLSDButton.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WLSDButton)

/**
 设置按钮的image
 
 @param urlStr image url
 @param placeholderImage 占位图
 */
- (void)setButtonImageWithUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeholderImage;


/**
 设置按钮的背景 image
 
 @param urlStr image url
 @param placeholderImage 占位图
 */
- (void)setButtonBackgroundImageWithUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeholderImage;
@end
