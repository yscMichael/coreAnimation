//
//  layerShowImageController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/5.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "layerShowImageController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface layerShowImageController ()

@end

@implementation layerShowImageController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIView *layerView = [[UIView alloc]initWithFrame:CGRectMake(80, 200, 200, 200)];
    layerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:layerView];

    UIImage *image = [UIImage imageNamed:@"timg.jpeg"];
    layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);

    //解决虚胖问题、相当于是把图片同比例缩放
//    layerView.layer.contentsGravity = kCAGravityResizeAspect;

    //这个时候，图片会以原图显示
    layerView.layer.contentsGravity = kCAGravityCenter;
    //不设置这个就以1个像素点显示，图片更大
    layerView.layer.contentsScale = [UIScreen mainScreen].scale;

    //是否显示图层意外的图像、对应UIView的clipsToBounds
    layerView.layer.masksToBounds = YES;
}


@end
