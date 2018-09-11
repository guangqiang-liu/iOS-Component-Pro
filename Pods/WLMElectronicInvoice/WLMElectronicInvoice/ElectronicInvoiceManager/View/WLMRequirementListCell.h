//
//  WLMRequirementListCell.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MerchantModel;

@interface WLMRequirementListCell : UITableViewCell

@property (nonatomic, strong) MerchantModel *merchantModel;

+ (CGFloat)cellHeight;

@end
