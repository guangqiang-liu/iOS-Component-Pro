//
//  ComponentScheduler.h
//  ComponentScheduler
//
//  Created by 刘光强 on 2018/9/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ComponentScheduler : NSObject

+ (instancetype)sharedInstance;

- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end
