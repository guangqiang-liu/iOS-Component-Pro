//
//  WLFormMoreInfoCell.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MoreInfoBlock)(void);

@interface WLFormMoreInfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, copy) MoreInfoBlock moreInfoBlock;
@end
