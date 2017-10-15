//
//  ViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/10/15.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic,strong) UIView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.animationView];

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 100, ScreenHeight - 100, 100, 100)];
    [btn addTarget:self action:@selector(coreAnimationMethod) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
}

#pragma mark - UIView 代码块调用
- (void)animateWithDurationMethod
{
    [UIView animateWithDuration:5.0 animations:^{

        self.animationView.frame = CGRectMake(0, ScreenHeight - 50, 50, 50);
    } completion:^(BOOL finished) {
        self.animationView.frame = CGRectMake(0, ScreenHeight / 2.0 - 50, 50, 50);
    }];
}

#pragma mark - UIView [begin commit]模式
- (void)commitAnimationsMethod
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:5.0];
    self.animationView.frame = CGRectMake(0, ScreenHeight - 50, 50, 50);
    [UIView commitAnimations];
}

#pragma mark - 使用Core Animation中的类
- (void)coreAnimationMethod
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(20, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, ScreenHeight)];
    animation.duration = 5.0f;
    [self.animationView.layer addAnimation:animation forKey:@"positionAnimation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

}

#pragma mark - Getters And Setters
- (UIView *)animationView
{
    if (!_animationView)
    {
        _animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 50, 50)];
        _animationView.backgroundColor = [UIColor redColor];
    }
    return _animationView;
}



@end
