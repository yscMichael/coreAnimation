//
//  DynamicMaskImprovedController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/24.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "DynamicMaskImprovedController.h"

#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DynamicMaskImprovedController ()

@property (nonatomic, strong) CAShapeLayer  *maskLayer;
@property (nonatomic, strong) UIView        *showView;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation DynamicMaskImprovedController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    //1、图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7"]];
    self.imageView = imageView;
    imageView.center = self.view.center;
    [self.view addSubview:imageView];

    //2、蒙版图层
    self.maskLayer = [CAShapeLayer layer];
    //贝塞尔曲线(创建一个圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                        radius:50
                                                    startAngle:DEGREES(0)
                                                      endAngle:DEGREES(360)
                                                     clockwise:YES];
    //获取path
    self.maskLayer.path = path.CGPath;
    //设置填充颜色为透明
    self.maskLayer.fillColor = [UIColor greenColor].CGColor;
    //这里需要坐标转换以一下
    CGPoint maskCenter = [self.view convertPoint:self.view.center toView:imageView];
    //这样做显示不出来、如果imageView大小与self.view大小一致，可以显示。
    //self.maskLayer.position = self.view.center;
    self.maskLayer.position = maskCenter;

    //3、设置蒙版
    imageView.layer.mask = self.maskLayer;

    //4、设置动态滑动的标准
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
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
    //1、手势在self.view坐标系中移动的位置
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint newCenter = CGPointMake(recognizer.view.center.x + translation.x,
                                    recognizer.view.center.y + translation.y);
    //2、限制屏幕范围：
    newCenter.y = MAX(self.imageView.frame.origin.y, newCenter.y);
    newCenter.y = MIN(CGRectGetMaxY(self.imageView.frame), newCenter.y);
    newCenter.x = MAX(self.imageView.frame.origin.x, newCenter.x);
    newCenter.x = MIN(CGRectGetMaxX(self.imageView.frame),newCenter.x);
    //3、将手势坐标点归0、否则会累加
    [recognizer setTranslation:CGPointZero inView:self.view];
    //4、关闭CoreAnimation实时动画绘制(核心)
    [CATransaction setDisableActions:YES];
    //5、设置中心点范围
    recognizer.view.center = newCenter;
    //6、设置蒙版的中心点
    //这个需要转换坐标系
    CGPoint maskCenter = [self.view convertPoint:newCenter toView:self.imageView];
    self.maskLayer.position = maskCenter;
    
}


@end
