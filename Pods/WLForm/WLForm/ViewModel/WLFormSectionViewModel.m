//
//  WLFormSectionViewModel.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSectionViewModel.h"
#import "WLFormItemViewModel.h"

@interface WLFormSectionViewModel ()

@property (nonatomic, strong, readwrite) NSMutableArray <WLFormItemViewModel *> *itemArray;
@end

@implementation WLFormSectionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _headerTitleColor = WLLeftTitleColor;
        _headerTitleFont = WLLeftTitleFont;
        _headerTitleMarginLeft = 15;
        _headerTitleMarginRight = WLMarginRight;
        _headerHeight = WLSectionHeaderHeight;
        _sectionHeaderBgColor = WLSectionHeaderBgColor;
        _headerTopSepLineHeight = 10;
        _headerTopSepLineColor = sepLineColor;
        
        _footerTitleFont = WLLeftTitleFont;
        _footerTitleMarginLeft = WLMarginLeft;
        _footerTitleMarginRight = WLMarginRight;
        _footerHeight = WLSectionFooterHeight;
        _sectionFooterBgColor = WLSectionFooterBgColor;
    }
    return self;
}

- (void)addItem:(WLFormItemViewModel *)item {
    item.section = self;
    [self.itemArray addObject:item];
}

- (void)addItemWithArray:(NSArray <WLFormItemViewModel *> *)itemArray {
    for (WLFormItemViewModel *item in itemArray) {
        [self addItem:item];
    }
}

- (void)setHeaderTitle:(NSString *)headerTitle {
    if (_headerTitle != headerTitle) {
        _headerTitle = headerTitle;
        _headerTitleSize = [self sizeForTitle:headerTitle withFont:_headerTitleFont];
    }
}

- (void)setFooterTitle:(NSString *)footerTitle {
    if (_footerTitle != footerTitle) {
        _footerTitle = footerTitle;
        _footerTitleSize = [self sizeForTitle:footerTitle withFont:_footerTitleFont];
    }
}

- (CGFloat)footerHeight {
    return _footerHeight > 2.0f ? _footerHeight : 0.01f;
}

- (CGFloat)headerHeight {
    return _headerHeight > 2.0f ? _headerHeight : 0.01f;
}

- (NSMutableArray<WLFormItemViewModel *> *)itemArray {
    if (!_itemArray) {
        _itemArray = [[NSMutableArray alloc] init];
    }
    return _itemArray;
}

- (NSUInteger)count {
    return self.itemArray.count;
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font {
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font}
                                           context:nil];
    return CGSizeMake(titleRect.size.width, titleRect.size.height);
}

@end
