//
//  TargetViewContainer.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/9/12.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "TargetViewContainer.h"

#import "WLMSelectedApplyMerchantVM.h"
#import "WLMSelectApplyMerchantVC.h"
#import "WLBViewModelServiceImp.h"
#import "WLMInvoiceManagerListVC.h"

@interface TargetViewContainer ()

@property (nonatomic, strong) WLBViewModelServiceImp *viewModelService;
@property (nonatomic, strong) WLMSelectApplyMerchantVC *VC;

@end

@implementation TargetViewContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"这是电子发票业务组件模块";
    self.viewModelService = [[WLBViewModelServiceImp alloc] init];
    WLMSelectedApplyMerchantVM *viewModel = [[WLMSelectedApplyMerchantVM alloc] initWithService:self.viewModelService params:nil];
    self.VC = [[WLMSelectApplyMerchantVC alloc] initWithViewModel:viewModel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 300, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.center = self.view.center;
    [btn setTitle:@"电子发票模块组件" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)push {
    [self.navigationController pushViewController:self.VC animated:YES];
}

@end
