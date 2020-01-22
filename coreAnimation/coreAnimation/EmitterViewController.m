//
//  EmitterViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 2020/1/2.
//  Copyright © 2020 杨世川. All rights reserved.
//

#import "EmitterViewController.h"

@interface EmitterViewController ()
@property (nonatomic ,strong) CAEmitterLayer *emitterLayer;
@end

@implementation EmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //MARK:炮弹
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    //展示图片
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snow"].CGImage);
    //每秒粒子产生个数的乘数因子，会和layer的birthRate相乘，然后确定每秒产生的粒子个数
    cell.birthRate = 10;
    
    //每个粒子存活时间
    cell.lifetime = 10.0;
    //粒子生命周期范围
    cell.lifetimeRange = 0.3;
    
    //粒子透明度变化，设置为-0.4
    //就是每过一秒透明度就减少0.4，这样就有消失的效果，一般设置为负数
    cell.alphaSpeed = -0.1;
    cell.alphaRange = 0.01;
    
    //粒子速度
    cell.velocity = 40.0;
    //粒子的速度范围
    cell.velocityRange = 20.0;
    
    //粒子内容的颜色
    cell.color = [UIColor whiteColor].CGColor;
    //设置了颜色变化范围后每次产生的粒子颜色都是随机的
    cell.redRange = 0.5;
    cell.blueRange = 0.5;
    cell.greenRange = 0.5;
    
    //缩放比例
    cell.scale = 0.4;
    //缩放比例范围
    cell.scaleRange = 0.5;
    //scale每秒变化率，负数缩小，正数放大
    cell.scaleSpeed = -0.01;
    
    //粒子的初始发射方向
    //抛洒角度，x-y平面的发射方向；
    //顺时针方向角度变化：0~PI/2~PI
    //逆时针变化是负的
    cell.emissionLongitude = M_PI;
    //抛洒角度的浮动范围
    //cell.emissionRange = M_PI_2;
    
    //Y方向的加速度
    cell.yAcceleration = 9.8;
    
    //MARK:发射器
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.backgroundColor = [UIColor redColor].CGColor;
    //发射位置
    self.emitterLayer.emitterPosition = CGPointMake(YYScreenWidth/2, 0);
    //粒子产生系数，默认为1
    self.emitterLayer.birthRate = 1;
    //发射器的尺寸
    self.emitterLayer.emitterSize = CGSizeMake(YYScreenWidth, 0);
    //发射器的形状
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    //发射器的模式
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    //渲染模式
    self.emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    
    //MARK:装填弹药
    self.emitterLayer.emitterCells = @[cell];
    
    //MARK:添加到图层
    [self.view.layer addSublayer:self.emitterLayer];
}

@end
