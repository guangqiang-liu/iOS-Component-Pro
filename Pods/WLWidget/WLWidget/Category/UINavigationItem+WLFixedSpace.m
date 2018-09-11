//
//  UINavigationItem+WLFixedSpace.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UINavigationItem+WLFixedSpace.h"
#import "NSObject+WLRunTime.h"

typedef NS_ENUM(NSInteger, WLBarViewPosition) {
    WLBarViewPositionLeft,
    WLBarViewPositionRight
};

@interface BarView : UIView

@property (nonatomic, assign) WLBarViewPosition position;
@property (nonatomic, assign) BOOL applied;
@end

@implementation BarView

- (void)layoutSubviews {
    [super layoutSubviews];
//    if (self.applied || [[[UIDevice currentDevice] systemVersion] floatValue]  < 11) return;
//    UIView *view = self;
//    while (![view isKindOfClass:UINavigationBar.class] && view.superview) {
//        view = [view superview];
//        if ([view isKindOfClass:UIStackView.class] && view.superview) {
//            if (self.position == WLBarViewPositionLeft) {
//                for (NSLayoutConstraint *constraint in view.superview.constraints) {
//                    if (([constraint.firstItem isKindOfClass:UILayoutGuide.class] &&
//                         constraint.firstAttribute == NSLayoutAttributeTrailing)) {
//                        [view.superview removeConstraint:constraint];
//                    }
//                }
//                [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view
//                                                                           attribute:NSLayoutAttributeLeading
//                                                                           relatedBy:NSLayoutRelationEqual
//                                                                              toItem:view.superview
//                                                                           attribute:NSLayoutAttributeLeading
//                                                                          multiplier:1.0
//                                                                            constant:0]];
//                self.applied = YES;
//            } else if (self.position == WLBarViewPositionRight) {
//                for (NSLayoutConstraint *constraint in view.superview.constraints) {
//                    if (([constraint.firstItem isKindOfClass:UILayoutGuide.class] &&
//                         constraint.firstAttribute == NSLayoutAttributeLeading)) {
//                        [view.superview removeConstraint:constraint];
//                    }
//                }
//                [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view
//                                                                           attribute:NSLayoutAttributeTrailing
//                                                                           relatedBy:NSLayoutRelationEqual
//                                                                              toItem:view.superview
//                                                                           attribute:NSLayoutAttributeTrailing
//                                                                          multiplier:1.0
//                                                                            constant:0]];
//                self.applied = YES;
//            }
//            break;
//        }
//    }
}
@end

@implementation UINavigationItem (WLFixedSpace)

+ (void)load {
//    [self swizzleInstanceMethodWithOriginSel:@selector(setLeftBarButtonItem:)
//                                 swizzleSel:@selector(swizzle_setLeftBarButtonItem:)];
//    [self swizzleInstanceMethodWithOriginSel:@selector(setRightBarButtonItem:)
//                                 swizzleSel:@selector(swizzle_setRightBarButtonItem:)];
}

- (void)swizzle_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    if (leftBarButtonItem.customView) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11) {
            UIView *customView = leftBarButtonItem.customView;
            BarView *barView = [[BarView alloc]initWithFrame:customView.bounds];
            [barView addSubview:customView];
            customView.center = barView.center;
            [barView setPosition:WLBarViewPositionLeft];
            [self setLeftBarButtonItems:nil];
            [self swizzle_setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:barView]];
        } else {
            [self swizzle_setLeftBarButtonItem:nil];
            [self setLeftBarButtonItems:@[[self fixedSpaceWithWidth:-20], leftBarButtonItem]];
        }
    } else {
        [self setLeftBarButtonItems:nil];
        [self swizzle_setLeftBarButtonItem:leftBarButtonItem];
    }
}

- (void)swizzle_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    if (rightBarButtonItem.customView) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11) {
            UIView *customView = rightBarButtonItem.customView;
            BarView *barView = [[BarView alloc]initWithFrame:customView.bounds];
            [barView addSubview:customView];
            customView.center = barView.center;
            [barView setPosition:WLBarViewPositionRight];
            [self setRightBarButtonItems:nil];
            [self swizzle_setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:barView]];
        } else {
            [self swizzle_setRightBarButtonItem:nil];
            [self setRightBarButtonItems:@[[self fixedSpaceWithWidth:-20], rightBarButtonItem]];
        }
    } else {
        [self setRightBarButtonItems:nil];
        [self swizzle_setRightBarButtonItem:rightBarButtonItem];
    }
}

- (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}
@end
