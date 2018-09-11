//
//  UIView+WLDashLine.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIView+WLDashLine.h"

@implementation UIView (WLDashLine)

- (void)drawDashLineWithLineHeight:(CGFloat)height dashLineWidth:(NSNumber *)width dashLineSpace:(NSNumber *)space lineColor:(UIColor *)color {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointMake(self.frame.size.width / 2.0, self.frame.size.height)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    // 设置虚线颜色
    [shapeLayer setStrokeColor:color.CGColor];
    // 设置虚线高度
    [shapeLayer setLineWidth: height];
    [shapeLayer setLineJoin:kCALineJoinRound];
    // 设置虚线的线宽及间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:width, space, nil]];
    // 创建虚线绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置虚线绘制路径起点
    CGPathMoveToPoint(path, NULL, 0, 0);
    // 设置虚线绘制路径终点
    CGPathAddLineToPoint(path, NULL, self.frame.size.width, 0);
    // 设置虚线绘制路径
    [shapeLayer setPath:path];
    CGPathRelease(path);
    // 添加虚线
    [self.layer addSublayer:shapeLayer];
}
@end
