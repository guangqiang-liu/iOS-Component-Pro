//
//  WLDatePickerView.h
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTooBarView.h"

typedef void (^CommitBlock)(NSDate *date);
typedef void (^CancelBlock)(void);

@interface WLDatePickerView : UIDatePicker

@property (nonatomic, strong) WLTooBarView *toolBar;
@property (nonatomic, strong) UIView *containerView;

- (void)showMOFSDatePickerViewWithTag:(NSInteger)tag firstDate:(NSDate *)date commit:(CommitBlock)commitBlock cancel:(CancelBlock)cancelBlock;

@end
