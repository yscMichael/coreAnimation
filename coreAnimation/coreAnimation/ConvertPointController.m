//
//  ConvertPointController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/3.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ConvertPointController.h"

@interface ConvertPointController ()

@end

@implementation ConvertPointController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    //1、基准View
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    oneView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:oneView];

    //2、添加view正常
//    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    twoView.backgroundColor = [UIColor blueColor];
//    twoView.center = oneView.center;
//    [self.view addSubview:twoView];

    //3、添加layer不正常
    CALayer *layerOne = [CALayer layer];
    layerOne.backgroundColor = [UIColor redColor].CGColor;
    layerOne.frame = CGRectMake(0, 0, 50, 50);
    //这个position是相对于self.view.layer来说的！！！！！
    layerOne.position = oneView.layer.position;
    [oneView.layer addSublayer:layerOne];
    NSLog(@"layerOne.position = %@",NSStringFromCGPoint(layerOne.position));

    //4、更改坐标系、layer显示正常
    CALayer *layerTwo = [CALayer layer];
    layerTwo.backgroundColor = [UIColor greenColor].CGColor;
    layerTwo.frame = CGRectMake(0, 0, 50, 50);

    //这里将相对于self.view.layer的点转化为相对于oneView.layer坐标系点！！！！！
    CGPoint innerCenter = [self.view.layer convertPoint:oneView.layer.position toLayer:oneView.layer];
    layerTwo.position = innerCenter;
    [oneView.layer addSublayer:layerTwo];
    NSLog(@"layerTwo.position = %@",NSStringFromCGPoint(layerTwo.position));

}

@end



