//
//  ComponentScheduler+ModuleB.m
//  ModuleB-Category
//
//  Created by 刘光强 on 2018/9/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ComponentScheduler+ModuleB.h"

@implementation ComponentScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"ModuleB" action:@"viewController" params:params shouldCacheTarget:NO];
}
@end
