//
//  UIView+WLDashLine.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WLDashLine)


/**
 绘制虚线

 @param height 虚线高度
 @param width 虚线宽度
 @param space 虚线间距
 @param color 虚线颜色
 */
- (void)drawDashLineWithLineHeight:(CGFloat)height dashLineWidth:(NSNumber *)width dashLineSpace:(NSNumber *)space lineColor:(UIColor *)color;
@end
