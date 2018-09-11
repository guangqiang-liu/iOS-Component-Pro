//
//  WLBaseCollectionView.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseCollectionView.h"
#import "WLBaseCollectionViewCell.h"
#import "WLBaseCollectionReusableView.h"

@implementation WLBaseCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:[WLBaseCollectionViewCell class]]) {
        [(WLBaseCollectionViewCell *)cell setIndexPath:indexPath];
    }
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:[WLBaseCollectionReusableView class]]) {
        [(WLBaseCollectionReusableView *)cell setIndexPath:indexPath];
    }
    return cell;
}

- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    NSMutableArray *safeIndexPaths = [[NSMutableArray alloc] initWithArray:indexPaths];
    for (NSIndexPath *indexPath in indexPaths) {
        if ([indexPath isKindOfClass:[NSIndexPath class]]) {
            NSInteger section = indexPath.section;
            NSInteger row = indexPath.item;
            if ((section < 0 || section >= self.numberOfSections) ||
                (row < 0 || row >= [self numberOfItemsInSection:section])) {
                [safeIndexPaths removeObject:indexPath];
            }
        } else {
            [safeIndexPaths removeObject:indexPath];
        }
    }
    if (safeIndexPaths.count) {
        return [super reloadItemsAtIndexPaths:safeIndexPaths];
    }
}



- (void)reloadSections:(NSIndexSet *)sections {
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    }else if (lastIndex >= self.numberOfSections) {
        return ;
    }else {
        return [super reloadSections:sections];
    }
}

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated {
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    [super scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}


- (UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= self.numberOfSections) {
        return nil;
    } else if (indexPath.row >= [self numberOfItemsInSection:indexPath.section]) {
        return nil;
    } else {
        return [super cellForItemAtIndexPath:indexPath];
    }
}


- (void)deleteSections:(NSIndexSet *)sections {
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return;
    } else if (lastIndex >= self.numberOfSections) {
        return;
    } else {
        return [super deleteSections:sections];
    }
}


- (void)insertSections:(NSIndexSet *)sections {
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return;
    } else {
        NSInteger sectionIndex = [self.dataSource numberOfSectionsInCollectionView:self];
        if (lastIndex >= sectionIndex) {
            return;
        }
        return [super insertSections:sections];
    }
}


- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition {
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return;
    }
    [super selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate {
    [super setDelegate:delegate];
    if (delegate == nil) {
        return;
    }
}


- (void)reloadData {
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}

@end
