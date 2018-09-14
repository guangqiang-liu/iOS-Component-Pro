//
//  Target_ModuleB.m
//  ModuleB-Component
//
//  Created by 刘光强 on 2018/9/13.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "Target_ModuleB.h"
#import "ModuleBViewController.h"

@implementation Target_ModuleB

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    ModuleBViewController *VC = [[ModuleBViewController alloc] init];
    return VC;
}

@end
