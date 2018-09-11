//
//  WLFormRadioCell.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RadioCellActionBlock)(NSNumber *);

@interface WLFormRadioCell : UITableViewCell

@property (nonatomic, copy) NSDictionary *radioInfo;
@property (nonatomic, copy) RadioCellActionBlock radioCellActionBlock;
@end
