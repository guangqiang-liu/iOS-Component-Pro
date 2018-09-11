//
//  ImageTextField.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ImageTextField.h"

typedef NS_ENUM(NSInteger, ImageLocation) {
    ImageLocationLeft,
    ImageLocationRight
};

@interface ImageTextField() {
    UIImage *_leftImage;
    UIImage *_rightImage;
    CGSize _sizeLeft;
    CGSize _sizeRight;
}
@end

@implementation ImageTextField

- (id)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage imageSize:(CGSize)size {
    return [self initWithFrame:frame leftImage:leftImage imageSize:size rightImage:nil imageSize:CGSizeZero];
}

- (id)initWithFrame:(CGRect)frame rightImage:(UIImage *)rightImage imageSize:(CGSize)size {
    return [self initWithFrame:frame leftImage:nil imageSize:CGSizeZero rightImage:rightImage imageSize:size];
}

- (id)initWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage imageSize:(CGSize)size1 rightImage:(UIImage *)rightImage imageSize:(CGSize)size2 {
    self = [super initWithFrame:frame];
    if (self) {
        _leftImage = leftImage;
        _rightImage = rightImage;
        _sizeLeft = size1;
        _sizeRight = size2;
        self.contentMode = UIViewContentModeCenter;
        self.backgroundColor = HexRGB(0xF4F4F4);
        self.font = H14;
        self.tintColor = themeColor;
        self.textColor = textBlackColor;
        self.clearButtonMode = UITextFieldViewModeAlways;
        [self resetCornerRadius:15];
        self.inputAccessoryView = [UIView new];
        
        self.leftViewMode = (_leftImage == nil) ? UITextFieldViewModeNever:UITextFieldViewModeAlways;
        self.rightViewMode = (_rightImage == nil) ? UITextFieldViewModeNever:UITextFieldViewModeAlways;
        
        self.leftView = [self imageInLocation:ImageLocationLeft];
        self.rightView = [self imageInLocation:ImageLocationRight];
    }
    return self;
}

- (UIView *)imageInLocation:(ImageLocation)location {
    CGSize tempSize = CGSizeZero;
    UIImage *tempImage = nil;
    if (location == ImageLocationLeft) {
        tempSize = _sizeLeft;
        tempImage = _leftImage;
    }else {
        tempSize = _sizeRight;
        tempImage = _rightImage;
    }
    CGFloat defaultWidth = tempSize.width > self.frame.size.height ? tempSize.width + 10 : self.frame.size.height;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, defaultWidth, self.frame.size.height)];
    bgView.backgroundColor = [UIColor clearColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tempSize.width, tempSize.height)];
    imageView.image = tempImage;
    imageView.center = bgView.center;
    [bgView addSubview:imageView];
    return bgView;
}

- (instancetype)resetCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    return self;
}

@end
