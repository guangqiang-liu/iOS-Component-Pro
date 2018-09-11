//
//  WLMSearchInvoiceItemVC.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/28.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLMSelectInvoiceItemModel;

typedef void(^SelectInvoiceItemBlock)(WLMSelectInvoiceItemModel *model);
@interface WLMSearchInvoiceItemVC : WLBaseViewController

@property (nonatomic, copy) SelectInvoiceItemBlock selectInvoiceItemBlock;
@end
