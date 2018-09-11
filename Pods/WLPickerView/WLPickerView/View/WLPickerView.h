//
//  WLPickerView.h
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTooBarView.h"

@interface WLPickerView : UIPickerView

@property (nonatomic, assign) NSInteger showTag;
@property (nonatomic, strong) WLTooBarView *toolBar;
@property (nonatomic, strong) UIView *containerView;

- (void)showMOFSPickerViewWithDataArray:(NSArray<NSString *> *)array commitBlock:(void(^)(NSString *string))commitBlock cancelBlock:(void(^)(void))cancelBlock;

- (void)showMOFSPickerViewWithCustomDataArray:(NSArray<NSString *> *)array keyMapper:(NSString *)keyMapper commitBlock:(void(^)(id model))commitBlock cancelBlock:(void(^)(void))cancelBlock;
@end


@interface NSString (WLPickerView)

@property (nonatomic, copy) NSString *mofs_key;
@property (nonatomic, assign) NSInteger mofs_int_key;

@end
