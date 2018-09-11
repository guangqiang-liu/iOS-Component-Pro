//
//  WLFormStepperCell.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLFormStepperCell : UITableViewCell

@property (nonatomic, copy) void(^stepperBlock)(double newValue);

- (void)updateValue:(double)value;
@end
