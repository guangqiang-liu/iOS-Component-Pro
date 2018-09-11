//
//  WLMRecordListCell.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMRecordListCell.h"
#import "WLMInvoiceRecordModel.h"

static const CGFloat kRecordHeight = 140.f;

@interface WLMRecordListCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *invoicePrice;
@property (nonatomic, strong) UILabel *invoiceTitle;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *applyTime;
@property (nonatomic, strong) UILabel *invoiceStatus;
@property (nonatomic, strong) UIImageView *recordImg;
@end

@implementation WLMRecordListCell

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
    [self.bgView addSubview:self.applyTime];
    [self.bgView addSubview:self.invoiceStatus];
    [self.bgView addSubview:self.recordImg];
}

- (void)setModel:(WLMInvoiceRecordModel *)model {
    _model = model;
    self.invoicePrice.text = model.invoiceAmount;
    self.invoiceTitle.text = model.companyName;
    self.applyTime.text = model.invoiceDate;
    self.invoiceStatus.text = model.invoiceState;
}

+ (CGFloat)cellHeight; {
    return kRecordHeight;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(15, 4, SCREEN_WIDTH - 30, 132);
        _bgView.backgroundColor = white_color;
        _bgView.layer.cornerRadius = 5;
        _bgView.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        _bgView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f); //[水平偏移, 垂直偏移]
        _bgView.layer.shadowOpacity = 0.2f; // 0.0 ~ 1.0 的值
        _bgView.layer.shadowRadius = 4.0f; // 阴影发散的程度
    }
    return _bgView;
}

- (UILabel *)invoicePrice {
    if (!_invoicePrice) {
        _invoicePrice = [[UILabel alloc] init];
        _invoicePrice.frame = CGRectMake(16, 16, 160, 22);
        _invoicePrice.textColor = RGB(67, 67, 67);
        _invoicePrice.font = SYS_FONT(18);
        _invoicePrice.textAlignment = NSTextAlignmentLeft;
        _invoicePrice.text = @"发票金额：32.50元";
    }
    return _invoicePrice;
}

- (UILabel *)invoiceTitle {
    if (!_invoiceTitle) {
        _invoiceTitle = [[UILabel alloc] init];
        _invoiceTitle.frame = CGRectMake(16, 46, 240, 18);
        _invoiceTitle.textColor = RGB(102, 102, 102);
        _invoiceTitle.font = SYS_FONT(14);
        _invoiceTitle.textAlignment = NSTextAlignmentLeft;
        _invoiceTitle.text = @"钱包生活(平潭)科技有限公司上分公司";
    }
    return _invoiceTitle;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(16, 80, SCREEN_WIDTH - 62, 0.5);
        [_lineView drawDashLineWithLineHeight:1 dashLineWidth:@4 dashLineSpace:@5 lineColor:HexRGB(0xDEDEDE)];
    }
    return _lineView;
}

- (UILabel *)applyTime {
    if (!_applyTime) {
        _applyTime = [[UILabel alloc] init];
        _applyTime.frame = CGRectMake(16, 98, SCREEN_WIDTH / 3, 18);
        _applyTime.textColor = HexRGB(0x999999);
        _applyTime.font = SYS_FONT(14);
        _applyTime.textAlignment = NSTextAlignmentLeft;
        _applyTime.text = @"申请时间：2018.4.18";
    }
    return _applyTime;
}

- (UILabel *)invoiceStatus {
    if (!_invoiceStatus) {
        _invoiceStatus = [[UILabel alloc] init];
        _invoiceStatus.frame = CGRectMake(SCREEN_WIDTH - 98, 98, SCREEN_WIDTH / 3, 18);
        _invoiceStatus.textColor = HexRGB(0x999999);
        _invoiceStatus.font = SYS_FONT(14);
        _invoiceStatus.textAlignment = NSTextAlignmentLeft;
        _invoiceStatus.text = @"待开票";
    }
    return _invoiceStatus;
}

- (UIImageView *)recordImg {
    if (!_recordImg) {
        _recordImg = [[UIImageView alloc] init];
        _recordImg.frame = CGRectMake(SCREEN_WIDTH - 98, 0, 68, 68);
        _recordImg.image = UIImageName(@"einvoice_mange_sample");
    }
    return _recordImg;
}
@end
