//
//  BasicThreeDViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/25.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "BasicThreeDViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface BasicThreeDViewController ()

@end

@implementation BasicThreeDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(120, 200, 200, 200)];
    imageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:imageView];

    CATransform3D transform = CATransform3DIdentity;
    //透视投影
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    imageView.layer.transform = transform;
}



@end
