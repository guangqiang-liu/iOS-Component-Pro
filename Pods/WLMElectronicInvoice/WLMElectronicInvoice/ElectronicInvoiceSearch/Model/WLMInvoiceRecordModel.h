//
//  WLMInvoiceRecordModel.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/28.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLMInvoiceRecordModel : WLBaseModel

@property (nonatomic, copy) NSString *invoiceAmount;
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, copy) NSString *invoiceDate;
@property (nonatomic, copy) NSString *invoiceState;
@property (nonatomic, copy) NSString *sampleImage;
@end
