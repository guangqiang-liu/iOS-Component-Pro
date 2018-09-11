//
//  UIView+WLGestureBlock.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WLWhenTappedBlock)(void);

@interface UIView (WLGestureBlock)<UIGestureRecognizerDelegate>

- (void)whenTapped:(WLWhenTappedBlock)block;
- (void)whenDoubleTapped:(WLWhenTappedBlock)block;
- (void)whenTwoFingerTapped:(WLWhenTappedBlock)block;
- (void)whenTouchedDown:(WLWhenTappedBlock)block;
- (void)whenTouchedUp:(WLWhenTappedBlock)block;
@end
