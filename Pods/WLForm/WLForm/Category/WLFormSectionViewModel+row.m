//
//  WLFormSectionViewModel+row.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSectionViewModel+row.h"
#import "WLFormItemViewModel.h"

@implementation WLFormSectionViewModel (row)

- (WLFormItemViewModel *)getItemWithIndex:(NSInteger) index {
    if (self.itemArray.count > index) {
        return self.itemArray[index];
    }
    return nil;
}

- (void)setItem:(WLFormItemViewModel *)item index:(NSInteger)index {
    if (self.itemArray.count < index) {
        return;
    }
    self.itemArray[index] = item;
}
@end
