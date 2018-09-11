//
//  WLTooBarView.h
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTooBarView : UIView

@property (nonatomic, strong) UILabel *cancelBar;
@property (nonatomic, strong) UILabel *commitBar;
@property (nonatomic, strong) UILabel *titleBar;

@property (nonatomic, strong) NSString *cancelBarTitle;
@property (nonatomic, strong) UIColor *cancelBarTintColor;
@property (nonatomic, strong) NSString *commitBarTitle;
@property (nonatomic, strong) UIColor *commitBarTintColor;
@property (nonatomic, strong) NSString *titleBarTitle;
@property (nonatomic, strong) UIColor *titleBarTextColor;
@property (nonatomic, strong) void (^cancelBlock)(void);
@property (nonatomic, strong) void (^commitBlock)(void);
@end
