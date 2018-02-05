//
//  CircleViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/2/5.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"

static float tempValue = 0.0;

@interface CircleViewController ()

@property (nonatomic,strong) CircleView *circleView;

@end

@implementation CircleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, 100, 50)];
    [button addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"更改进度" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];

    CircleView *circleView = [[CircleView alloc]initWithFrame:CGRectMake(200, 200, 150, 150)];
    circleView.progress = 0.0;
    self.circleView = circleView;
    [self.view addSubview:circleView];
}

#pragma mark - 更改进度
- (void)changeProgress:(UIButton *)sender
{
    if (tempValue < 1.0)
    {
        tempValue += 0.1;
        self.circleView.progress = tempValue;
    }
    else
    {
        self.circleView.progress = 0.0;
    }
}

@end


