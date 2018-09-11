//
//  WLBaseViewProtocol.h
//  WLBaseView
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLBaseViewModel.h"

@protocol WLBaseViewProtocol <NSObject>

@optional
@property (nonatomic, strong, readonly) WLBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(WLBaseViewModel *)viewModel;

- (void)renderViews;
- (void)bindViewModel;
@end
