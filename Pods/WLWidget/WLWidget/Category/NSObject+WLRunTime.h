//
//  NSObject+WLRunTime.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WLRunTime)

+ (void)swizzleClassMethodWithOriginSel:(SEL)originSel swizzleSel:(SEL)swizzleSel;

+ (void)swizzleInstanceMethodWithOriginSel:(SEL)originSel swizzleSel:(SEL)swizzleSel;

+ (Class)addMethodToStubClass:(SEL)aSel;

+ (BOOL)isMainBundleClass:(Class)cls;

- (BOOL)isMethodOverride:(Class)cls selector:(SEL)sel;

@end
