//
//  WLMInvoiceItemCell.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/28.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceItemCell.h"
#import "WLMSelectInvoiceItemModel.h"

@interface WLMInvoiceItemCell()

@property (nonatomic, strong) UILabel *leftTitle;
@end

@implementation WLMInvoiceItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    [self.contentView addSubview:self.leftTitle];
    
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setModel:(WLMSelectInvoiceItemModel *)model {
    _model = model;
    self.leftTitle.text = model.invoiceName;
}

- (UILabel *)leftTitle {
    if (!_leftTitle) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.text = @"餐饮";
        _leftTitle.textColor = textBlackColor;
        _leftTitle.font = H14;
    }
    return _leftTitle;
}

@end
