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
    UIImage *image = [UIImage imageNamed:@"2.jpeg"];

    //1、直接设置图片、图片虚胖、图片填充
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth / 2, ScreenWidth / 2)];
    firstView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:firstView];
    firstView.layer.contents = (__bridge id _Nullable)(image.CGImage);

    //2、解决虚胖问题、按照当前View宽高比例，把图片同比例缩放
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth / 2, 270, ScreenWidth / 2, ScreenWidth / 2)];
    secondView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:secondView];
    secondView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    //效果一致
    //secondView.contentMode = UIViewContentModeScaleAspectFit;
    secondView.layer.contentsGravity = kCAGravityResizeAspect;

    //3、图片会以原图显示
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 2, ScreenWidth / 2, ScreenWidth / 2)];
    threeView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:threeView];
    threeView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    threeView.layer.contentsGravity = kCAGravityCenter;

    //这里是用来支持高分辨率的、这就是Retina屏幕
    //设置为1.0则每个点1个像素绘制图片
    //设置为2.0则每个点2个像素绘制图片
    threeView.layer.contentsScale = [UIScreen mainScreen].scale;
    //截取多余图片、效果一致
    //threeView.clipsToBounds = YES;
    threeView.layer.masksToBounds = YES;

}





@end
