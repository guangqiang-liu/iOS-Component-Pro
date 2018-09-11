//
//  WLBaseTableViewCell.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLBaseTableViewCell : UITableViewCell

/**
 * 子类使用的模型对象
 */
@property (nonatomic, strong) id cellModel;

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  缩进边界
 */
@property (nonatomic) UIEdgeInsets cellEdgeInsets;

+ (CGFloat)heightForCellData:(id)aData;

+ (CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

+ (NSString *)cellReuseIdentifier;

+ (UINib *)nib;

+ (id)initTableViewCellWithTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style;

+ (id)loadNibTableViewCellWithTableView:(UITableView *)tableView;

- (void)renderViews;

- (void)updateWithCellData:(id)aData;

- (CGFloat)getCellHeight;

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

@end
