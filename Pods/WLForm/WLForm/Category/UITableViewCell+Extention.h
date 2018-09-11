//
//  UITableViewCell+Extention.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLFormItemViewModel;

@interface UITableViewCell (Extention)

- (void)updateCellSep:(BOOL)isTop isBottom:(BOOL)isBottom viewModel:(WLFormItemViewModel *)viewModel;
- (void)updateCellTouchWithIndexPath:(NSIndexPath *)indexPath target:(id)target action:(SEL)action enable:(BOOL)enable;

@end
