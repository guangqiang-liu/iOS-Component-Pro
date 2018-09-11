//
//  UIButton+Gradient.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Gradient.h"

@interface UIButton (Gradient)

/**
 *  根据给定的颜色，设置按钮的颜色
 *  @param btnSize  这里要求手动设置下生成图片的大小，防止coder使用第三方layout,没有设置大小
 *  @param colorArr 渐变颜色的数组
 *  @param type     渐变色的类型
 */
- (UIButton *)createGradientButtonWithSize:(CGSize)btnSize colorArray:(NSArray *)colorArr gradientType:(GradientType)type;
@end
