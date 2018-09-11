//
//  UIButton+Gradient.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIButton+Gradient.h"

@implementation UIButton (Gradient)

- (UIButton *)createGradientButtonWithSize:(CGSize)btnSize colorArray:(NSArray *)colorArr gradientType:(GradientType)type {
    UIImage *backImage = [[[UIImage alloc] init] createGradientImageWithSize:btnSize gradientColors:colorArr gradientType:type];
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    return self;
}
@end
