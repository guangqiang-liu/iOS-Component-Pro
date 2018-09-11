//
//  WLMPackageInfoVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMPackageInfoVC.h"
#import "WLMInvoiceQRCodeListVC.h"

#define SYS_FONT(x) [UIFont systemFontOfSize:x]

@interface WLMPackageInfoVC ()

@property (nonatomic, strong) UIImageView *bgImgView;
@property (nonatomic, strong) UILabel *typeLabel;   //套餐类型
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *amountLabel; //已开金额
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIButton *invoiceBtn;
@property (nonatomic, strong) UIView *whiteDot;
@property (nonatomic, strong) UILabel *reminderLabel;
@property (nonatomic, strong) UILabel *usedPaperLabel;
@property (nonatomic, strong) UILabel *surplusPaperLabel;
@end

@implementation WLMPackageInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = bgColor;
    
    [self setupViews];
}

- (void)setupViews {
    [self dataInitialize];
    [self setupSubViews];
}

- (void)dataInitialize {
}

- (void)setupSubViews {
    [self.view addSubview:self.bgImgView];
    [self.bgImgView addSubview:self.typeLabel];
    [self.bgImgView addSubview:self.topLine];
    [self.bgImgView addSubview:self.amountLabel];
    [self.bgImgView addSubview:self.bottomLine];

    [self.view addSubview:self.progressView];
    [self.view addSubview:self.whiteDot];
    [self.progressView addSubview:self.reminderLabel];
    [self.progressView addSubview:self.usedPaperLabel];
    [self.progressView addSubview:self.surplusPaperLabel];
    
    [self.view addSubview:self.invoiceBtn];

    [self.amountLabel setSpecificTextWithText:@"50,000" color:textBlackColor font:HB28];
    
//    self.progressView.progress = @(0.8);
}

#pragma mark - getter\setter
- (UIImageView *)bgImgView {
    if (_bgImgView == nil) {
        UIImage *image = UIImageName(@"einvoice_package_info");
        _bgImgView = [[UIImageView alloc] initWithImage:image];
        _bgImgView.frame = CGRectMake(8, 10, SCREEN_WIDTH - 16, image.size.height);
    }
    return _bgImgView;
}

- (UILabel *)typeLabel {
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.frame = CGRectMake(SCREEN_WIDTH / 3, 15, 200, 30);
        _typeLabel.textColor = RGB(67, 67, 67);
        _typeLabel.font = SYS_FONT(16);
        _typeLabel.text = @"套餐类型：套餐A";
    }
    return _typeLabel;
}

- (UIView *)topLine {
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        _topLine.frame = CGRectMake(15, 55, WIDTH(self.bgImgView) - 30, 0.5);
        [_topLine drawDashLineWithLineHeight:1 dashLineWidth:@4 dashLineSpace:@5 lineColor:HexRGB(0xDEDEDE)];
    }
    return _topLine;
}

- (UILabel *)amountLabel {
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc] init];
        _amountLabel.frame = CGRectMake((WIDTH(self.bgImgView) - 200) / 2, 70, 200, 30);
        _amountLabel.textColor = RGB(67, 67, 67);
        _amountLabel.font = SYS_FONT(16);
        _amountLabel.text = @"已开金额：50,000 元";
    }
    return _amountLabel;
}

- (UIView *)bottomLine {
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.frame = CGRectMake(15, 115, WIDTH(self.bgImgView) - 30, 0.5);
        [_bottomLine drawDashLineWithLineHeight:1 dashLineWidth:@4 dashLineSpace:@5 lineColor:HexRGB(0xDEDEDE)];
    }
    return _bottomLine;
}

- (WLCircleProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[WLCircleProgressView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 75, 135, 150, 150) circleWidth:10 gradientCGColors:@[(id)HexRGB(0x72D7FF).CGColor, (id)HexRGB(0x4B77FF).CGColor]];
    }
    return _progressView;
}

- (UIView *)whiteDot {
    if (!_whiteDot) {
        _whiteDot = [[UIView alloc] init];
        _whiteDot.frame = CGRectMake((WIDTH(self.bgImgView) + 10) / 2, 137, 6, 6);
        _whiteDot.layer.cornerRadius = 3;
        _whiteDot.backgroundColor = white_color;
    }
    return _whiteDot;
}

- (UILabel *)reminderLabel {
    if (_reminderLabel == nil) {
        _reminderLabel = [[UILabel alloc] init];
        _reminderLabel.frame = CGRectMake(self.progressView.frame.size.width / 2 - 40, 50, 80, 10);
        _reminderLabel.textColor = RGB(67, 67, 67);
        _reminderLabel.font = SYS_FONT(12);
        _reminderLabel.textAlignment = NSTextAlignmentCenter;
        _reminderLabel.text = @"已开票(张)";
    }
    return _reminderLabel;
}

- (UILabel *)usedPaperLabel {
    if (_usedPaperLabel == nil) {
        _usedPaperLabel = [[UILabel alloc] init];
        _usedPaperLabel.frame = CGRectMake(self.progressView.frame.size.width / 2 - 40, 70, 80, 10);
        _usedPaperLabel.textColor = RGB(67, 67, 67);
        _usedPaperLabel.font = SYS_FONT(12);
        _usedPaperLabel.textAlignment = NSTextAlignmentCenter;
        _usedPaperLabel.text = @"52,500";
    }
    return _usedPaperLabel;
}

- (UILabel *)surplusPaperLabel {
    if (_surplusPaperLabel == nil) {
        _surplusPaperLabel = [[UILabel alloc] init];
        _surplusPaperLabel.frame = CGRectMake(self.progressView.frame.size.width / 2 - 40, 90, 80, 10);
        _surplusPaperLabel.textColor = RGB(67, 67, 67);
        _surplusPaperLabel.font = SYS_FONT(14);
        _surplusPaperLabel.textAlignment = NSTextAlignmentCenter;
        _surplusPaperLabel.text = @"剩余17500";
    }
    return _surplusPaperLabel;
}

- (UIButton *)invoiceBtn {
    if (_invoiceBtn == nil) {
        _invoiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _invoiceBtn.frame = CGRectMake(16, 330, SCREEN_WIDTH - 32, 44);
        _invoiceBtn.titleLabel.font = SYS_FONT(18);
        _invoiceBtn.layer.cornerRadius = 2;
        _invoiceBtn.layer.masksToBounds = YES;
        [_invoiceBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        [_invoiceBtn setTitle:@"绑定开票码" forState:UIControlStateNormal];
        [_invoiceBtn createGradientButtonWithSize:CGSizeMake(SCREEN_WIDTH, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
        [_invoiceBtn whenTapped:^{
            UIViewController *currentVC = [self.view getCurrentViewController];
            WLMInvoiceQRCodeListVC *vc = [[WLMInvoiceQRCodeListVC alloc] init];
            [currentVC.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _invoiceBtn;
}

#pragma mark - funciton

- (void)addInfoSubviews:(NSArray *)subviews type:(NSString *)type {
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view isKindOfClass:[UIView class]]) {
            if ([type isEqualToString:@"imgView"]) {
                [self.bgImgView addSubview:view];
            } else if ([type isEqualToString:@"progressView"]) {
                [self.progressView addSubview:view];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
