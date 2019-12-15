//
//  TaijiView.m
//  coreAnimation
//
//  Created by Michael on 2019/12/15.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "TaijiView.h"

@interface TaijiView()

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) float currentIndex;

@end

@implementation TaijiView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentIndex = 0.0;
        self.backgroundColor = [UIColor lightGrayColor];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)updateSpotlight{
    NSLog(@"定时器");
    self.currentIndex += 0.01;
    //会自动调用drawRect
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    //1、获取圆心位置
    float x = self.frame.size.width / 2.0;
    float y = self.frame.size.height / 2.0;
    //2、获取半径
    float radius = self.frame.size.width / 2.0;
    if (self.frame.size.width > self.frame.size.height) {
        radius = self.frame.size.height / 2.0;
    }
    //3、旋转角度
    float runAngle = M_PI * self.currentIndex;
    if (runAngle >= 2 * M_PI) {
        runAngle -= 2 * M_PI;
    }

    //4、绘制图像
    //4.1、获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //4.2、准备画布颜色
    CGColorRef whiteColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] CGColor];
    CGColorRef blackColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor];

    //4.3、绘制底部白色半圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    //0:顺时针 1:逆时针(苹果文档感觉有误)
    //坐标系右下为正、左上为负
    //        -M_PI_2
    //          |
    //          |
    //M_PI------|-------->0
    //          |
    //          |
    //        M_PI_2
    CGContextAddArc(context, x, y, radius, 0, M_PI, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);

    //4.4、绘制上面黑色半圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x, y, radius, M_PI, M_PI * 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);

    //4.5、绘制右边的小白色半圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x + (radius / 2.0), y, radius / 2.0, M_PI, M_PI * 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);

    //4.6、绘制左边的小黑色半圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x - (radius / 2.0), y, radius / 2.0, 0, M_PI, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);

    //4.7、绘制左边的完整小白色圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x - (radius / 2.0), y, radius / 4.0, 0, M_PI * 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);

    //4.8、绘制右边的完整小黑色圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x + (radius / 2.0), y, radius / 4.0, 0, M_PI * 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);



}


@end
