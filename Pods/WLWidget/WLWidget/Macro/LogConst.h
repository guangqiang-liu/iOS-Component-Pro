//
//  LogConst.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/5.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#ifndef LogConst_h
#define LogConst_h

#ifdef DEBUG
    #define NSLog(FORMAT, ...) fprintf(stderr, "%s:%d\t%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ## __VA_ARGS__] UTF8String]);
#else
    #define NSLog(FORMAT, ...) nil
#endif

#endif /* LogConst_h */
