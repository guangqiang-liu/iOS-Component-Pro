//
//  WLMInvoiceDetailInfoView.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceDetailInfoView.h"
#import "UIView+WLDashLine.h"

@interface WLMInvoiceDetailInfoView()

@property (nonatomic, copy) NSArray *dataArr;
@end

@implementation WLMInvoiceDetailInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = white_color;
        self.layer.cornerRadius = 6;
        self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 4.0f;
        self.layer.shadowOpacity = 0.2f;
        self.dataArr = @[@"", @"", @"", @"", @""];
        [self renderViews];
    }
    return self;
}

- (void)renderViews {
    UIView *tempView;
    for (NSInteger i = 0; i < self.dataArr.count; i ++) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(15, 24 + i *(18 + 16), SCREEN_WIDTH - 60, 18);
        [self addSubview:view];
        tempView = view;
        [self renderInfoWithSuperView:view];
    }
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(15, MaxY(tempView) + 24, WIDTH(tempView), 2);
    [self addSubview:line];
    [line drawDashLineWithLineHeight:1 dashLineWidth:@4 dashLineSpace:@5 lineColor:HexRGB(0xDEDEDE)];
    
    for (NSInteger i = 0; i < 2; i ++) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(15, MaxY(line) + i *(18 + 16) + 24, SCREEN_WIDTH - 60, 18);
        [self addSubview:view];
        [self renderInfoWithSuperView:view];
    }
    
    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake(0, 320 - 12, SCREEN_WIDTH - 30, 12);
    image.image = UIImageName(@"sawtooth");
    image.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:image];
}

- (void)renderInfoWithSuperView:(UIView *)view {
    UILabel *leftLable = [[UILabel alloc] init];
    leftLable.text = @"发票抬头";
    leftLable.textColor = textGrayColor;
    leftLable.font = H14;
    [view addSubview:leftLable];
    
    [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.centerY.equalTo(view);
    }];
    
    UILabel *rightLable = [[UILabel alloc] init];
    rightLable.text = @"钱包生活(平潭)科技有限公司";
    rightLable.textColor = textDarkGrayColor;
    rightLable.font = H14;
    [view addSubview:rightLable];
    
    [rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view);
        make.centerY.equalTo(view);
    }];
}

@end
