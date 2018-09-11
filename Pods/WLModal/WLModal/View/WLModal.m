//
//  WLModal.m
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLModal.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat kCustomIOSAlertViewDefaultButtonHeight = 50;
static const CGFloat kCustomIOSAlertViewDefaultButtonSpacerHeight = 1;
CGFloat buttonHeight = 1;
CGFloat buttonSpacerHeight = 1;

@interface WLModal()

@property (nonatomic, strong) UIView *dialogView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, copy) NSArray *buttonTitleColorArray;
@end

@implementation WLModal

- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        self.buttonTitleColorArray = @[HexRGB(0x999999), HexRGB(0xFF4B4A)];
    }
    return self;
}

- (void)show {
    self.dialogView = [self createContainerView];
    self.dialogView.layer.shouldRasterize = YES;
    self.dialogView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.backgroundColor = RGBAlpha(0, 0, 0, 0);
    [self addSubview:self.dialogView];
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (interfaceOrientation) {
            case UIInterfaceOrientationLandscapeLeft:
                self.transform = CGAffineTransformMakeRotation(M_PI * 270.0 / 180.0);
                break;
            case UIInterfaceOrientationLandscapeRight:
                self.transform = CGAffineTransformMakeRotation(M_PI * 90.0 / 180.0);
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
                self.transform = CGAffineTransformMakeRotation(M_PI * 180.0 / 180.0);
                break;
            default:
                break;
        }
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } else {
        CGSize screenSize = [self countScreenSize];
        CGSize dialogSize = [self countDialogSize];
        CGSize keyboardSize = CGSizeMake(0, 0);
        self.dialogView.frame = CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - keyboardSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height);
    }
    
    //    [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    self.dialogView.layer.opacity = 0.5f;
    self.dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = RGBAlpha(0, 0, 0, 0.3);
                         self.dialogView.layer.opacity = 1.0f;
                         self.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     }
                     completion:NULL
     ];
}

- (void)close {
    CATransform3D currentTransform = self.dialogView.layer.transform;
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        CGFloat startRotation = [[self.dialogView valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
        CATransform3D rotation = CATransform3DMakeRotation(-startRotation + M_PI * 270.0 / 180.0, 0.0f, 0.0f, 0.0f);
        self.dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1));
    }
    self.dialogView.layer.opacity = 1.0f;
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
     animations:^{
         self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
         self.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
         self.dialogView.layer.opacity = 0.0f;
     } completion:^(BOOL finished) {
         for (UIView *views in [self subviews]) {
             [views removeFromSuperview];
         }
         [self removeFromSuperview];
     }
 ];
}

- (void)addContentView:(UIView *)subView {
    self.containerView = subView;
}

- (UIView *)createContainerView {
    if (self.containerView == NULL) {
        self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    }
    CGSize screenSize = [self countScreenSize];
    CGSize dialogSize = [self countDialogSize];
    self.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    
    UIView *dialogContainer = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height)];
    
    // 设置阴影和圆角
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = dialogContainer.bounds;
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f] CGColor],
//                       (id)[[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1.0f] CGColor],
//                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0f] CGColor],
//                       nil];
//    CGFloat cornerRadius = kCustomIOSAlertViewCornerRadius;
//    gradient.cornerRadius = cornerRadius;
//
//    [dialogContainer.layer insertSublayer:gradient atIndex:0];
//    dialogContainer.layer.cornerRadius = cornerRadius;
//    dialogContainer.layer.shadowRadius = cornerRadius + 5;
//    dialogContainer.layer.shadowOpacity = 0.1f;
//    dialogContainer.layer.shadowOffset = CGSizeMake(0 - (cornerRadius+5)/2, 0 - (cornerRadius+5)/2);
//    dialogContainer.layer.shadowColor = [UIColor blackColor].CGColor;
//    dialogContainer.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:dialogContainer.bounds cornerRadius:dialogContainer.layer.cornerRadius].CGPath;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, dialogContainer.bounds.size.height - buttonHeight - buttonSpacerHeight, dialogContainer.bounds.size.width, buttonSpacerHeight)];
    lineView.backgroundColor = sepLineColor;
    [dialogContainer addSubview:lineView];
    [dialogContainer addSubview:self.containerView];
    
    [self addButtonsToView:dialogContainer];
    
    return dialogContainer;
}

- (void)addButtonsToView:(UIView *)container {
    if (!self.buttonTitles.count) return;
    CGFloat buttonWidth = container.bounds.size.width / self.buttonTitles.count;
    for (NSInteger i = 0; i < self.buttonTitles.count; i++) {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.frame = CGRectMake(i * buttonWidth, container.bounds.size.height - buttonHeight, buttonWidth, buttonHeight);
        [closeButton setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
        [closeButton setTitleColor:self.buttonTitleColorArray[i] forState:UIControlStateNormal];
        closeButton.titleLabel.font = H16;
        closeButton.backgroundColor = white_color;
        [closeButton whenTapped:^{
            !self.onButtonTouchUpInside ?: self.onButtonTouchUpInside(self, i);
        }];
        // 设置第一个和最后一个按钮的圆角
        if (self.buttonTitles.count > 1) {
            if (i == 0) {
                [closeButton drawCornersWithCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(12, 12)];
            } else if (i == self.buttonTitles.count - 1) {
                [closeButton drawCornersWithCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(12, 12)];
            }
        } else {
            [closeButton drawCornersWithCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(12, 12)];
        }
        [container addSubview:closeButton];
        if (i > 0) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i * buttonWidth, container.bounds.size.height - buttonHeight, kCustomIOSAlertViewDefaultButtonSpacerHeight, buttonHeight)];
            lineView.backgroundColor = sepLineColor;
            [container addSubview:lineView];
        }
    }
}

- (CGSize)countDialogSize {
    CGFloat dialogWidth = self.containerView.frame.size.width;
    CGFloat dialogHeight = self.containerView.frame.size.height + buttonHeight + buttonSpacerHeight;
    return CGSizeMake(dialogWidth, dialogHeight);
}

- (CGSize)countScreenSize {
    if (self.buttonTitles != NULL && [self.buttonTitles count] > 0) {
        buttonHeight = kCustomIOSAlertViewDefaultButtonHeight;
        buttonSpacerHeight = kCustomIOSAlertViewDefaultButtonSpacerHeight;
    } else {
        buttonHeight = 0;
        buttonSpacerHeight = 0;
    }
    CGFloat screenWidth = SCREEN_WIDTH;
    CGFloat screenHeight = SCREEN_HEIGHT;
    // iOS7, 屏幕的宽高不会随着方向自动调整
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
            CGFloat tmp = screenWidth;
            screenWidth = screenHeight;
            screenHeight = tmp;
        }
    }
    return CGSizeMake(screenWidth, screenHeight);
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        [self changeOrientationForIOS7];
    } else {
        [self changeOrientationForIOS8:notification];
    }
}

- (void)changeOrientationForIOS7 {
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    CGFloat startRotation = [[self valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
    CGAffineTransform rotation;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationLandscapeLeft:
            rotation = CGAffineTransformMakeRotation(-startRotation + M_PI * 270.0 / 180.0);
            break;
        case UIInterfaceOrientationLandscapeRight:
            rotation = CGAffineTransformMakeRotation(-startRotation + M_PI * 90.0 / 180.0);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            rotation = CGAffineTransformMakeRotation(-startRotation + M_PI * 180.0 / 180.0);
            break;
        default:
            rotation = CGAffineTransformMakeRotation(-startRotation + 0.0);
            break;
    }
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.dialogView.transform = rotation;
                     }
                     completion:nil
     ];
}

- (void)changeOrientationForIOS8:(NSNotification *)notification {
    CGFloat screenWidth = SCREEN_WIDTH;
    CGFloat screenHeight = SCREEN_HEIGHT;
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         CGSize dialogSize = [self countDialogSize];
                         CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
                         self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
                         self.dialogView.frame = CGRectMake((screenWidth - dialogSize.width) / 2, (screenHeight - keyboardSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height);
                     }
                     completion:nil
     ];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGSize screenSize = [self countScreenSize];
    CGSize dialogSize = [self countDialogSize];
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation) && NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) {
        CGFloat tmp = keyboardSize.height;
        keyboardSize.height = keyboardSize.width;
        keyboardSize.width = tmp;
    }
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.dialogView.frame = CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - keyboardSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height);
                     }
                     completion:nil
     ];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    CGSize screenSize = [self countScreenSize];
    CGSize dialogSize = [self countDialogSize];
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.dialogView.frame = CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height);
                     }
                     completion:nil
     ];
}

- (void)dealloc {
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

@end
