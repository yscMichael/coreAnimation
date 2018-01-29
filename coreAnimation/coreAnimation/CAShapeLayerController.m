//
//  CAShapeLayerController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/29.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "CAShapeLayerController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface CAShapeLayerController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation CAShapeLayerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];
    [self drawRect];
    [self drawOval];
    [self drawRoundedRect];
    [self drawRoundedRectWithCorners];
    [self drawArc];
    [self drawArcHalf];
    [self drawSector];
    [self drawLine];
    [self drawCurveToPoint];
    [self drawQuadCurveToPoint];
    [self drawProgress];
    [self drawLineStyle];
    [self drawLineWithFillRule];
    [self drawLineDash];
}

#pragma mark - 矩形
- (void)drawRect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 椭圆
- (void)drawOval
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 10, 100, 50)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 矩形带圆角
- (void)drawRoundedRect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(300, 10, 100, 100) cornerRadius:10.0];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 矩形带指定圆角
- (void)drawRoundedRectWithCorners
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 150, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 圆形
- (void)drawArc
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50.0 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 弧形
- (void)drawArcHalf
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(350, 200) radius:50.0 startAngle:0 endAngle:M_PI clockwise:YES];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 扇形
- (void)drawSector
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(60, 350) radius:50.0 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(60, 350)];
    [path closePath];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 直线
- (void)drawLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(180, 350)];
    [path addLineToPoint:CGPointMake(230, 350)];
    [path addLineToPoint:CGPointMake(230, 400)];
    [path closePath];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:lineLayer];
}

#pragma mark - 绘制三次曲线
- (void)drawCurveToPoint
{
    UIView *viewTemp = [[UIView alloc]initWithFrame:CGRectMake(300, 320, 100, 100)];
    viewTemp.layer.borderColor = [UIColor blueColor].CGColor;
    viewTemp.layer.borderWidth = 2.0;
    [self.scrollView addSubview:viewTemp];

    UIBezierPath *path = [UIBezierPath bezierPath];
    //起始点
    [path moveToPoint:CGPointMake(0, 0)];
    //终点、控制点1、控制点2
    [path addCurveToPoint:CGPointMake(0, viewTemp.frame.size.height/2.0) controlPoint1:CGPointMake(viewTemp.frame.size.width/2.0, 0) controlPoint2:CGPointMake(viewTemp.frame.size.width, viewTemp.frame.size.height)];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [viewTemp.layer addSublayer:lineLayer];
}

#pragma mark - 绘制二次曲线
- (void)drawQuadCurveToPoint
{
    UIView *viewTemp = [[UIView alloc]initWithFrame:CGRectMake(10, 450, 100, 100)];
    viewTemp.layer.borderColor = [UIColor blueColor].CGColor;
    viewTemp.layer.borderWidth = 2.0;
    [self.scrollView addSubview:viewTemp];

    UIBezierPath *path = [UIBezierPath bezierPath];
    //起始点
    [path moveToPoint:CGPointMake(0, viewTemp.frame.size.height)];
    //终点、控制点
    [path addQuadCurveToPoint:CGPointMake(viewTemp.frame.size.width, 0) controlPoint:CGPointMake(viewTemp.frame.size.width, viewTemp.frame.size.height)];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [viewTemp.layer addSublayer:lineLayer];
}

#pragma mark - 绘制进度条、待定
- (void)drawProgress
{
    UIView *viewTemp = [[UIView alloc]initWithFrame:CGRectMake(150, 450, 100, 100)];
    viewTemp.layer.borderColor = [UIColor blueColor].CGColor;
    viewTemp.layer.borderWidth = 2.0;
    [self.scrollView addSubview:viewTemp];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(viewTemp.frame.size.width/2.0, viewTemp.frame.size.height/2.0) radius:50.0 startAngle:0 endAngle:M_PI_4 clockwise:YES];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = path.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [viewTemp.layer addSublayer:lineLayer];

    //currentPoint、containsPoint
    CGPoint tempPoint = CGPointMake(viewTemp.frame.size.width, viewTemp.frame.size.height/2.0);
    if ([path containsPoint:tempPoint])
    {
        NSLog(@"包含这个点");
    }
    else
    {
        NSLog(@"不包含");
    }

    NSLog(@"currentPoint = %@",NSStringFromCGPoint(path.currentPoint));
}

#pragma mark - lineCapStyle、lineJoinStyle样式设置
- (void)drawLineStyle
{
    UIView *viewTemp = [[UIView alloc]initWithFrame:CGRectMake(300, 450, 100, 100)];
    viewTemp.layer.borderColor = [UIColor blueColor].CGColor;
    viewTemp.layer.borderWidth = 2.0;
    [self.scrollView addSubview:viewTemp];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(viewTemp.frame.size.width/2.0, 0)];
    [path addLineToPoint:CGPointMake(viewTemp.frame.size.width/2.0, viewTemp.frame.size.height/2.0)];
    [path addLineToPoint:CGPointMake(viewTemp.frame.size.width, viewTemp.frame.size.height/2.0)];

    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 10;
    lineLayer.path = path.CGPath;
    //lineLayer.lineCap = kCALineCapSquare;//两端
    //lineLayer.lineJoin = kCALineJoinMiter;//连接处
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    [viewTemp.layer addSublayer:lineLayer];
}

//usesEvenOddFillRule
- (void)drawLineWithFillRule
{

}

//绘制虚线
- (void)drawLineDash
{

}

#pragma mark - Getters And Setters
- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
        _scrollView.backgroundColor = [UIColor brownColor];
        _scrollView.contentSize = CGSizeMake(ScreenWidth + 50, ScreenHeight - 64);
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}


@end
