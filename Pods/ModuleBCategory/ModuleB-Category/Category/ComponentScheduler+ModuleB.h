//
//  ComponentScheduler+ModuleB.h
//  ModuleB-Category
//
//  Created by 刘光强 on 2018/9/14.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ComponentScheduler.h"

@interface ComponentScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback;

@end
