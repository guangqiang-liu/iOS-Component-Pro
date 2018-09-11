//
//  WLIconFontConfig.m
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import "WLIconFontConfig.h"

@implementation WLIconFontConfig

+ (NSDictionary *)glyphMap {
    return @{
             @"notification_o": @"\U0000e613",
             @"scan_o": @"\U0000e612",
             @"right_arrow_o": @"\U0000e611",
             @"check_unselected_o": @"\U0000e60d",
             @"check_selected_o": @"\U0000e60e",
             @"arrow_down_s": @"\U0000e60f",
             @"wallet_o": @"\U0000e633",
             @"arrow_up_o": @"\U0000e60b",
             @"arrow_down_o": @"\U0000e60a",
             @"tip_o": @"\U0000e608",
             @"unselected_cycyle_o": @"\U0000e609",
             @"selected_cycyle_o": @"\U0000e607",
             @"invoice_detail_state_o": @"\U0000e621",
             @"search_gray_o": @"\U0000e614",
             @"scan_rect_o": @"\U0000e612"
             };
}

+ (NSString *)fontName {
    return @"iconfont";
}

@end
