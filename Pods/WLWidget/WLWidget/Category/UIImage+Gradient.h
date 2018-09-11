//
//  UIImage+Gradient.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            // 从上到下
    GradientFromLeftToRight,                // 从左到右
    GradientFromLeftTopToRightBottom,       // 从左上到右下
    GradientFromLeftBottomToRightTop        // 从左下到右上
};

@interface UIImage (Gradient)

/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorArr         渐变颜色的数组
 *  @param gradientType     渐变色的类型
 */
- (UIImage *)createGradientImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorArr gradientType:(GradientType)gradientType;

@end
