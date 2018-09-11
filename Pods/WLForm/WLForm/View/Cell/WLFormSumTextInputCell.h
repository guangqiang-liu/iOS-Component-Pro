//
//  WLFormSumTextInputCell.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TextChangeBlock)(NSString *text);

@interface WLFormSumTextInputCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLable;
@property (nonatomic, strong) UITextField *rightInput;
@property (nonatomic, copy) TextChangeBlock textChangeBlock;

@end
