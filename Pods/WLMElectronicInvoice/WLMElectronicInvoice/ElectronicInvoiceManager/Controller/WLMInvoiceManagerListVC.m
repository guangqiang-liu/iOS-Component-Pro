//
//  WLMInvoiceManagerListVC.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/4.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMInvoiceManagerListVC.h"
#import "HMSegmentedControl.h"
#import "WLMRequirementListVC.h"
#import "WLMRecordListVC.h"
#import "WLMPackageInfoVC.h"

#define SCREEN_IS_X (SCREEN_HEIGHT == 812.0)
#define MAIN_NAV_HEIGHT (SCREEN_IS_X ? 88 : 64)

@interface WLMInvoiceManagerListVC () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) NSMutableArray *childControllers;
@property (nonatomic, strong) UIView *noticeBoard;
@property (nonatomic, strong) UIImageView *noticeImg;
@property (nonatomic, strong) UILabel *noticeLabel;
@property (nonatomic, assign) BOOL isShowNotice;

@end

@implementation WLMInvoiceManagerListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电子发票管理";
}

- (void)renderViews {
    [super renderViews];
    [self dataInitialize];
    [self segmentLaunch];
}

- (void)dataInitialize {
    self.isShowNotice = NO;
}

- (void)bindViewModel {
    [super bindViewModel];
}

- (void)segmentLaunch {
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.segmentedControl.sectionTitles = @[@"开票请求", @"开票记录", @"套餐情况"];
    self.segmentedControl.selectedSegmentIndex = 1;
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : HexRGB(0x999999)};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : HexRGB(0x434343)};
    self.segmentedControl.selectionIndicatorColor = [UIColor redColor];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH *index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
    
    if (self.isShowNotice) {
        [self.view addSubview:self.noticeBoard];
        [self.noticeBoard addSubview:self.noticeImg];
        [self.noticeBoard addSubview:self.noticeLabel];
    } else {
        [self.noticeBoard removeFromSuperview];
        [self.noticeBoard removeFromSuperview];
        [self.noticeBoard removeFromSuperview];
    }
    
    CGFloat y = self.isShowNotice ? MAIN_NAV_HEIGHT + 78 : MAIN_NAV_HEIGHT + 44;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT) animated:NO];
    [self.view addSubview:self.scrollView];
    
    [self addChildControllers];
}

- (void)addChildControllers {
    self.childControllers = [[NSMutableArray alloc] initWithCapacity:3];
    
    for (int i = 1; i < 4; i ++) {
        if (1 == i) {
            WLMRequirementListVC *vc = [[WLMRequirementListVC alloc] init];
            [self.childControllers addObject:vc];
        } else if (2 == i) {
            WLMRecordListVC *vc = [[WLMRecordListVC alloc] init];
            [self.childControllers addObject:vc];
        } else if (3 == i) {
            WLMPackageInfoVC *vc = [[WLMPackageInfoVC alloc] init];
            [self.childControllers addObject:vc];
        }
    }
    
    [self.childControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *view = obj.view;
        view.frame = CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.scrollView addSubview:view];
    }];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

#pragma mark - getter\setter
- (UIView *)noticeBoard {
    if (!_noticeBoard) {
        _noticeBoard = [[UIView alloc] init];
        _noticeBoard.frame = CGRectMake(0, MAIN_NAV_HEIGHT, SCREEN_WIDTH, 34);
        _noticeBoard.backgroundColor = HexRGB(0xFFF0D1);
    }
    return _noticeBoard;
}

- (UIImageView *)noticeImg {
    if (!_noticeImg) {
        _noticeImg = [[UIImageView alloc] init];
        _noticeImg.frame = CGRectMake(16, 9, 16, 16);
        _noticeImg.image = [WLIcon iconWithName:@"notification_o" size:16 color:HexRGB(0xFFA800)];
    }
    return _noticeImg;
}

- (UILabel *)noticeLabel {
    if (!_noticeLabel) {
        _noticeLabel = [[UILabel alloc] init];
        _noticeLabel.frame = CGRectMake(40, 8, SCREEN_WIDTH - 56, 18);
        _noticeLabel.textColor = HexRGB(0xFFA800);
        _noticeLabel.font = SYS_FONT(12);
        _noticeLabel.textAlignment = NSTextAlignmentLeft;
        _noticeLabel.text = @"功能开通中，我们会派专人与您联系。";
        _noticeLabel.hidden = !self.isShowNotice;
    }
    return _noticeLabel;
}

@end

