//
//  Target_EleInvoice.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/9/12.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "Target_EleInvoice.h"
#import "TargetViewContainer.h"

typedef void(^RouterCallBack)(NSString *);

@interface Target_EleInvoice ()

@property (nonatomic, copy) RouterCallBack callback;
@end

@implementation Target_EleInvoice

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    TargetViewContainer *VC = [[TargetViewContainer alloc] init];
    self.callback = params[@"callback"];
    self.callback(@"这是路由回调的数据");
    return VC;
}

@end
