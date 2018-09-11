//
//  FontConst.h
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#ifndef FontConst_h
#define FontConst_h

/// 设置字体
#define SYS_FONT(x) [UIFont systemFontOfSize:x]
#define BS_FONT(x) [UIFont boldSystemFontOfSize:x]

#define FONT_PingFang_Light(x) (SYSTEM_VERSION >= 9 ? [UIFont fontWithName:@"PingFangSC-Light" size:x] : SYS_FONT(x))
#define FONT_PingFang_Regular(x) (SYSTEM_VERSION >= 9 ? [UIFont fontWithName:@"PingFangSC-Regular" size:x] : SYS_FONT(x))
#define FONT_PingFang_Bold(x) (SYSTEM_VERSION >= 9 ? [UIFont fontWithName:@"PingFangSC-Medium" size:x] : BS_FONT(x))

/// 正常字体
#define H36 [UIFont systemFontOfSize:36]
#define H35 [UIFont systemFontOfSize:35]
#define H34 [UIFont systemFontOfSize:34]
#define H33 [UIFont systemFontOfSize:33]
#define H32 [UIFont systemFontOfSize:32]
#define H31 [UIFont systemFontOfSize:31]
#define H30 [UIFont systemFontOfSize:30]
#define H29 [UIFont systemFontOfSize:29]
#define H28 [UIFont systemFontOfSize:28]
#define H27 [UIFont systemFontOfSize:27]
#define H26 [UIFont systemFontOfSize:26]
#define H25 [UIFont systemFontOfSize:25]
#define H24 [UIFont systemFontOfSize:24]
#define H23 [UIFont systemFontOfSize:23]
#define H22 [UIFont systemFontOfSize:22]
#define H21 [UIFont systemFontOfSize:21]
#define H20 [UIFont systemFontOfSize:20]
#define H19 [UIFont systemFontOfSize:19]
#define H18 [UIFont systemFontOfSize:18]
#define H17 [UIFont systemFontOfSize:17]
#define H16 [UIFont systemFontOfSize:16]
#define H15 [UIFont systemFontOfSize:15]
#define H14 [UIFont systemFontOfSize:14]
#define H13 [UIFont systemFontOfSize:13]
#define H12 [UIFont systemFontOfSize:12]
#define H11 [UIFont systemFontOfSize:11]
#define H10 [UIFont systemFontOfSize:10]
#define H9  [UIFont systemFontOfSize:9]
#define H8  [UIFont systemFontOfSize:8]

/// 粗体
#define HB36 [UIFont boldSystemFontOfSize:36]
#define HB35 [UIFont boldSystemFontOfSize:35]
#define HB34 [UIFont boldSystemFontOfSize:34]
#define HB33 [UIFont boldSystemFontOfSize:33]
#define HB32 [UIFont boldSystemFontOfSize:32]
#define HB31 [UIFont boldSystemFontOfSize:31]
#define HB30 [UIFont boldSystemFontOfSize:30]
#define HB29 [UIFont boldSystemFontOfSize:29]
#define HB28 [UIFont boldSystemFontOfSize:28]
#define HB27 [UIFont boldSystemFontOfSize:27]
#define HB26 [UIFont boldSystemFontOfSize:26]
#define HB25 [UIFont boldSystemFontOfSize:25]
#define HB24 [UIFont boldSystemFontOfSize:24]
#define HB23 [UIFont boldSystemFontOfSize:23]
#define HB22 [UIFont boldSystemFontOfSize:22]
#define HB21 [UIFont boldSystemFontOfSize:21]
#define HB20 [UIFont boldSystemFontOfSize:20]
#define HB19 [UIFont boldSystemFontOfSize:19]
#define HB18 [UIFont boldSystemFontOfSize:18]
#define HB17 [UIFont boldSystemFontOfSize:17]
#define HB16 [UIFont boldSystemFontOfSize:16]
#define HB15 [UIFont boldSystemFontOfSize:15]
#define HB14 [UIFont boldSystemFontOfSize:14]
#define HB13 [UIFont boldSystemFontOfSize:13]
#define HB12 [UIFont boldSystemFontOfSize:12]
#define HB11 [UIFont boldSystemFontOfSize:11]
#define HB10 [UIFont boldSystemFontOfSize:10]
#define HB9  [UIFont boldSystemFontOfSize:9]
#define HB8  [UIFont boldSystemFontOfSize:8]

#endif /* FontConst_h */
