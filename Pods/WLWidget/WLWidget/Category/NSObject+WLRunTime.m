//
//  NSObject+WLRunTime.m
//  WLWidget
//
//  Created by 刘光强 on 2018/5/21.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "NSObject+WLRunTime.h"
#import <objc/runtime.h>

char * const kProtectCrashProtectorName = "kProtectCrashProtector";

void ProtectCrashProtected(id self, SEL sel) {}

@implementation NSObject (WLRunTime)

+ (void)swizzleClassMethodWithOriginSel:(SEL)originSel swizzleSel:(SEL)swizzleSel {
    Class cls = object_getClass(self);
    Method originAddObserverMethod = class_getClassMethod(cls, originSel);
    Method swizzledAddObserverMethod = class_getClassMethod(cls, swizzleSel);
    
    [self swizzleMethodWithOriginSel:originSel oriMethod:originAddObserverMethod swizzleSel:swizzleSel swizzleMethod:swizzledAddObserverMethod class:cls];
}

+ (void)swizzleInstanceMethodWithOriginSel:(SEL)originSel swizzleSel:(SEL)swizzleSel {
    Method originAddObserverMethod = class_getInstanceMethod(self, originSel);
    Method swizzledAddObserverMethod = class_getInstanceMethod(self, swizzleSel);
    [self swizzleMethodWithOriginSel:originSel oriMethod:originAddObserverMethod swizzleSel:swizzleSel swizzleMethod:swizzledAddObserverMethod class:self];
}

+ (void)swizzleMethodWithOriginSel:(SEL)originSel
                         oriMethod:(Method)originMethod
                       swizzleSel:(SEL)swizzleSel
                    swizzleMethod:(Method)swizzleMethod
                             class:(Class)cls {
    BOOL didAddMethod = class_addMethod(cls, originSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzleSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

+ (Class)addMethodToStubClass:(SEL)aSel {
    Class ProtectCrashProtector = objc_getClass(kProtectCrashProtectorName);
    if (!ProtectCrashProtector) {
        ProtectCrashProtector = objc_allocateClassPair([NSObject class], kProtectCrashProtectorName, sizeof([NSObject class]));
        objc_registerClassPair(ProtectCrashProtector);
    }
    class_addMethod(ProtectCrashProtector, aSel, (IMP)ProtectCrashProtected, "v@:");
    return ProtectCrashProtector;
}

+ (BOOL)isMainBundleClass:(Class)cls {
    return cls && [[NSBundle bundleForClass:cls] isEqual:[NSBundle mainBundle]];
}

- (BOOL)isMethodOverride:(Class)cls selector:(SEL)sel {
    IMP clsIMP = class_getMethodImplementation(cls, sel);
    IMP superClsIMP = class_getMethodImplementation([cls superclass], sel);
    return clsIMP != superClsIMP;
}
@end
