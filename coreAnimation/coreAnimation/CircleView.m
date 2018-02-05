//
//  CircleView.m
//  coreAnimation
//
//  Created by 杨世川 on 18/2/5.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "CircleView.h"

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
#define StartAngle (-90)
#define EndAngle (270)

@interface CircleView ()

@property (nonatomic,strong) CAShapeLayer *backgroundLayer;
@property (nonatomic,strong) CAShapeLayer *trackLayer;
@property (nonatomic,strong) UIView *endPointView;
@property (nonatomic,assign) CGFloat arcRadius;

@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self initData];
        [self initSubview];
    }
    return self;
}

#pragma mark - initData
- (void)initData
{
    self.arcRadius = self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width;
}

#pragma mark - initSubview
- (void)initSubview
{
    UIBezierPath *backgroundPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 startAngle:StartAngle endAngle:EndAngle clockwise:YES];
    self.backgroundLayer.path = backgroundPath.CGPath;

    UIBezierPath *trackPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 startAngle:DEGREES_TO_RADIANS(StartAngle) endAngle:DEGREES_TO_RADIANS(EndAngle) clockwise:YES];
    self.trackLayer.path = trackPath.CGPath;
    self.trackLayer.strokeEnd = 0.0;

    [self.layer addSublayer:self.backgroundLayer];
    [self.layer addSublayer:self.trackLayer];
    [self addSubview:self.endPointView];
}

#pragma mark - Getters And Setters
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:1.5];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];

    //设置进度
    self.trackLayer.strokeEnd = progress;
    //更新endPoint位置
//    CGPoint newCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//    newCenter.y += self.arcRadius * sin(M_PI/180 * (360*progress - 90));
//    newCenter.x += self.arcRadius * cos(M_PI/180 * (360*progress - 90));
//    self.endPointView.center = newCenter;

    [CATransaction commit];
}

- (CAShapeLayer *)backgroundLayer
{
    if (!_backgroundLayer)
    {
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.lineJoin = kCALineJoinRound;
        _backgroundLayer.lineWidth = 5.0;
    }
    return _backgroundLayer;
}

- (CAShapeLayer *)trackLayer
{
    if (!_trackLayer)
    {
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.fillColor = [UIColor clearColor].CGColor;
        _trackLayer.strokeColor = [UIColor redColor].CGColor;
        _trackLayer.lineWidth = 5.0;
    }
    return _trackLayer;
}

- (UIView *)endPointView
{
    if (!_endPointView)
    {
        _endPointView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, 0, 20, 20)];
        _endPointView.backgroundColor = [UIColor greenColor];
        _endPointView.layer.cornerRadius = 10.0;
        _endPointView.layer.masksToBounds = YES;
    }
    return _endPointView;
}

@end


