//
//  WLConst.h
//  WLStaticList
//
//  Created by 刘光强 on 2018/4/26.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#ifndef WLConst_h
#define WLConst_h

#define SELF_BUNDLE [NSBundle bundleForClass:[self class]]
#define UIImageName(x) [UIImage imageNamed:x inBundle:SELF_BUNDLE compatibleWithTraitCollection:nil]

#define WEAK_SELF __weak typeof(self) weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf) self = weakSelf

#endif /* WLConst_h */
