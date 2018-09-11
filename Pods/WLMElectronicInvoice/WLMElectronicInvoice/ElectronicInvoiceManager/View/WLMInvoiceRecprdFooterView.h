//
//  WLMInvoiceRecprdFooterView.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FooterButtonCallback)(void);

@interface WLMInvoiceRecprdFooterView : UIView

@property (nonatomic, copy) FooterButtonCallback footerButtonCallback;
@end
