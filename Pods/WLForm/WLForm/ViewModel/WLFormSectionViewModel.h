//
//  WLFormSectionViewModel.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WLFormItemViewModel;

@interface WLFormSectionViewModel : NSObject

/// sectionHeader
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, strong) UIColor *headerTitleColor;
@property (nonatomic, assign) UIFont *headerTitleFont;
@property (nonatomic, assign) CGFloat headerTitleMarginLeft;
@property (nonatomic, assign) CGFloat headerTitleMarginRight;
@property (nonatomic, assign) CGSize headerTitleSize;

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UIColor *sectionHeaderBgColor;

@property (nonatomic, assign) CGFloat headerTopSepLineHeight;
@property (nonatomic, strong) UIColor *headerTopSepLineColor;

/// sectionFooter
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, strong) UIColor *footerTitleColor;
@property (nonatomic, assign) UIFont *footerTitleFont;
@property (nonatomic, assign) CGFloat footerTitleMarginLeft;
@property (nonatomic, assign) CGFloat footerTitleMarginRight;
@property (nonatomic, assign) CGSize footerTitleSize;

@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) UIColor *sectionFooterBgColor;

@property (nonatomic, assign) CGFloat footerTopSepLineHeight;
@property (nonatomic, strong) UIColor *footerTopSepLineColor;

@property (nonatomic, assign, getter=isHidden) BOOL hidden;
@property (nonatomic, strong, readonly) NSMutableArray<WLFormItemViewModel *> *itemArray;
@property (nonatomic, assign, readonly) NSUInteger count;

- (void)addItem:(WLFormItemViewModel *)item;
- (void)addItemWithArray:(NSArray<WLFormItemViewModel *> *)itemArray;

@end
