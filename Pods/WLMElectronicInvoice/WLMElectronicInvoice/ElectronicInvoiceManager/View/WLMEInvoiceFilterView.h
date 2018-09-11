//
//  WLMEInvoiceFilterView.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/15.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLMEInvoiceFilterView : UIView

@property (nonatomic, copy) void (^clickedItemCallback)(NSInteger state);
@property (nonatomic, assign) BOOL isShowing;

- (void)show;
- (void)dismiss;

@end


@interface WLMEInvoiceCustomFilterButton : UIButton

@end
