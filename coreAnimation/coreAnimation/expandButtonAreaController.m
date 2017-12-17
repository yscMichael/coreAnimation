//
//  expandButtonAreaController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "expandButtonAreaController.h"
#import "HWButton.h"

@interface expandButtonAreaController ()

@end

@implementation expandButtonAreaController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView *coverView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    coverView.backgroundColor = [UIColor clearColor];
    coverView.layer.borderColor = [UIColor redColor].CGColor;
    coverView.layer.borderWidth = 1.0;
    [self.view addSubview:coverView];

    HWButton *button = [[HWButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    button.hitTestEdgeInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    [button setTitle:@"点我呀" forState:UIControlStateNormal];
    [button setTitle:@"点中了" forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];

    button.center = coverView.center;
}



@end
