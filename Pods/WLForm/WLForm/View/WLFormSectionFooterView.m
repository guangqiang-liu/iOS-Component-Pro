//
//  WLFormSectionFooterView.m
//  WLForm
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLFormSectionFooterView.h"
#import "WLFormSectionViewModel.h"

@interface WLFormSectionFooterView()
@property (nonatomic, strong) WLFormSectionViewModel *viewModel;
@property (nonatomic, strong) UILabel *titleLable;
@end

@implementation WLFormSectionFooterView

- (instancetype)initWithFrame:(CGRect)frame viewModel:(WLFormSectionViewModel *)viewModel {
    self = [super initWithFrame:frame];
    if (self) {
        _viewModel = viewModel;
        self.backgroundColor = viewModel.sectionFooterBgColor;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.titleLable];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(self.viewModel.footerTitleMarginLeft, (self.viewModel.footerHeight - self.viewModel.footerTitleSize.height) / 2, self.viewModel.footerTitleSize.width, self.viewModel.footerTitleSize.height);
        _titleLable.text = self.viewModel.footerTitle;
        _titleLable.textColor = self.viewModel.footerTitleColor;
        _titleLable.font = self.viewModel.footerTitleFont;
    }
    return _titleLable;
}
@end
