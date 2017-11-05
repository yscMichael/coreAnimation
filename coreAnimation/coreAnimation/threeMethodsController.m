//
//  threeMethodsController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/5.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "threeMethodsController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface threeMethodsController ()

@property (nonatomic,strong) UIView *animationView;

@end

@implementation threeMethodsController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.animationView];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *oneButton = [[UIButton alloc]initWithFrame:CGRectMake(0, ScreenHeight - 100, 250, 50)];
    [oneButton addTarget:self action:@selector(animateWithDurationMethod) forControlEvents:UIControlEventTouchUpInside];
    oneButton.backgroundColor = [UIColor greenColor];
    [oneButton setTitle:@"UIView代码块调用" forState:UIControlStateNormal];
    [self.view addSubview:oneButton];

    UIButton *twoButton = [[UIButton alloc]initWithFrame:CGRectMake(0, ScreenHeight - 200, 250, 50)];
    [twoButton addTarget:self action:@selector(animateWithDurationMethod) forControlEvents:UIControlEventTouchUpInside];
    twoButton.backgroundColor = [UIColor blueColor];
    [twoButton setTitle:@"UIView[begin commit]模式" forState:UIControlStateNormal];
    [self.view addSubview:twoButton];

    UIButton *threeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, ScreenHeight - 300, 250, 50)];
    [threeButton addTarget:self action:@selector(animateWithDurationMethod) forControlEvents:UIControlEventTouchUpInside];
    threeButton.backgroundColor = [UIColor brownColor];
    [threeButton setTitle:@"使用Core Animation中的类" forState:UIControlStateNormal];
    [self.view addSubview:threeButton];
}

#pragma mark - UIView动画执行方法
#pragma mark - UIView代码块调用
- (void)animateWithDurationMethod
{
    self.animationView.frame = CGRectMake(0, 64, 50, 50);
    [UIView animateWithDuration:5.0 animations:^{

        self.animationView.frame = CGRectMake(0, ScreenHeight - 50, 50, 50);
    } completion:^(BOOL finished) {
        self.animationView.frame = CGRectMake(0, ScreenHeight / 2.0 - 50, 50, 50);
    }];
}

#pragma mark - UIView[begin commit]模式
- (void)commitAnimationsMethod
{
    self.animationView.frame = CGRectMake(0, 64, 50, 50);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:5.0];
    self.animationView.frame = CGRectMake(0, ScreenHeight - 50, 50, 50);
    [UIView commitAnimations];
}

#pragma mark - 使用Core Animation中的类
- (void)coreAnimationMethod
{
    self.animationView.frame = CGRectMake(0, 64, 50, 50);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.animationView.frame.size.width / 2.0, 25)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - 25, 25)];
    animation.duration = 1.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.animationView.layer addAnimation:animation forKey:@"positionAnimation"];
}

#pragma mark - Getters And Setters
- (UIView *)animationView
{
    if (!_animationView)
    {
        _animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 50, 50)];
        _animationView.backgroundColor = [UIColor redColor];
    }
    return _animationView;
}


@end
