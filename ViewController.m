//
//  ViewController.m
//  waveView
//
//  Created by 王涛 on 16/10/25.
//  Copyright © 2016年 王涛. All rights reserved.
//

#import "ViewController.h"
#import "WXWaveView.h"
@interface ViewController ()

@property (nonatomic, strong) WXWaveView  *cloudyWaveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect waveRect = CGRectMake(0, CGRectGetHeight(self.view.frame) - 75, 375, 75);
    _cloudyWaveView = [[WXWaveView alloc] initWithFrame:waveRect];
    [self.view addSubview:({
        _cloudyWaveView.waveColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        _cloudyWaveView.waveSpeed = 1.6;
        _cloudyWaveView.waveAmplitude = 6;
        _cloudyWaveView.waveDirection = WaveDirectionBackward;
        _cloudyWaveView;
    })];
    [_cloudyWaveView beginWave];
    
    WXWaveView *waveView1 = [[WXWaveView alloc] initWithFrame:waveRect];
    [self.view addSubview:({
        waveView1.waveColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
        waveView1.waveSpeed = 2.0;
        waveView1.waveDirection = WaveDirectionForward;
        waveView1.waveAmplitude = 7;
        waveView1;
    })];
    [waveView1 beginWave];
    
    WXWaveView *waveView2 = [[WXWaveView alloc] initWithFrame:waveRect];
    [self.view addSubview:({
        waveView2.waveColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        waveView2.waveSpeed = 1.3;
        waveView2.waveAmplitude = 15;
        waveView2.waveDirection = WaveDirectionBackward;
        waveView2;
    })];
    [waveView2 beginWave];
    WXWaveView *waveView3 = [[WXWaveView alloc] initWithFrame:waveRect];
    [self.view addSubview:({
        waveView3.waveColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
        waveView3.waveSpeed = 1.0;
        waveView3.waveAmplitude = 10;
        waveView3.waveDirection = WaveDirectionForward;
        waveView3;
    })];
    [waveView3 beginWave];
    
    
}




@end
