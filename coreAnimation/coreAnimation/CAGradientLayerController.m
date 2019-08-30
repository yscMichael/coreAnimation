//
//  CAGradientLayerController.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "CAGradientLayerController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface CAGradientLayerController ()
@property (nonatomic,strong) UIView *containerView;
@end

@implementation CAGradientLayerController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
//    [self basicChange];
    [self manyChange];
}

- (void)initView
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    self.containerView.center = CGPointMake(ScreenWidth / 2.0, ScreenHeight / 2.0);
}

#pragma mark - 基础渐变
- (void)basicChange
{
    //1、创建图层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    //2、设置颜色
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)[UIColor blueColor].CGColor];
    //3、设置起点和终点
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);

}

#pragma mark - 多重渐变
- (void)manyChange
{
    //1、创建图层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    //2、设置颜色
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor];
    //3、设置颜色位置
    gradientLayer.locations = @[@0.0,@0.25,@0.5];
    //4、设置起点和终点
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
}

#pragma mark - Getter And Setter
- (UIView *)containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

@end
