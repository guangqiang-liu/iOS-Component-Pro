//
//  WLBaseViewModelProtocol.h
//  WLBaseView
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLBViewModelServiceImpProtocol.h"
@protocol WLBaseViewModelProtocol <NSObject>

@optional
@property (nonatomic, strong, readonly) id<WLBViewModelServiceImpProtocol> service;
@property (nonatomic, copy, readonly) NSDictionary *params;

- (void)initialize;

- (instancetype)initWithService:(id<WLBViewModelServiceImpProtocol>)service params:(NSDictionary *)params;
@end
