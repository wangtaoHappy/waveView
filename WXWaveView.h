//
//  WXWaveView.h
//
//  Created by WelkinXie on 16/4/20.
//  Copyright © 2016年 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WXWaveView
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WaveDirection) {
    WaveDirectionForward,
    WaveDirectionBackward,
};

@interface WXWaveView : UIView

@property (assign, nonatomic) WaveDirection waveDirection;

@property (strong, nonatomic) UIColor *waveColor;

@property (assign, nonatomic) CGFloat  waveSpeed;

@property (assign, nonatomic) CGFloat  waveAmplitude;

- (void)beginWave;
- (void)endWave;

@end



