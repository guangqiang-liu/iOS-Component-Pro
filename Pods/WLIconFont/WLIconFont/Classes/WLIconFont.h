//
//  WLIconFont.h
//  IconFont
//
//  Created by 刘光强 on 2018/2/26.
//  Copyright © 2018年 刘光强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLIconFont : NSObject

+ (nullable UIFont *)fontWithSize:(CGFloat)size;

+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

+ (void)setFontName:(NSString *)fontName;

@end

NS_ASSUME_NONNULL_END
