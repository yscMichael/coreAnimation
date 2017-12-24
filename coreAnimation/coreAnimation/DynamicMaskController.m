//
//  DynamicMaskController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/24.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "DynamicMaskController.h"
#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)

@interface DynamicMaskController ()

@property (nonatomic, strong) CAShapeLayer  *maskLayer;
@property (nonatomic, strong) UIView        *showView;

@end

@implementation DynamicMaskController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    //1、图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"8"];
    [self.view addSubview:imageView];

    //2、蒙版图层
    self.maskLayer = [CAShapeLayer layer];
    //贝塞尔曲线(创建一个圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                        radius:100
                                                    startAngle:DEGREES(0)
                                                      endAngle:DEGREES(360)
                                                    clockwise:YES];
    //获取path
    self.maskLayer.path = path.CGPath;
    //设置填充颜色为透明
    self.maskLayer.fillColor = [UIColor blueColor].CGColor;
    self.maskLayer.position = self.view.center;

    //3、设置蒙版
    imageView.layer.mask = self.maskLayer;

    //4、设置动态滑动的标准
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.showView.backgroundColor = [UIColor clearColor];
    self.showView.center = self.view.center;
    [self.view addSubview:self.showView];

    //5、添加手势
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.showView addGestureRecognizer:recognizer];
}

#pragma mark - 拖拽手势
- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    // 拖拽
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

    // 关闭CoreAnimation实时动画绘制(核心)
    [CATransaction setDisableActions:YES];
    self.maskLayer.position = recognizer.view.center;
}


@end
