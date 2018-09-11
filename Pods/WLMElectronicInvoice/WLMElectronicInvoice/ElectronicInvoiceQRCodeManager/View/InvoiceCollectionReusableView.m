//
//  InvoiceCollectionReusableView.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/17.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "InvoiceCollectionReusableView.h"

@implementation InvoiceCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
    }
    return self;
}

@end
