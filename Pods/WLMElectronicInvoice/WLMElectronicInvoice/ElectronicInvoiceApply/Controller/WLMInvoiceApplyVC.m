//
//  WLMInvoiceApplyVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/3.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceApplyVC.h"
#import "WLMFillTaxationInfoVC.h"

@interface WLMInvoiceApplyVC ()

@end

@implementation WLMInvoiceApplyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = white_color;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = red_color;
    [btn whenTapped:^{
        WLMFillTaxationInfoVC *VC = [[WLMFillTaxationInfoVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }];
    [self.view addSubview:btn];
}


@end
