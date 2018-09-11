//
//  WLBaseCollectionReusableView.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseCollectionView.h"

@interface WLBaseCollectionReusableView : UICollectionReusableView

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  缩进边界
 */
@property (nonatomic, assign) UIEdgeInsets cellEdgeInsets;

+ (CGSize)sizeForCellData:(id)aData;

/**
 *  功能:获取对应的唯一标识符
 */
+ (NSString *)reuseIdentifier;

/**
 *  功能:获取对应的xib
 */
+ (UINib *)nib;

- (void)updateWithCellData:(id)aData;

- (void)renderViews;

@end
