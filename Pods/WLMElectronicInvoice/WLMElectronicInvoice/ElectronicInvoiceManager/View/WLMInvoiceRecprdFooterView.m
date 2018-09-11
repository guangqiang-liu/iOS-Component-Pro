//
//  WLMInvoiceRecprdFooterView.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceRecprdFooterView.h"
#import "WLMRecordFiltrVC.h"

@interface WLMInvoiceRecprdFooterView ()

@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UIButton *recordFilterBtn;
@end

@implementation WLMInvoiceRecprdFooterView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self addSubview:self.footView];
    [self.footView addSubview:self.recordFilterBtn];
}

#pragma mark - getter\setter
- (UIView *)footView {
    if (!_footView) {
        _footView = [[UIView alloc] init];
        _footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    }
    return _footView;
}

- (UIButton *)recordFilterBtn {
    if (!_recordFilterBtn) {
        _recordFilterBtn = [[UIButton alloc] init];
        _recordFilterBtn.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, 16, 100, 18);
        [_recordFilterBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        [_recordFilterBtn setTitleColor:textGrayColor forState:UIControlStateNormal];
        _recordFilterBtn.titleLabel.font = SYS_FONT(14);
        [_recordFilterBtn setImage:[WLIcon iconWithName:@"right_arrow_o" size:15 color:HexRGB(0xdedede)] forState:UIControlStateNormal];
        [_recordFilterBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:5];
        [_recordFilterBtn addTarget:self action:@selector(recordFilterClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recordFilterBtn;
}

- (void)recordFilterClicked:(UIButton *)button {
    !self.footerButtonCallback ?: self.footerButtonCallback();
}

@end
