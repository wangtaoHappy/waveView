//
//  WXWaveView.m
//
//  Created by WelkinXie on 16/4/20.
//  Copyright © 2016年 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WXWaveView
//

#import "WXWaveView.h"

@interface WXWaveView ()

@property (assign, nonatomic) CGFloat waveWidth;
@property (assign, nonatomic) CGFloat waveHeight;
@property (assign, nonatomic) CGFloat offsetX;

@property (strong, nonatomic) CADisplayLink *waveDisplayLink;
@property (strong, nonatomic) CAShapeLayer  *waveShapeLayer;

@end

@implementation WXWaveView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _waveColor     = [UIColor whiteColor];
        _waveSpeed     = 5.0f;
        _waveAmplitude = 5.0f;
        _waveDirection = WaveDirectionForward;
        _waveHeight    = self.frame.size.height / 2;
        _waveWidth     = self.frame.size.width;
    }
    return self;
}

- (void)beginWave {
    
    if (self.waveDisplayLink) {
        return;
    }
    
    self.waveShapeLayer = [CAShapeLayer layer];
    self.waveShapeLayer.fillColor = self.waveColor.CGColor;
    [self.layer addSublayer:self.waveShapeLayer];
    
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWaveShapeLayer)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)endWave {
    
    if (!self.waveDisplayLink) {
        return;
    }
    [UIView animateWithDuration:1.f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.waveDisplayLink invalidate];
        self.waveDisplayLink = nil;
        self.waveShapeLayer = nil;
        self.alpha = 1.f;
    }];
}

- (void)updateWaveShapeLayer {
    
    switch (self.waveDirection) {
        case WaveDirectionForward: {
            self.offsetX += self.waveSpeed;
            break;
        }
        case WaveDirectionBackward: {
            self.offsetX -= self.waveSpeed;
            break;
        }
    }
    //NSLog(@"%f", self.offsetX);
    //改变振幅，波纹效果逼真
    static CGFloat add = 0.0;
    static BOOL isIncrease = YES;
    if (isIncrease) {
        add += 0.005;
        self.waveAmplitude += add * 0.11;
    }else {
        add -= 0.005;
        self.waveAmplitude -= add * 0.11;
    }
    if (add > 1) {
        isIncrease = NO;
    }
    if (add < 0.5) {
        isIncrease = YES;
    }
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.waveHeight);
    CGFloat y = 0.f;
    for (float x = 0.f; x <= self.waveWidth; x++) {
        y = self.waveAmplitude * sin((360 / self.waveWidth) * (x * M_PI / 180)  +  self.offsetX * M_PI / 180) + self.waveHeight;
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    CGPathAddLineToPoint(path, NULL, self.waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, NULL, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    self.waveShapeLayer.path = path;
    CGPathRelease(path);
}

@end
