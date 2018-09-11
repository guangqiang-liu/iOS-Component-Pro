//
//  WLFormVC.h
//  WLForm
//
//  Created by 刘光强 on 2018/4/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseViewController.h"

@class WLForm;
@interface WLFormVC : WLBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WLForm *form;
@end
