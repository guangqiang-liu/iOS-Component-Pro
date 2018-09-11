//
//  WLPickerView.m
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLPickerView.h"
#import <objc/runtime.h>

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface WLPickerView() <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *recordDic;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, assign) NSInteger selectedRow;

@property (nonatomic, copy) NSString *keyMapper; //自定义解析Key

@end

@implementation WLPickerView

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableDictionary *)recordDic {
    if (!_recordDic) {
        _recordDic = [NSMutableDictionary dictionary];
    }
    return _recordDic;
}

#pragma mark - create UI

- (instancetype)initWithFrame:(CGRect)frame {
    
    [self initToolBar];
    [self initContainerView];
    
    CGRect initialFrame;
    if (CGRectIsEmpty(frame)) {
        initialFrame = CGRectMake(0, self.toolBar.frame.size.height, SCREEN_WIDTH, 216);
    } else {
        initialFrame = frame;
    }
    self = [super initWithFrame:initialFrame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.delegate = self;
        self.dataSource = self;
        
        [self initBgView];
    }
    return self;
}

- (void)initToolBar {
    self.toolBar = [[WLTooBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.toolBar.backgroundColor = [UIColor whiteColor];
}

- (void)initContainerView {
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.containerView.userInteractionEnabled = YES;
    [self.containerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)]];
}

- (void)initBgView {
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - self.frame.size.height - 44, SCREEN_WIDTH, self.frame.size.height + self.toolBar.frame.size.height)];
}

#pragma mark - Action

- (void)showMOFSPickerViewWithDataArray:(NSArray<NSString *> *)array commitBlock:(void(^)(NSString *string))commitBlock cancelBlock:(void(^)(void))cancelBlock {
    self.keyMapper = nil;
    self.dataArr = [NSMutableArray arrayWithArray:array];
    [self reloadAllComponents];
    self.selectedRow = 0;
    NSString *tagStr = [NSString stringWithFormat:@"%ld",(long)self.showTag];
    if ([self.recordDic.allKeys containsObject:tagStr]) {
        self.selectedRow = [self.recordDic[tagStr] integerValue];
    }
    [self selectRow:self.selectedRow inComponent:0 animated:NO];
    
    [self showWithAnimation];
    
    __weak __typeof(self) weakSelf = self;
    self.toolBar.cancelBlock = ^ {
        if (cancelBlock) {
            [weakSelf hiddenWithAnimation];
            cancelBlock();
        }
    };
    
    self.toolBar.commitBlock = ^ {
        [weakSelf hiddenWithAnimation];
        if (commitBlock) {
            NSString *rowStr = [NSString stringWithFormat:@"%ld",(long)weakSelf.selectedRow];
            [weakSelf.recordDic setValue:rowStr forKey:tagStr];
            commitBlock(weakSelf.dataArr[weakSelf.selectedRow]);
        }
    };
}

- (void)showMOFSPickerViewWithCustomDataArray:(NSArray<NSString *> *)array keyMapper:(NSString *)keyMapper commitBlock:(void (^)(id))commitBlock cancelBlock:(void (^)(void))cancelBlock {
    self.keyMapper = keyMapper;
    if (keyMapper == nil) {
        self.dataArr = [NSMutableArray array];
    } else {
        self.dataArr = [NSMutableArray arrayWithArray:array];
    }
    
    [self reloadAllComponents];
    self.selectedRow = 0;
    NSString *tagStr = [NSString stringWithFormat:@"%ld",(long)self.showTag];
    if ([self.recordDic.allKeys containsObject:tagStr]) {
        self.selectedRow = [self.recordDic[tagStr] integerValue];
    }
    [self selectRow:self.selectedRow inComponent:0 animated:NO];
    
    [self showWithAnimation];
    
    __weak __typeof(self) weakSelf = self;
    self.toolBar.cancelBlock = ^ {
        if (cancelBlock) {
            [weakSelf hiddenWithAnimation];
            cancelBlock();
        }
    };
    
    self.toolBar.commitBlock = ^ {
        [weakSelf hiddenWithAnimation];
        if (commitBlock) {
            NSString *rowStr = [NSString stringWithFormat:@"%ld",(long)weakSelf.selectedRow];
            [weakSelf.recordDic setValue:rowStr forKey:tagStr];
            commitBlock(weakSelf.dataArr[weakSelf.selectedRow]);
        }
    };
}

- (void)showWithAnimation {
    [self addViews];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.bgView.frame.size.height;
    self.bgView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    
}

- (void)hiddenWithAnimation {
    CGFloat height = self.bgView.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT + height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self hiddenViews];
    }];
}

- (void)addViews {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.containerView];
    [window addSubview:self.bgView];
    [self.bgView addSubview:self.toolBar];
    [self.bgView addSubview:self];
}

- (void)hiddenViews {
    [self removeFromSuperview];
    [self.toolBar removeFromSuperview];
    [self.bgView removeFromSuperview];
    [self.containerView removeFromSuperview];
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArr.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if (self.keyMapper) {
//        id value = [self.dataArr[row] valueForKey:self.keyMapper];
//        if ([value isKindOfClass:[NSString class]]) {
//            return value;
//        } else {
//            return @"解析出错";
//        }
//    }
    return self.dataArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedRow = row;
}


@end

@implementation NSString (WLPickerView)

@dynamic mofs_key, mofs_int_key;

- (void)setMofs_key:(NSString *)mofs_key {
    objc_setAssociatedObject(self, @selector(mofs_key), mofs_key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mofs_key {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMofs_int_key:(NSInteger)mofs_int_key {
    objc_setAssociatedObject(self, @selector(mofs_int_key), @(mofs_int_key), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)mofs_int_key {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
@end
