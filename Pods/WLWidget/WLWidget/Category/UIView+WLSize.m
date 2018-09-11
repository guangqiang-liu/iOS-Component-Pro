//
//  UIView+WLSize.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "UIView+WLSize.h"

@implementation UIView (WLSize)

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font}
                                           context:nil];
    return CGSizeMake(textRect.size.width, textRect.size.height);
}
@end
