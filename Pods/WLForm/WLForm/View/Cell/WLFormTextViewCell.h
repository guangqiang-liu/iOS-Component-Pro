//
//  WLFormTextViewCell.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/29.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TextChangeBlock)(NSString *text);

@interface WLFormTextViewCell : UITableViewCell

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, copy) TextChangeBlock textChangeBlock;
@end
