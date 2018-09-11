//
//  WLBaseView.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseViewProtocol.h"

@interface WLBaseView : UIView<WLBaseViewProtocol>

/**
 缩进边界
 */
@property (nonatomic) UIEdgeInsets viewEdgeInsets;

+ (instancetype)loadXib;

@end
