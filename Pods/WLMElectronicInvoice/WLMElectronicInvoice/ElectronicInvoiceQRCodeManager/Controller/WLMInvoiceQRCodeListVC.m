//
//  WLMInvoiceQRCodeListVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/17.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceQRCodeListVC.h"
#import "InvoiceQRCodeCell.h"
#import "InvoiceCollectionReusableView.h"
#import "WLMInvoiceConfirmView.h"

@interface WLMInvoiceQRCodeListVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionReusableView *headerView;
@property (nonatomic, strong) UIView *headBgView;
@property (nonatomic, strong) UILabel *shopName;
@property (nonatomic, strong) UIButton *shopChange;
@property (nonatomic, strong) UIView *scanBgView;
@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation WLMInvoiceQRCodeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码绑定";
    [self setupViews];
}

- (void)setupViews {
    [self dataInitialize];
    [self setupCollectionView];
    [self.view addSubview:self.scanBgView];
    [self.scanBgView addSubview:self.scanButton];
}

- (void)dataInitialize {
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.itemSize = CGSizeMake(110, 150);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 76) collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self.collectionView registerClass:[InvoiceQRCodeCell class] forCellWithReuseIdentifier:@"QRCodeCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark collectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InvoiceQRCodeCell *cell = (InvoiceQRCodeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"QRCodeCell" forIndexPath:indexPath];
    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (SCREEN_WIDTH - 42) / 2;
    CGFloat height = (SCREEN_WIDTH - 42) / 2 / 0.75;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 16, 4, 16);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    InvoiceQRCodeCell *cell = (InvoiceQRCodeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.botlabel.text;
    NSLog(@"%@",msg);
}

- (UIView *)scanBgView {
    if (!_scanBgView) {
        _scanBgView = [[UIView alloc] init];
        _scanBgView.frame = CGRectMake(0, SCREEN_HEIGHT - 76, SCREEN_WIDTH, 76);
        _scanButton.backgroundColor = white_color;
    }
    return _scanBgView;
}

- (UIButton *)scanButton {
    if (!_scanButton) {
        _scanButton = [[UIButton alloc] init];
        _scanButton.frame = CGRectMake(16, 16, SCREEN_WIDTH - 32, 44);
        _scanButton.layer.cornerRadius = 4;
        _scanButton.layer.masksToBounds = YES;
        _scanButton.titleLabel.font = SYS_FONT(18);
        [_scanButton setTitle:@"扫码绑定" forState:UIControlStateNormal];
        [_scanButton setImage:[WLIcon iconWithName:@"scan_rect_o" size:22 color:white_color] forState:UIControlStateNormal];
        [_scanButton setTitleEdgeInsets:UIEdgeInsetsMake(14, 60, 14, 50)];
        [_scanButton createGradientButtonWithSize:CGSizeMake(SCREEN_WIDTH, 44) colorArray:@[HexRGB(0xFF7E4A), HexRGB(0xFF4A4A)] gradientType:GradientFromLeftToRight];
        [_scanButton whenTapped:^{
            WLModal *modal = [[WLModal alloc] init];
            WLMInvoiceConfirmView *view = [[WLMInvoiceConfirmView alloc] init];
            view.invoiceConfirmBlock = ^(NSString *confirm) {
                NSLog(@"%@", confirm);
                [modal close];
            };
            [modal addContentView:view];
            [modal show];
        }];
    }
    return _scanButton;
}

@end

