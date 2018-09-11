//
//  UITextView+WLTextView.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/30.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UITextView+WLTextView.h"
#import <objc/runtime.h>

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSString *const wl_placeHolderKey = @"wl_placeHolderKey";

@interface UITextView ()

@property (nonatomic, readonly) UILabel *wl_placeHolderLabel;
@end

@implementation UITextView (WLTextView)

+ (void)load {
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(wlPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(wlPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(wlPlaceHolder_swizzled_setText:)));
}

- (void)wlPlaceHolder_swizzled_dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self wlPlaceHolder_swizzled_dealloc];
}

- (void)wlPlaceHolder_swizzling_layoutSubviews {
    if (self.wl_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.wl_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.wl_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self wlPlaceHolder_swizzling_layoutSubviews];
}

- (void)wlPlaceHolder_swizzled_setText:(NSString *)text {
    [self wlPlaceHolder_swizzled_setText:text];
    if (self.wl_placeHolder) {
        [self updatePlaceHolder];
    }
}

- (NSString *)wl_placeHolder {
    return objc_getAssociatedObject(self, &wl_placeHolderKey);
}

- (void)setWl_placeHolder:(NSString *)wl_placeHolder {
    objc_setAssociatedObject(self, &wl_placeHolderKey, wl_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}

- (UIColor *)wl_placeHolderColor {
    return self.wl_placeHolderLabel.textColor;
}

- (void)setWl_placeHolderColor:(UIColor *)wl_placeHolderColor {
    self.wl_placeHolderLabel.textColor = wl_placeHolderColor;
}

- (NSString *)placeholder {
    return self.wl_placeHolder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.wl_placeHolder = placeholder;
}

- (void)updatePlaceHolder {
    if (self.text.length) {
        [self.wl_placeHolderLabel removeFromSuperview];
        return;
    }
    self.wl_placeHolderLabel.font = self.font ? self.font : self.cacutDefaultFont;
    self.wl_placeHolderLabel.textAlignment = self.textAlignment;
    self.wl_placeHolderLabel.text = self.wl_placeHolder;
    [self insertSubview:self.wl_placeHolderLabel atIndex:0];
}

- (UILabel *)wl_placeHolderLabel {
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(wl_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = HexRGB(0xcfcfcf);
        objc_setAssociatedObject(self, @selector(wl_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}

- (UIFont *)cacutDefaultFont {
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

@end
