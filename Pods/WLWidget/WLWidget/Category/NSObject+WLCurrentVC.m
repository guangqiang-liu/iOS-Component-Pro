//
//  NSObject+WLCurrentVC.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "NSObject+WLCurrentVC.h"

@implementation NSObject (WLCurrentVC)

- (UIViewController *)getCurrentViewController {
    UIViewController *result = nil;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}
@end
