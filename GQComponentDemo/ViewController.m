//
//  ViewController.m
//  GQComponentDemo
//
//  Created by 刘光强 on 2018/9/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ViewController.h"
#import <EleInvoiceCategory/ComponentScheduler+EleInvoice.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"这是项目主工程";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 300, 100);
    btn.backgroundColor = [UIColor orangeColor];
    btn.center = self.view.center;
    [btn setTitle:@"点我跳进电子发票模块组件" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)push {
    UIViewController *VC = [[ComponentScheduler sharedInstance] EleInvoice_ViewControllerWithCallback:^(NSString *result) {
        NSLog(@"result: --- %@", result);
    }];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
