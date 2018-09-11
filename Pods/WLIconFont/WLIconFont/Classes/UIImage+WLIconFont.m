//
//  UIImage+WLIconFont.m
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "UIImage+WLIconFont.h"
#import <CoreText/CoreText.h>
#import "WLIconFont.h"

@implementation UIImage (WLIconFont)

+ (UIImage *)imageWithIconInfo:(WLIconFontInfo *)iconInfo {
    
    CGFloat w1 = iconInfo.iconSize - iconInfo.iconInsets.left - iconInfo.iconInsets.right;
    CGFloat w2 = iconInfo.iconSize - iconInfo.iconInsets.top - iconInfo.iconInsets.bottom;
    CGFloat size = MIN(w1, w2);
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    CGFloat imageSize = iconInfo.iconSize * scale;
    UIFont *font = iconInfo.fontName ? [WLIconFont fontWithName:iconInfo.fontName size:realSize]: [WLIconFont fontWithSize:realSize];
    UIGraphicsBeginImageContext(CGSizeMake(imageSize, imageSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (iconInfo.iconBgColor) {
        [iconInfo.iconBgColor set];
        UIRectFill(CGRectMake(0.0, 0.0, imageSize, imageSize));
    }
    
    CGPoint point = CGPointMake(iconInfo.iconInsets.left * scale, iconInfo.iconInsets.top * scale);
    
    if ([iconInfo.iconName respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [iconInfo.iconName drawAtPoint:point withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: iconInfo.iconColor}];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, iconInfo.iconColor.CGColor);
        [iconInfo.iconName drawAtPoint:point withFont:font];
#pragma clang pop
    }
    
    // 绘制UIImage实例
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    return image;
}
@end
