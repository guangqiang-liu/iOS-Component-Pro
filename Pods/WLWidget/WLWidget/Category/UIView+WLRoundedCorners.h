//
//  UIView+WLRoundedCorners.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WLRoundedCorners)

- (void)drawCornersWithCorners:(UIRectCorner)corners
                   cornerRadii:(CGSize)radii;

- (void)drawCornersWithCorners:(UIRectCorner)corners
                cornerRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

@end
