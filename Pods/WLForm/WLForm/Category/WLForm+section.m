//
//  WLForm+section.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLForm+section.h"
#import "WLFormSectionViewModel.h"

@implementation WLForm (section)

- (WLFormSectionViewModel *)getSectionWithIndex:(NSInteger) index {
    if (self.sectionArray.count > index) {
        return self.sectionArray[index];
    }
    return nil;
}

- (void)setSection:(WLFormSectionViewModel *)section index:(NSInteger)index {
    if (self.sectionArray.count < index) {
        return;
    }
    self.sectionArray[index] = section;
}
@end
