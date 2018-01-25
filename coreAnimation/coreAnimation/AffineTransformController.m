//
//  AffineTransformController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/25.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "AffineTransformController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface AffineTransformController ()

@end

@implementation AffineTransformController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self basicTransform];
    [self concatTransform];
}

//旋转变换
- (void)basicTransform
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2.0 - 75, 100, 150, 150)];
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.layer.borderWidth = 2.0;
    imageView.image = [UIImage imageNamed:@"15"];
    [self.view addSubview:imageView];

    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    imageView.layer.affineTransform = transform;
}

//混合变换
//这里旋转和平移结合会有问题，位置有偏差
- (void)concatTransform
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 295, ScreenWidth, 5)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blueColor];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2.0 - 75, 300, 200, 200)];
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.layer.borderWidth = 2.0;
    imageView.image = [UIImage imageNamed:@"6"];
    [self.view addSubview:imageView];
    NSLog(@"转换前 = %@",NSStringFromCGRect(imageView.frame));

    CGAffineTransform transform = CGAffineTransformIdentity;
    //缩小一半
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //旋转30度
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    //右移动100
    transform = CGAffineTransformTranslate(transform, 100, 0);
    imageView.layer.affineTransform = transform;
    NSLog(@"转换后 = %@",NSStringFromCGRect(imageView.frame));
}

@end


