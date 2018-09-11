//
//  WLCircleProgressView.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLCircleProgressView.h"

@interface WLCircleProgressView ()
@property (nonatomic, assign) CGFloat percent;
@property (nonatomic, assign) CGFloat circleWidth;
@property (nonatomic, assign) CGFloat circleProgressRadius;
@property (nonatomic, copy) NSArray *gradientCGColors;
@end

@implementation WLCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame circleWidth:(CGFloat)width gradientCGColors:(NSArray *)CGColors {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = white_color;
        _circleWidth = width;
        _gradientCGColors = CGColors;
        _circleProgressRadius = (150 - width) / 2;
        [self bindViewModel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    CGContextRef progressContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(progressContext, self.circleWidth);
    CGContextSetRGBStrokeColor(progressContext, 249 / 255.0, 249 / 255.0, 249 / 255.0, 1);
    CGContextAddArc(progressContext, xCenter, yCenter, self.circleProgressRadius, 0, 2 * M_PI, 0);
    CGContextDrawPath(progressContext, kCGPathStroke);
    
    CGPoint center = CGPointMake(xCenter, yCenter);
    CGFloat radius = self.circleProgressRadius;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + M_PI * 2 * self.percent;
    
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.frame = self.bounds;
    progressLayer.fillColor = [[UIColor clearColor] CGColor];
    progressLayer.strokeColor = [[UIColor redColor] CGColor];
    progressLayer.opacity = 1;
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.lineWidth = self.circleWidth;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    progressLayer.path = [path CGPath];
    [self.layer addSublayer:progressLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    gradientLayer.colors = self.gradientCGColors;
    gradientLayer.locations = @[@0.3, @0.9];
    [gradientLayer setMask:progressLayer];
    [self.layer addSublayer:gradientLayer];
    
    [self drawLineAnimation:progressLayer];
}

- (void)bindViewModel {
    @weakify(self);
    [[[RACObserve(self, progress) ignore:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id value) {
        @strongify(self);
        self.percent = [self.progress floatValue];
        [self setNeedsDisplay];
    }];
}

- (void)drawLineAnimation:(CALayer*)layer {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.duration = 2;
    basicAnimation.fromValue = [NSNumber numberWithInteger:0];
    basicAnimation.toValue = [NSNumber numberWithInteger:1];
    [layer addAnimation:basicAnimation forKey:@"key"];
}

@end
