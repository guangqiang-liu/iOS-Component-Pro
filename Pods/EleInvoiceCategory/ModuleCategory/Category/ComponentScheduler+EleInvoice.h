//
//  ComponentScheduler+EleInvoice.h
//  ModuleCategory
//
//  Created by 刘光强 on 2018/9/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ComponentScheduler.h"

@interface ComponentScheduler (EleInvoice)

- (UIViewController *)EleInvoice_ViewControllerWithCallback:(void(^)(NSString *result))callback;

@end
