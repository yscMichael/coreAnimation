//
//  changeOpacityController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/5.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "changeOpacityController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface changeOpacityController ()

@property (nonatomic,strong) UIView *testView;

@end

@implementation changeOpacityController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    oneView.backgroundColor = [UIColor redColor];
    self.testView = oneView;
    [self.view addSubview:oneView];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 50, 50)];
    [button addTarget:self action:@selector(changeOpacity) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
}

#pragma mark - 更改透明度
- (void)changeOpacity
{
    //显示动画－－不会改变layer的内部属性
    CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnim.fromValue = [NSNumber numberWithFloat:1.0];
    fadeAnim.toValue = [NSNumber numberWithFloat:0.0];
    fadeAnim.duration = 3.0;
    [self.testView.layer addAnimation:fadeAnim forKey:@"opacity"];
    //这里需要手动改变内部属性
    self.testView.layer.opacity = 0.0;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}


@end
