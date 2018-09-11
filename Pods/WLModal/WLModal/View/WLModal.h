//
//  WLModal.h
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLModal : UIView

@property (nonatomic, copy) NSArray *buttonTitles;
@property (nonatomic, copy) void (^onButtonTouchUpInside)(WLModal *alertView, NSInteger buttonIndex);

- (id)init;

- (void)show;

- (void)close;

- (void)addContentView:(UIView *)view;

- (void)setOnButtonTouchUpInside:(void (^)(WLModal *alertView, NSInteger buttonIndex))onButtonTouchUpInside;

- (void)deviceOrientationDidChange:(NSNotification *)notification;

@end
