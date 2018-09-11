//
//  WLMPackageSelectView.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/9.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PackageSelectBlock)(NSNumber *);
typedef void(^InvoiceProtocolActionBlock)(void);

@interface WLMPackageSelectView : WLBaseView

@property (nonatomic, copy) PackageSelectBlock packageSelectBlock;
@property (nonatomic, copy) InvoiceProtocolActionBlock invoiceProtocolActionBlock;
@end
