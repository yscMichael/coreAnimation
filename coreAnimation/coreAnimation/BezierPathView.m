//
//  BezierPathView.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/29.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    SEL sel = NSSelectorFromString(self.methodString);
    if ([self respondsToSelector:sel])
    {
        [self performSelector:sel];
    }
}

#pragma mark - 矩形
- (void)drawRect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20)];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 椭圆
- (void)drawOval
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20)];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 矩形带圆角
- (void)drawRoundedRect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20) cornerRadius:10.0];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 矩形带指定圆角
- (void)drawRoundedRectWithCorners
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10.0, 10.0)];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 圆形
- (void)drawArc
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50.0 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    [path fill];
}

#pragma mark - 弧形
- (void)drawArcHalf
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50.0 startAngle:0 endAngle:M_PI clockwise:YES];
    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 扇形
- (void)drawSector
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50.0 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)];
    [path closePath];

    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 直线
- (void)drawLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2.0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)];
    [path closePath];

    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    [path fill];
}

#pragma mark - 绘制三次曲线
- (void)drawCurveToPoint
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    //起始点
    [path moveToPoint:CGPointMake(0, 0)];
    //终点、控制点1、控制点2
    [path addCurveToPoint:CGPointMake(0, self.frame.size.height/2.0) controlPoint1:CGPointMake(self.frame.size.width/2.0, 0) controlPoint2:CGPointMake(self.frame.size.width, self.frame.size.height)];

    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 绘制二次曲线
- (void)drawQuadCurveToPoint
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    //起始点
    [path moveToPoint:CGPointMake(0, self.frame.size.height)];
    //终点、控制点
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width, 0) controlPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];

    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - 绘制进度条、待定
- (void)drawProgress
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50.0 startAngle:0 endAngle:M_PI_4 clockwise:YES];

    path.lineWidth = 2.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

#pragma mark - lineCapStyle、lineJoinStyle样式设置
- (void)drawLineStyle
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width/2.0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2.0)];

    path.lineWidth = 10.0;
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [path stroke];
    //[path fill];
}

//usesEvenOddFillRule
- (void)drawLineWithFillRule
{
    
}

//绘制虚线
- (void)drawLineDash
{
    
}



@end



