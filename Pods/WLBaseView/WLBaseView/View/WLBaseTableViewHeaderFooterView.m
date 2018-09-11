//
//  WLBaseTableViewHeaderFooterView.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseTableViewHeaderFooterView.h"

@implementation WLBaseTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.viewEdgeInsets.left, frame.origin.y + self.viewEdgeInsets.top, frame.size.width - self.viewEdgeInsets.left - self.viewEdgeInsets.right, frame.size.height - self.viewEdgeInsets.top - self.viewEdgeInsets.bottom);
    [super setFrame:rc];
}

+ (UINib *)nib {
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)updateWithCellData:(id)aData {}

+ (CGFloat)heightForCellData:(id)aData {
    return 0;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
