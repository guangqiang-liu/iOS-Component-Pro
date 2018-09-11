//
//  UITableViewCell+Extention.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UITableViewCell+Extention.h"
#import "WLFormItemViewModel.h"

#define kTopLineViewTag 90000001
#define kBottomLineViewTag 90000002
#define kTouchButtonViewTag 90000003
#define kScreenScale [[UIScreen mainScreen] scale]
#define PIXEL_INTEGRAL(pointValue) (round(pointValue * kScreenScale) / kScreenScale)
#define kSeparatorLineWidth PIXEL_INTEGRAL(1)

@implementation UITableViewCell (Extention)

- (void)updateCellSep:(BOOL)isTop isBottom:(BOOL)isBottom viewModel:(WLFormItemViewModel *)viewModel {
    UILabel *topLine = [self viewWithTag:kTopLineViewTag];
    UILabel *bottomLine = [self viewWithTag:kBottomLineViewTag];
    if (!topLine) {
        UIColor *color = [UIColor colorWithRed:0.929412 green:0.929412 blue:0.929412 alpha:1];
        topLine = [[UILabel alloc] init];
        topLine.backgroundColor = color;
        topLine.tag = kTopLineViewTag;
    }
    [self.contentView addSubview:topLine];
    if (!bottomLine) {
        UIColor *color = [UIColor colorWithRed:0.929412 green:0.929412 blue:0.929412 alpha:1];
        bottomLine = [[UILabel alloc] init];
        bottomLine.backgroundColor = color;
        bottomLine.tag = kBottomLineViewTag;
    }
    [self.contentView addSubview:bottomLine];
    topLine.frame = CGRectMake(viewModel.topSepLineMarginLeft, 0, self.frame.size.width, kSeparatorLineWidth);
    bottomLine.frame = CGRectMake(viewModel.bottomSepLineMarginLeft, self.frame.size.height - kSeparatorLineWidth, self.frame.size.width - viewModel.bottomSepLineMarginLeft, kSeparatorLineWidth);
    topLine.hidden = !isTop;
    bottomLine.hidden = !isBottom;
}

- (void)updateCellTouchWithIndexPath:(NSIndexPath *)indexPath target:(id)target action:(SEL)action enable:(BOOL)enable {
    UIButton *button = [self viewWithTag:kTouchButtonViewTag];
    if (!button) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = self.bounds;
        button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        button.tag = kTouchButtonViewTag;
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    button.userInteractionEnabled = !enable;
}
@end
