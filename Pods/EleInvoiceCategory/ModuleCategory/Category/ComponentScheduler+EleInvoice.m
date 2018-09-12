//
//  ComponentScheduler+EleInvoice.m
//  ModuleCategory
//
//  Created by 刘光强 on 2018/9/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ComponentScheduler+EleInvoice.h"

@implementation ComponentScheduler (EleInvoice)

- (UIViewController *)EleInvoice_ViewControllerWithCallback:(void(^)(NSString *result))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"EleInvoice" action:@"viewController" params:params shouldCacheTarget:NO];
}

@end
