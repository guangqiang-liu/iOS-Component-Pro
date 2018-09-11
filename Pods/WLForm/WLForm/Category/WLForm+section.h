//
//  WLForm+section.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLForm.h"
@class WLFormSectionViewModel;
@interface WLForm (section)

- (WLFormSectionViewModel *)getSectionWithIndex:(NSInteger) index;
- (void)setSection:(WLFormSectionViewModel *)section index:(NSInteger)index;
@end
