//
//  TwoMethodsMoveViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/24.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "TwoMethodsMoveViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TwoMethodsMoveViewController ()

@property (nonatomic,strong) UIView *gestureView;
@property (nonatomic,strong) UIView *touchView;
@property (nonatomic,assign) BOOL isMove;
@property (nonatomic,assign) CGPoint legend_point;

@end

@implementation TwoMethodsMoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    //1、利用手势
    UIView *gestureView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 150, 100)];
    gestureView.backgroundColor = [UIColor clearColor];
    gestureView.layer.borderColor = [UIColor redColor].CGColor;
    gestureView.layer.borderWidth = 2.0;
    UILabel *gestureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 20)];
    gestureLabel.textAlignment = NSTextAlignmentCenter;
    gestureLabel.text = @"利用手势滑动";
    [gestureView addSubview:gestureLabel];
    gestureLabel.center = CGPointMake(75, 50);
    [self.view addSubview:gestureView];

    //添加手势
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(doMoveAction:)];
    [gestureView addGestureRecognizer:panGestureRecognizer];

    //2、利用UITouch
    self.touchView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth - 150, 64, 150, 100)];
    self.touchView.backgroundColor = [UIColor clearColor];
    self.touchView.layer.borderColor = [UIColor blackColor].CGColor;
    self.touchView.layer.borderWidth = 2.0;
    UILabel *touchLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 100)];
    touchLabel.textAlignment = NSTextAlignmentCenter;
    touchLabel.text = @"利用touch滑动";
    touchLabel.center = CGPointMake(75, 50);
    [self.touchView addSubview:touchLabel];
    [self.view addSubview:self.touchView];
}

#pragma mark - 手势方法
- (void)doMoveAction:(UIPanGestureRecognizer *)recognizer
{
    //1、手势在self.view坐标系中移动的位置
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint newCenter = CGPointMake(recognizer.view.center.x + translation.x,
                                    recognizer.view.center.y + translation.y);
    //2、限制屏幕范围：
    newCenter.y = MAX(recognizer.view.frame.size.height/2 + 64, newCenter.y);
    newCenter.y = MIN(self.view.frame.size.height - recognizer.view.frame.size.height/2, newCenter.y);
    newCenter.x = MAX(recognizer.view.frame.size.width/2, newCenter.x);
    newCenter.x = MIN(self.view.frame.size.width - recognizer.view.frame.size.width/2,newCenter.x);
    //设置中心点范围
    recognizer.view.center = newCenter;

    //3、将手势坐标点归0、否则会累加
    [recognizer setTranslation:CGPointZero inView:self.view];
}

#pragma mark - UITouch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.isMove = NO;
    UITouch *touch = [touches anyObject];
    //1、点击位置在self.view中的位置
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.touchView.frame, point))
    {
        //2、点击位置在self.touchView中的位置
        self.legend_point = [touch locationInView:self.touchView];
        self.isMove = YES;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    if (!self.isMove)
    {
        return;
    }

    UITouch *touch = [touches anyObject];
    //1、手势滑动时在self.view中的位置
    CGPoint point = [touch locationInView:self.view];
    //2、转化成相对的中心
    point.x += self.touchView.frame.size.width/2.0f - self.legend_point.x;
    point.y += self.touchView.frame.size.height/2.0f - self.legend_point.y;
    //3、限制范围
    point.y = MAX(self.touchView.frame.size.height / 2.0f + 64, point.y);
    point.y = MIN(self.view.frame.size.height - self.touchView.frame.size.height / 2.0f, point.y);
    point.x = MAX(self.touchView.frame.size.width / 2.0f, point.x);
    point.x = MIN(self.view.frame.size.width - self.touchView.frame.size.width / 2.0f,point.x);

    self.touchView.center = point;
}



@end
