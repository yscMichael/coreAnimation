//
//  redrawViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/26.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "redrawViewController.h"

@interface redrawViewController ()<CALayerDelegate>

@property (nonatomic,strong) UIView *layerView;

@end

@implementation redrawViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.layerView];

    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;

    //set controller as layer delegate
    blueLayer.delegate = self;

    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.layerView.layer addSublayer:blueLayer];

    //force layer to redraw
    [blueLayer display];
}

#pragma mark - CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

#pragma mark - Getters And Setters
- (UIView *)layerView
{
    if (!_layerView)
    {
        _layerView = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 200, 200)];
        _layerView.backgroundColor = [UIColor whiteColor];
    }
    return _layerView;
}



@end
