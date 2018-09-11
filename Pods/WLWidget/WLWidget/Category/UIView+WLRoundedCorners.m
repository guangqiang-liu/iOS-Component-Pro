//
//  UIView+WLRoundedCorners.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIView+WLRoundedCorners.h"

@implementation UIView (WLRoundedCorners)

- (void)drawCornersWithCorners:(UIRectCorner)corners
                   cornerRadii:(CGSize)radii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    shape.path = maskPath.CGPath;
    self.layer.mask = shape;
}

- (void)drawCornersWithCorners:(UIRectCorner)corners
                   cornerRadii:(CGSize)radii
                      viewRect:(CGRect)rect {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    shape.path = maskPath.CGPath;
    self.layer.mask = shape;
}

@end
