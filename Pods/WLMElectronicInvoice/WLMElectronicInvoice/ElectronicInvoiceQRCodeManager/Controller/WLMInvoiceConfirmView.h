//
//  WLMInvoiceConfirmView.h
//  WLMElectronicInvoice
//
//  Created by Saturday on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WLMEInvoiceConfirmBlock) (NSString *);

@interface WLMInvoiceConfirmView : UIView

@property (nonatomic, copy) WLMEInvoiceConfirmBlock invoiceConfirmBlock;

@end
