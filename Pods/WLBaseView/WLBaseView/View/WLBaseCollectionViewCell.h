//
//  WLBaseCollectionViewCell.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLBaseCollectionViewCell : UICollectionViewCell

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 * 子类使用的模型对象
 */
@property (nonatomic, strong) id cellModel;

/**
 *  缩进边界
 */
@property (nonatomic, assign) UIEdgeInsets cellEdgeInsets;

/**
 更新Cell上的数据

 @param aData 数据源
 */
- (void)updateWithCellData:(id)aData;

/**
 更新某一行的数据

 @param aData 数据源
 @param indexPath indexPath
 */
- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

/**
 根据数据源获取Cell的Size

 @param aData 数据源
 @return Cell Size
 */
+ (CGSize)sizeForCellData:(id)aData;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 *  功能:获取cell对应的xib
 */
+ (UINib *)nib;

@end
