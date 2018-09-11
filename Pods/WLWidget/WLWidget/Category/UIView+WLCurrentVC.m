//
//  UIView+WLCurrentVC.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIView+WLCurrentVC.h"

@implementation UIView (WLCurrentVC)

- (UIViewController *)getCurrentViewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
