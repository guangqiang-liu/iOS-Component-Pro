//
//  WLFormSectionViewModel+row.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSectionViewModel.h"

@class WLFormItemViewModel;
@interface WLFormSectionViewModel (row)

- (WLFormItemViewModel *)getItemWithIndex:(NSInteger) index;
- (void)setItem:(WLFormItemViewModel *)item index:(NSInteger)index;
@end
