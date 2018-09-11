//
//  WLAlertModal.h
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLAlertModal : UIView

/**
 主标题，如果有主标题就需要给主标题属性赋值
 */
@property (nonatomic, copy) NSString *title;

/**
 副标题，如果有副标题就需要给副标题赋值
 */
@property (nonatomic, copy) NSString *content;
@end
