//
//  WLBaseTableView.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseTableView.h"

@implementation WLBaseTableView

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    UITableViewCell *cell = [super dequeueReusableCellWithIdentifier:identifier];
    if ([cell isKindOfClass:[WLBaseTableViewCell class]]) {
        [(WLBaseTableViewCell *)cell setIndexPath:nil];
    }
    return cell;
}

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:[WLBaseTableViewCell class]]) {
        [(WLBaseTableViewCell *)cell setIndexPath:indexPath];
    }
    return cell;
}


- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    if (indexPath.section >= self.numberOfSections) {
        return ;
    } else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return ;
    } else {
        return [super scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
    }
}


- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition {
    if (indexPath.section >= self.numberOfSections) {
        return;
    } else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return;
    } else {
        return [super selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
    }
}


- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= self.numberOfSections) {
        return nil;
    } else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return nil;
    } else {
        return [super cellForRowAtIndexPath:indexPath];
    }
}


- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    NSMutableArray *safeIndexPaths = [[NSMutableArray alloc] initWithArray:indexPaths];
    for (NSIndexPath *indexPath in indexPaths) {
        if ([indexPath isKindOfClass:[NSIndexPath class]]) {
            NSInteger section = indexPath.section;
            NSInteger row = indexPath.row;
            if ((section < 0 || section >= self.numberOfSections) ||
                (row < 0 || row >= [self numberOfRowsInSection:section])) {
                [safeIndexPaths removeObject:indexPath];
            }
        } else {
            [safeIndexPaths removeObject:indexPath];
        }
    }
    if (safeIndexPaths.count) {
        return [super reloadRowsAtIndexPaths:safeIndexPaths withRowAnimation:animation];
    }
}


- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    } else if (lastIndex >= self.numberOfSections) {
        return ;
    } else {
        return [super reloadSections:sections withRowAnimation:animation];
    }
}


- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    } else if (lastIndex >= self.numberOfSections) {
        return ;
    } else {
        return [super deleteSections:sections withRowAnimation:animation];
    }
}


- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    } else {
        NSInteger sectionIndex = [self.dataSource numberOfSectionsInTableView:self];
        if (lastIndex >= sectionIndex) {
            return ;
        }
        return [super insertSections:sections withRowAnimation:animation];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    [super setDelegate:delegate];
    if (delegate == nil) {
        return;
    }
}

@end
