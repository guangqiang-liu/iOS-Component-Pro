//
//  WLBaseTableViewCell.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseTableViewCell.h"

#define IOS_SDK_MORE_THAN_OR_EQUAL(__num) [UIDevice currentDevice].systemVersion.floatValue >= (__num)

@implementation WLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (IOS_SDK_MORE_THAN_OR_EQUAL(7.0)) {
            self.separatorInset = UIEdgeInsetsZero;
        }
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderViews];
    }
    return self;
}

- (void)setCellModel:(id)cellModel {
    _cellModel = cellModel;
}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.cellEdgeInsets.left, frame.origin.y + self.cellEdgeInsets.top, frame.size.width - self.cellEdgeInsets.left - self.cellEdgeInsets.right, frame.size.height - self.cellEdgeInsets.top - self.cellEdgeInsets.bottom);
    [super setFrame:rc];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib *)nib {
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData {}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath {}

+ (CGFloat)heightForCellData:(id)aData {
    return 0;
}

- (CGFloat)getCellHeight {
    [self layoutIfNeeded];
    [self updateConstraintsIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

+ (CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (UITableView *)__getTableView {
    static int level = 10;
    UITableView *tableView = nil;
    UIView *view = self.superview;
    for (int i = 0; i < level; i++) {
        if ([view isKindOfClass:[UITableView class]]) {
            tableView = (UITableView *)view;
            break;
        }
        if (view.superview) {
            view = view.superview;
        } else {
            break;
        }
    }
    return tableView;
}

- (NSIndexPath *)indexPath {
    if (_indexPath) {
        return _indexPath;
    }
    _indexPath = [[self __getTableView] indexPathForCell:self];
    return _indexPath;
}

+ (id)initTableViewCellWithTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style {
    id cell = [tableView dequeueReusableCellWithIdentifier:[self cellReuseIdentifier]];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:style reuseIdentifier:[self cellReuseIdentifier]];
    }
    return cell;
}

+ (id)loadNibTableViewCellWithTableView:(UITableView *)tableView {
    id cell = [tableView dequeueReusableCellWithIdentifier:[self cellReuseIdentifier]];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:[self cellReuseIdentifier] owner:nil options:nil]lastObject];
    }
    return cell;
}

- (void)dealloc {}

- (void)renderViews{};

@end
