//
//  CTMediator+ModuleB.h
//  ModuleB-Category
//
//  Created by 刘光强 on 2018/10/1.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "CTMediator.h"

@interface CTMediator (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback;

@end
