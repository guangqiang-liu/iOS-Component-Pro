//
//  WLFormSectionHeaderView.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSectionHeaderView.h"
#import "WLFormSectionViewModel.h"

@interface WLFormSectionHeaderView()
@property (nonatomic, strong) WLFormSectionViewModel *viewModel;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *topSepLine;

@end

@implementation WLFormSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame viewModel:(WLFormSectionViewModel *)viewModel {
    self = [super initWithFrame:frame];
    if (self) {
        _viewModel = viewModel;
        self.backgroundColor = [UIColor whiteColor];
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.topSepLine];
    [self addSubview:self.titleLable];
}

- (UIView *)topSepLine {
    if (!_topSepLine) {
        _topSepLine = [[UIView alloc] init];
        _topSepLine.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.viewModel.headerHeight > 1 ? self.viewModel.headerTopSepLineHeight : 0);
        _topSepLine.backgroundColor = self.viewModel.headerTopSepLineColor;
    }
    return _topSepLine;
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(15, (self.viewModel.headerHeight +  self.viewModel.headerTopSepLineHeight - self.viewModel.headerTitleSize.height) / 2, self.viewModel.headerTitleSize.width, self.viewModel.headerTitleSize.height);
        _titleLable.text = self.viewModel.headerTitle;
        _titleLable.textColor = self.viewModel.headerTitleColor;
        _titleLable.font = self.viewModel.headerTitleFont;
    }
    return _titleLable;
}

@end
