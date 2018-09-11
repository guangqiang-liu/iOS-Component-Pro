//
//  WLForm.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLForm.h"
#import "WLFormSectionViewModel.h"
#import "WLFormItemViewModel.h"

@interface WLForm ()

@property (nonatomic, strong, readwrite) NSMutableArray<WLFormSectionViewModel *> *sectionArray;
@end

@implementation WLForm

- (void)addSection:(WLFormSectionViewModel *)section {
    [self.sectionArray addObject:section];
}

- (void)removeSection:(WLFormSectionViewModel *)section {
    [self.sectionArray removeObject:section];
}

- (void)reformResRet:(id)res {
    for (WLFormSectionViewModel *section in self.sectionArray) {
        for (WLFormItemViewModel *item in section.itemArray) {
            !item.reformResRetBlock ?: item.reformResRetBlock(res, item.value);
        }
    }
}

- (id)fetchRequestParams {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (WLFormSectionViewModel *section in self.sectionArray) {
        for (WLFormItemViewModel *item in section.itemArray) {
            if (!item.requestParamsConfigBlock) continue;
            id params = item.requestParamsConfigBlock(item.value);
            if ([params isKindOfClass:[NSDictionary class]]) {
                [dic addEntriesFromDictionary:params];
            } else if ([params isKindOfClass:[NSArray class]]) {
                for (NSDictionary *subParams in params) {
                    [dic addEntriesFromDictionary:subParams];
                }
            }
        }
    }
    return dic;
}

- (NSDictionary *)validateItems {
    for (WLFormSectionViewModel *section in self.sectionArray) {
        for (WLFormItemViewModel *item in section.itemArray) {
            if (!item.isHidden && item.valueValidateBlock) {
                NSDictionary *dic = item.valueValidateBlock(item.value);
                NSNumber *ret = dic[kValidateRetKey];
                NSAssert(ret, @"缺少参数");
                if (!ret) continue;
                if (!ret.boolValue) return dic;
            }
        }
    }
    return itemValid();
}

- (WLFormItemViewModel *)itemWithIndexPath:(NSIndexPath *)indexPath {
    NSInteger sectionCounter = -1;
    WLFormSectionViewModel *tempSection = nil;
    for (WLFormSectionViewModel *section in self.sectionArray) {
        if (!section.isHidden) sectionCounter ++;
        if (sectionCounter == indexPath.section) {
            tempSection = section;
            break;
        }
    }
    
    if (sectionCounter == -1) return nil;
    
    NSInteger itemCounter = -1;
    for (WLFormItemViewModel *item in tempSection.itemArray) {
        if (!item.isHidden) itemCounter ++;
        if (itemCounter == indexPath.row) {
            return item;
        }
    }
    return nil;
}

- (NSIndexPath *)indexPathWithItem:(WLFormItemViewModel *) item {
    if (item.isHidden) return nil;
    if (!item.section || item.section.hidden) return nil;
    WLFormSectionViewModel *tempSection = item.section;
    NSInteger sectionCounter = -1;
    BOOL matchSection = NO;
    for (WLFormSectionViewModel *section in self.sectionArray) {
        if (!section.isHidden) sectionCounter ++;
        if (section == tempSection) {
            matchSection = YES;
            break;
        }
    }
    
    if (!matchSection) return nil;
    
    NSInteger itemCounter = -1;
    BOOL matchItem = NO;
    for (WLFormItemViewModel *itemT in tempSection.itemArray) {
        if (!itemT.isHidden) itemCounter ++;
        if (itemT == item) {
            matchItem = YES;
            break;
        }
    }
    
    if (!matchItem) return nil;
    
    return [NSIndexPath indexPathForRow:itemCounter inSection:sectionCounter];
}

- (NSMutableArray<WLFormSectionViewModel *> *)sectionArray {
    if (!_sectionArray) {
        _sectionArray = [[NSMutableArray alloc] init];
    }
    return _sectionArray;
}

- (NSUInteger)count {
    return self.sectionArray.count;
}

@end
