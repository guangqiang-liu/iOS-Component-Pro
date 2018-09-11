//
//  UIImageView+WLSDImage.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WLSDImage)

/**
 设置image的url

 @param url url
 @param placeholderImage placeholderImage
 */
- (void)setImageViewWithUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
@end
