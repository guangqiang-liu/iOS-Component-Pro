//
//  WLFormItemViewModel.m
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormItemViewModel.h"

NSString *kValidateRetKey = @"kValidateRetKey";
NSString *kValidateMsgKey = @"kValidateMsgKey";

@interface WLFormItemViewModel()
@end

@implementation WLFormItemViewModel

- (instancetype)initFormItemWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super init];
    if (self) {
        _style = style;
        _reuseIdentifier = reuseIdentifier;
        _hasTopSep = NO;
        _hasBottomSep = YES;
        _itemHeight = WLCellHeight;
        _topSepLineMarginLeft = WLMarginLeft;
        _topSepLineMarginRight = WLMarginRight;
        _bottomSepLineMarginLeft = WLMarginLeft;
        _bottomSepLineMarginRight = WLMarginRight;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"row dealloc %@", self);
}
@end
