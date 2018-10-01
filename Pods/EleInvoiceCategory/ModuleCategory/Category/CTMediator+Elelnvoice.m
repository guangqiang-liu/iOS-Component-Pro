//
//  CTMediator+Elelnvoice.m
//  ModuleCategory
//
//  Created by 刘光强 on 2018/10/1.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "CTMediator+Elelnvoice.h"

@implementation CTMediator (Elelnvoice)

- (UIViewController *)EleInvoice_ViewControllerWithCallback:(void(^)(NSString *result))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"EleInvoice" action:@"viewController" params:params shouldCacheTarget:NO];
}
@end
