//
//  WLMRecordListCell.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLMInvoiceRecordModel;

@interface WLMRecordListCell : UITableViewCell

@property (nonatomic, strong) WLMInvoiceRecordModel *model;

+ (CGFloat)cellHeight;
@end
