//
//  ViewController.m
//  GQComponentDemo
//
//  Created by 刘光强 on 2018/9/11.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ViewController.h"
#import <EleInvoiceCategory/CTMediator+Elelnvoice.h>
#import <ModuleBCategory/CTMediator+ModuleB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"这是项目主工程";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 300, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"点我进电子发票业务模块组件" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(moduleA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(50, 300, 300, 100);
    btn2.backgroundColor = [UIColor orangeColor];
    [btn2 setTitle:@"点我进业B务模块B组件" forState: UIControlStateNormal];
    [btn2 addTarget:self action:@selector(moduleB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)moduleA {
    UIViewController *VC = [[CTMediator sharedInstance] EleInvoice_ViewControllerWithCallback:^(NSString *result) {
        NSLog(@"resultA: --- %@", result);
    }];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)moduleB {
    UIViewController *VC = [[CTMediator sharedInstance] ModuleB_viewControllerWithCallback:^(NSString *result) {
        NSLog(@"resultB: --- %@", result);
    }];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
