//
//  WLFormItemViewModel.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WLFormSectionViewModel;

typedef void(^ItemConfigCompletion)(void);

extern NSString *kValidateRetKey;
extern NSString *kValidateMsgKey;

static inline NSDictionary *itemValid() {
    return @{kValidateRetKey: @YES};
}

static inline NSDictionary *itemInvalid(NSString *msg) {
    return @{kValidateMsgKey: msg ?: @"",
             kValidateRetKey: @NO};
}

@interface WLFormItemViewModel : NSObject

@property (nonatomic, assign) BOOL hasTopSep;
@property (nonatomic, assign) CGFloat topSepLineMarginLeft;
@property (nonatomic, assign) CGFloat topSepLineMarginRight;

@property (nonatomic, assign) BOOL hasBottomSep;
@property (nonatomic, assign) CGFloat bottomSepLineMarginLeft;
@property (nonatomic, assign) CGFloat bottomSepLineMarginRight;

@property (nonatomic, assign, readonly) UITableViewCellStyle style;
@property (nonatomic, copy, readonly) NSString *reuseIdentifier;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign, getter=isHidden) BOOL hidden;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, copy) NSString *nibName;
@property (nonatomic, strong) id value;
@property (nonatomic, copy) NSString *placeholderValue;

@property (nonatomic, copy) void(^itemConfigBlock)(id cell, id value, NSIndexPath *indexPath);
@property (nonatomic, copy) ItemConfigCompletion(^itemConfigBlockWithCompletion)(id cell, id value, NSIndexPath *indexPath);

@property (nonatomic, copy) void(^cellExtraInitBlock)(id cell, id value, NSIndexPath *indexPath);

@property (nonatomic, copy) NSDictionary *(^valueValidateBlock)(id value);
@property (nonatomic, copy) void(^didSelectBlock)(NSIndexPath *indexPath, id value);
@property (nonatomic, copy) void(^didSelectCellBlock)(NSIndexPath *indexPath, id value, id cell);
@property (nonatomic, copy) void(^reformResRetBlock)(id ret, id value);
@property (nonatomic, copy) id(^requestParamsConfigBlock)(id value);

@property (nonatomic, copy) NSDictionary *(^enableValidateBlock)(id value, BOOL didClick);
@property (nonatomic, copy) NSDictionary *(^disableValidateBlock)(id value, BOOL didClick);

@property (nonatomic, weak) WLFormSectionViewModel *section;

- (instancetype)initFormItemWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
