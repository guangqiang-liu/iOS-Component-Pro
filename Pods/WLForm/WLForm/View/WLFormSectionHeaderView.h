//
//  WLFormSectionHeaderView.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLFormSectionViewModel;

@interface WLFormSectionHeaderView : UIView

- (instancetype)initWithFrame:(CGRect)frame viewModel:(WLFormSectionViewModel *)viewModel;
@end
