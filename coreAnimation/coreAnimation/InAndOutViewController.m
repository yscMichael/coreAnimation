//
//  InAndOutViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/25.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "InAndOutViewController.h"

@interface InAndOutViewController ()

@property (nonatomic,strong) UIView *innerView;
@property (nonatomic,strong) UIView *outView;
@property (nonatomic,strong) UIView *innerViewT;
@property (nonatomic,strong) UIView *outViewT;

@end

@implementation InAndOutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self addRotateZ];
    [self addRotateY];
}

- (void)addRotateZ
{
    [self.view addSubview:self.outView];
    [self.outView addSubview:self.innerView];
    self.innerView.center = CGPointMake(self.outView.frame.size.width/2.0, self.outView.frame.size.height/2.0);
    //外部旋转正45度
    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    self.outView.layer.transform = outer;

    //内部旋转负45度
    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    self.innerView.layer.transform = inner;
}

//这里没有达到预期的效果、需要CATransformLayer来协调
- (void)addRotateY
{
    [self.view addSubview:self.outViewT];
    [self.outViewT addSubview:self.innerViewT];
    self.innerViewT.center = CGPointMake(self.outViewT.frame.size.width/2.0, self.outViewT.frame.size.height/2.0);
    //外部旋转正45度
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0 / 500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    self.outViewT.layer.transform = outer;

    //内部旋转负45度
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0 / 500.0;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);

    self.innerViewT.layer.transform = inner;
}

#pragma mark - Getters And Setters
- (UIView *)outView
{
    if (!_outView)
    {
        _outView = [[UIView alloc]initWithFrame:CGRectMake(150, 100, 150, 150)];
        _outView.backgroundColor = [UIColor greenColor];
    }
    return _outView;
}

- (UIView *)innerView
{
    if (!_innerView)
    {
        _innerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _innerView.backgroundColor = [UIColor brownColor];
    }
    return _innerView;
}

- (UIView *)outViewT
{
    if (!_outViewT)
    {
        _outViewT = [[UIView alloc]initWithFrame:CGRectMake(150, 400, 150, 150)];
        _outViewT.backgroundColor = [UIColor redColor];
    }
    return _outViewT;
}

- (UIView *)innerViewT
{
    if (!_innerViewT)
    {
        _innerViewT = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _innerViewT.backgroundColor = [UIColor blueColor];
    }
    return _innerViewT;
}


@end
