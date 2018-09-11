//
//  ImageTextField.h
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTextField : UITextField

- (id)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage imageSize:(CGSize)size;

- (id)initWithFrame:(CGRect)frame rightImage:(UIImage *)rightImage imageSize:(CGSize)size;

- (id)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage imageSize:(CGSize)size1 rightImage:(UIImage *)rightImage imageSize:(CGSize)size2;
@end

