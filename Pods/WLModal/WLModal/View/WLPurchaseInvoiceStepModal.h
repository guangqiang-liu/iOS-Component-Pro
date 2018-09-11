//
//  WLPurchaseInvoiceStepModal.h
//  WLModalComponent
//
//  Created by 刘光强 on 2018/5/8.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CloseModalActionBlock)(void);

@interface WLPurchaseInvoiceStepModal : UIView

@property (nonatomic, copy) CloseModalActionBlock closeModalActionBlock;
@end
