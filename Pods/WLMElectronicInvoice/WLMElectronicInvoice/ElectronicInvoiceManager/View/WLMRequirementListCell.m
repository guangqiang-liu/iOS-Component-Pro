//
//  WLMRequirementListCell.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMRequirementListCell.h"

static const CGFloat kRequirementHeight = 156.f;

@interface WLMRequirementListCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *invoicePrice;
@property (nonatomic, strong) UILabel *invoiceTitle;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *rejectBtn;
@property (nonatomic, strong) UIButton *invoiceBtn;
@property (nonatomic, strong) UIImageView *RequirementImg;

@end

@implementation WLMRequirementListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = bgColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.invoicePrice];
    [self.bgView addSubview:self.invoiceTitle];
    [self.bgView addSubview:self.lineView];
    [self.bgView addSubview:self.rejectBtn];
    [self.bgView addSubview:self.invoiceBtn];
    [self.bgView addSubview:self.RequirementImg];
}

- (void)setMerchantModel:(WLBaseModel *)merchantModel {
    
}

+ (CGFloat)cellHeight; {
    return kRequirementHeight;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(15, 4, SCREEN_WIDTH - 30, 148);
        _bgView.backgroundColor = white_color;
        _bgView.layer.cornerRadius = 5;
        
        _bgView.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        _bgView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f); //[水平偏移, 垂直偏移]
        _bgView.layer.shadowOpacity = 0.2f; // 0.0 ~ 1.0 的值
        _bgView.layer.shadowRadius = 4.0f; // 阴影发散的程度
        _bgView.clipsToBounds = NO;
    }
    return _bgView;
}

- (UILabel *)invoiceTitle {
    if (!_invoiceTitle) {
        _invoiceTitle = [[UILabel alloc] init];
        _invoiceTitle.frame = CGRectMake(16, 16, 240, 22);
        _invoiceTitle.textColor = RGB(67, 67, 67);
        _invoiceTitle.font = SYS_FONT(14);
        _invoiceTitle.textAlignment = NSTextAlignmentLeft;
        _invoiceTitle.text = @"xxx科技有限公司上分公司";
    }
    return _invoiceTitle;
}

- (UILabel *)invoicePrice {
    if (!_invoicePrice) {
        _invoicePrice = [[UILabel alloc] init];
        _invoicePrice.frame = CGRectMake(16, 46, 240, 18);
        _invoicePrice.textColor = RGB(153, 153, 153);
        _invoicePrice.font = SYS_FONT(14);
        _invoicePrice.textAlignment = NSTextAlignmentLeft;
        _invoicePrice.text = @"申请时间：2018.4.18";
    }
    return _invoicePrice;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(16, 76, SCREEN_WIDTH - 62, 0.5);
        [_lineView drawDashLineWithLineHeight:1 dashLineWidth:@4 dashLineSpace:@5 lineColor:HexRGB(0xDEDEDE)];
    }
    return _lineView;
}

- (UIButton *)rejectBtn {
    if (!_rejectBtn) {
        _rejectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rejectBtn.frame = CGRectMake(16, 94, 102, 38);
        _rejectBtn.titleLabel.font = SYS_FONT(14);
        [_rejectBtn setTitle:@"驳回" forState:UIControlStateNormal];
        [_rejectBtn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        
        _rejectBtn.layer.cornerRadius = 4;
        _rejectBtn.layer.borderColor = RGB(222, 222, 222).CGColor;
        _rejectBtn.layer.borderWidth = 1.0;
    }
    return _rejectBtn;
}

- (UIButton *)invoiceBtn {
    if (!_invoiceBtn) {
        _invoiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _invoiceBtn.frame = CGRectMake(126, 94, SCREEN_WIDTH - 172, 38);
        _invoiceBtn.titleLabel.font = SYS_FONT(14);
        [_invoiceBtn setTitle:@"开票" forState:UIControlStateNormal];
        [_invoiceBtn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        
        _invoiceBtn.layer.cornerRadius = 4;
        _invoiceBtn.layer.borderColor = RGB(222, 222, 222).CGColor;
        _invoiceBtn.layer.borderWidth = 1.0;
    }
    return _invoiceBtn;
}

- (UIImageView *)RequirementImg {
    if (!_RequirementImg) {
        _RequirementImg = [[UIImageView alloc] init];
        _RequirementImg.frame = CGRectMake(SCREEN_WIDTH - 98, 0, 68, 68);
        _RequirementImg.image = UIImageName(@"einvoice_mange_sample");
    }
    return _RequirementImg;
}

@end
