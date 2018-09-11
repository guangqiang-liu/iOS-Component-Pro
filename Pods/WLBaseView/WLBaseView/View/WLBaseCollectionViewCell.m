//
//  WLBaseCollectionViewCell.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseCollectionViewCell.h"

@implementation WLBaseCollectionViewCell

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib *)nib {
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData {}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.cellEdgeInsets.left, frame.origin.y + self.cellEdgeInsets.top, frame.size.width - self.cellEdgeInsets.left - self.cellEdgeInsets.right, frame.size.height - self.cellEdgeInsets.top - self.cellEdgeInsets.bottom);
    [super setFrame:rc];
}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath {}


- (void) setCellModel:(id)cellModel {
    _cellModel = cellModel;
}

+ (CGSize)sizeForCellData:(id)aData {
    return CGSizeZero;
}

- (UICollectionView *)__getCollectionView {
    static int level = 10;
    UICollectionView *collectionView = nil;
    UIView *view = self.superview;
    for (int i = 0; i < level; i++) {
        if ([view isKindOfClass:[UICollectionView class]]) {
            collectionView = (UICollectionView *)view;
            break;
        } if (view.superview) {
            view = view.superview;
        } else {
            break;
        }
    }
    return collectionView;
}

- (NSIndexPath *)indexPath {
    if (_indexPath) {
        return _indexPath;
    }
    _indexPath = [[self __getCollectionView] indexPathForCell:self];
    return _indexPath;
}

@end
