//
//  LayerCreateController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/5.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "LayerCreateController.h"

@interface LayerCreateController ()

@end

@implementation LayerCreateController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIView *layerView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    layerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:layerView];

    //添加layer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(0, 0, 64, 64);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [layerView.layer addSublayer:blueLayer];
}


@end
