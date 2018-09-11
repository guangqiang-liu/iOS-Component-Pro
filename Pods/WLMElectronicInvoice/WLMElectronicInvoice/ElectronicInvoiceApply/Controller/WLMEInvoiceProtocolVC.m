//
//  WLMEInvoiceProtocolVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMEInvoiceProtocolVC.h"

@interface WLMEInvoiceProtocolVC ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *content;
@end

@implementation WLMEInvoiceProtocolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"电子发票合作协议";
}

- (void)renderViews {
    [super renderViews];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.content];
    CGSize contentSize = [UILabel calculateLableSizeWithLableText:self.content.text font:[UIFont systemFontOfSize:14] lineSpace:5 maxWidth:SCREEN_WIDTH];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentSize.height);
}

- (UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] init];
        _content.frame = CGRectMake(10, 0, SCREEN_WIDTH - 20, SCREEN_HEIGHT);
        _content.text = @"1、因本合同产生的争议，甲乙双方应当协商解决，协商不成由本合同签订地上海市闵行区人民法院管辖。 2、本合同期限自甲方不再选择套餐、且最后一次选择的套餐到期之日结束。 3、本合同壹式贰份，甲、乙双方各执壹份，自双方签字盖章后生效。 甲方（盖章）： 乙方（盖章）： 法人代表或授权代表（签字）： 法人代表或授权代表（签字）： 联系人： 联系方式： 联系人： 联系方式： 通讯地址： 通讯地址： 日期： 年 月 日 日期： 年 月 日";
        _content.font = H14;
        _content.textColor = textBlackColor;
        _content.numberOfLines = 0;
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        CGFloat emptylen = _content.font.pointSize * 2;
        paraStyle.firstLineHeadIndent = emptylen;
        paraStyle.lineSpacing = 5.0f;
        NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:_content.text attributes:@{NSParagraphStyleAttributeName:paraStyle}];
        _content.attributedText = attrText;
    }
    return _content;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = self.view.bounds;
    }
    return _scrollView;
}

@end
