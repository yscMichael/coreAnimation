//
//  shadowPathController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "shadowPathController.h"

@interface shadowPathController ()


@end

@implementation shadowPathController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    UIImage *image = [UIImage imageNamed:@"2.jepg"];
    UIImageView *firstView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    firstView.image = image;
    firstView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:firstView];

    UIImageView *secondView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 350, 200, 200)];
    secondView.image = image;
    secondView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:secondView];

    firstView.layer.shadowOpacity = 0.5;
    secondView.layer.shadowOpacity = 0.5;
    //方形轮廓
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, firstView.bounds);
    firstView.layer.shadowPath = squarePath;

    //圆形轮廓
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, secondView.bounds);
    secondView.layer.shadowPath = circlePath;



}


@end
