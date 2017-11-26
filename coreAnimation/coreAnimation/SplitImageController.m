//
//  SplitImageController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/5.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "SplitImageController.h"

@interface SplitImageController ()

@property (nonatomic, strong)  UIView *firstView;
@property (nonatomic, strong)  UIView *secondView;
@property (nonatomic, strong)  UIView *thirdView;
@property (nonatomic, strong)  UIView *fourView;

@end

@implementation SplitImageController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
    [self.view addSubview:self.thirdView];
    [self.view addSubview:self.fourView];

    [self splitImage];
}

#pragma mark - Private Methods
- (void)splitImage
{
    UIImage *image = [UIImage imageNamed:@"pingtu3.jpg"];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.firstView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.secondView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.thirdView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.fourView.layer];
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    //set contentsRect
    layer.contentsRect = rect;
}

#pragma mark - Getters And Setters
- (UIView *)firstView
{
    if (!_firstView)
    {
        _firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 150, 150)];
        _firstView.backgroundColor = [UIColor brownColor];
    }
    return _firstView;
}

- (UIView *)secondView
{
    if (!_secondView)
    {
        _secondView = [[UIView alloc]initWithFrame:CGRectMake(200, 100, 150, 150)];
        _secondView.backgroundColor = [UIColor brownColor];
    }
    return _secondView;
}

- (UIView *)thirdView
{
    if (!_thirdView)
    {
        _thirdView = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 150, 150)];
        _thirdView.backgroundColor = [UIColor brownColor];
    }
    return _thirdView;
}

- (UIView *)fourView
{
    if (!_fourView)
    {
        _fourView = [[UIView alloc]initWithFrame:CGRectMake(200, 400, 150, 150)];
        _fourView.backgroundColor = [UIColor brownColor];
    }
    return _fourView;
}


@end
