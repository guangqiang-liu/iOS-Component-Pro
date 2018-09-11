//
//  RectConst.h
//  WLWidget
//
//  Created by 刘光强 on 2018/5/22.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#ifndef RectConst_h
#define RectConst_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds

#define IS_IphoneX (SCREEN_HEIGHT == 812.0)

#define X(v) (v).frame.origin.x
#define Y(v) (v).frame.origin.y
#define WIDTH(v) (v).frame.size.width
#define HEIGHT(v) (v).frame.size.height

#define MinX(v) CGRectGetMinX((v).frame)
#define MinY(v) CGRectGetMinY((v).frame)
#define MidX(v) CGRectGetMidX((v).frame)
#define MidY(v) CGRectGetMidY((v).frame)
#define MaxX(v) CGRectGetMaxX((v).frame)
#define MaxY(v) CGRectGetMaxY((v).frame)

/// 设计规范
#define TABBAR_HEIGHT 49
#define NAVBAR_HEIGHT (IS_IphoneX ? 88 : 64)
#define SAFE_AREA (SCREEN_HEIGHT - NAVBAR_HEIGHT)

#endif /* RectConst_h */
