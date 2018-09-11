//
//  WLBaseView.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseView.h"

@interface WLBaseView()

@property (nonatomic, strong, readwrite) WLBaseViewModel *viewModel;
@end

@implementation WLBaseView

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    WLBaseView *view = [super allocWithZone:zone];
    @weakify(view)
    [[view rac_signalForSelector:@selector(initWithViewModel:)]
     subscribeNext:^(id x) {
         @strongify(view)
         [view renderViews];
         [view bindViewModel];
     }];
    return view;
}

- (instancetype)initWithViewModel:(WLBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)renderViews {
}

- (void)bindViewModel {
}

+ (instancetype)loadXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.viewEdgeInsets.left, frame.origin.y + self.viewEdgeInsets.top, frame.size.width - self.viewEdgeInsets.left - self.viewEdgeInsets.right, frame.size.height - self.viewEdgeInsets.top - self.viewEdgeInsets.bottom);
    [super setFrame:rc];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
