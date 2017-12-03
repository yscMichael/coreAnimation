//
//  ChangeAnchorPointController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/3.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ChangeAnchorPointController.h"

@interface ChangeAnchorPointController ()

@property (nonatomic,strong) UIView *viewTwo;

@end

@implementation ChangeAnchorPointController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];

    UIView *viewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    viewTwo.center = viewOne.center;
    viewTwo.backgroundColor = [UIColor blueColor];
    self.viewTwo = viewTwo;
    [self.view addSubview:viewTwo];

    NSLog(@"frame = %@",NSStringFromCGRect(self.viewTwo.frame));
    NSLog(@"bounds = %@",NSStringFromCGRect(self.viewTwo.bounds));

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 20)];
    [button setTitle:@"更改锚点" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(changeAnchorPoint:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 更改锚点
- (void)changeAnchorPoint:(UIButton *)sender
{
    NSLog(@"/*****************更改锚点*******************/");
    self.viewTwo.layer.anchorPoint = CGPointMake(0, 0);
    NSLog(@"frame = %@",NSStringFromCGRect(self.viewTwo.frame));
    NSLog(@"bounds = %@",NSStringFromCGRect(self.viewTwo.bounds));
}

@end





