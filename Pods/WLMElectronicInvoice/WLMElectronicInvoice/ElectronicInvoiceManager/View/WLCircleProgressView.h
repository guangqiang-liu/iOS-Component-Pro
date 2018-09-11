//
//  WLCircleProgressView.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLCircleProgressView : UIView


/**
 环行进度条的当前进度百分比
 */
@property (nonatomic, copy) NSNumber *progress;


/**
 初始化环形进度条

 @param frame 进度条的frame
 @param width 环形的线宽
 @param CGColors 环形进度条的渐变颜色
 @return 进度条实例
 */
- (instancetype)initWithFrame:(CGRect)frame circleWidth:(CGFloat)width gradientCGColors:(NSArray *)CGColors;
@end
