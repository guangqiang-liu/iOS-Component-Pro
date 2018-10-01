//
//  CTMediator+Elelnvoice.h
//  ModuleCategory
//
//  Created by 刘光强 on 2018/10/1.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "CTMediator.h"

@interface CTMediator (Elelnvoice)

- (UIViewController *)EleInvoice_ViewControllerWithCallback:(void(^)(NSString *result))callback;
@end
