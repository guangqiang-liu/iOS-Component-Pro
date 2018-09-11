//
//  WLMRecordSearchVC.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WLMEInvoiceRecordSearchBlock) (NSString *);

@interface WLMRecordSearchVC : WLBaseViewController

@property (nonatomic, copy) NSString *searchContent;
@property (nonatomic, copy) WLMEInvoiceRecordSearchBlock invoiceRecordSearchBlock;
@end
