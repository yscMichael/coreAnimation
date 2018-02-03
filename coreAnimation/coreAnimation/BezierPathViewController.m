//
//  BezierPathViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/28.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BezierPathView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface BezierPathViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation BezierPathViewController

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
//    [self drawLineWithFillRule];
//    [self drawLineDash];
}

#pragma mark - 矩形
- (void)drawRect
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    bezierPathView.methodString = @"drawRect";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 椭圆
- (void)drawOval
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(150, 10, 100, 50)];
    bezierPathView.methodString = @"drawOval";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 矩形带圆角
- (void)drawRoundedRect
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(300, 10, 100, 100)];
    bezierPathView.methodString = @"drawRoundedRect";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 矩形带指定圆角
- (void)drawRoundedRectWithCorners
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(10, 150, 100, 100)];
    bezierPathView.methodString = @"drawRoundedRect";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 圆形
- (void)drawArc
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(150, 150, 100, 100)];
    bezierPathView.methodString = @"drawArc";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 弧形
- (void)drawArcHalf
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(300, 150, 100, 100)];
    bezierPathView.methodString = @"drawArcHalf";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 扇形
- (void)drawSector
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(10, 250, 100, 100)];
    bezierPathView.methodString = @"drawSector";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 直线
- (void)drawLine
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(160, 300, 100, 100)];
    bezierPathView.methodString = @"drawLine";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 绘制三次曲线
- (void)drawCurveToPoint
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    bezierPathView.layer.borderColor = [UIColor blueColor].CGColor;
    bezierPathView.layer.borderWidth = 2.0;
    bezierPathView.methodString = @"drawCurveToPoint";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 绘制二次曲线
- (void)drawQuadCurveToPoint
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(0, 450, 100, 100)];
    bezierPathView.layer.borderColor = [UIColor blueColor].CGColor;
    bezierPathView.layer.borderWidth = 2.0;
    bezierPathView.methodString = @"drawQuadCurveToPoint";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - 绘制进度条、待定
- (void)drawProgress
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(150, 450, 100, 100)];
    bezierPathView.layer.borderColor = [UIColor blueColor].CGColor;
    bezierPathView.layer.borderWidth = 2.0;
    bezierPathView.methodString = @"drawProgress";
    [self.scrollView addSubview:bezierPathView];
}

#pragma mark - lineCapStyle、lineJoinStyle样式设置
- (void)drawLineStyle
{
    BezierPathView *bezierPathView = [[BezierPathView alloc]initWithFrame:CGRectMake(300, 450, 100, 100)];
    bezierPathView.layer.borderColor = [UIColor blueColor].CGColor;
    bezierPathView.layer.borderWidth = 2.0;
    bezierPathView.methodString = @"drawLineStyle";
    [self.scrollView addSubview:bezierPathView];
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

