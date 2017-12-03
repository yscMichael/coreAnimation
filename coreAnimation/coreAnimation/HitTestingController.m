//
//  HitTestingController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/3.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "HitTestingController.h"

@interface HitTestingController ()

//在Storyboard中拖入的视图
@property (weak, nonatomic) IBOutlet UIView *layerView;
//此处一定要强引用，否则会被销毁无法显示
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation HitTestingController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.blueLayer];
}

#pragma mark - 点击View在self.view的坐标系中
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1、普通方法
    [self commonMethodWithTouches:touches withEvent:event];
    //2、HitTest方法
//    [self hitTestWithTouches:touches withEvent:event];
}

#pragma mark - 判断是否在点击范围内的普通方法、这个需要转化坐标系
- (void)commonMethodWithTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1、get touch position relative to main view
    //这个point是基于self.view的坐标系
    CGPoint point = [[touches anyObject] locationInView:self.view];
    NSLog(@"self.view = %f,%f",point.x ,point.y);

    //2、convert point to the white layer's coordinates
    //将point转化为self.layerView.layer的坐标系中
    CGPoint tempPoint = point;
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    //与上述方法一样，达到坐标转化效果
    CGPoint tempOnePoint = [self.view.layer convertPoint:tempPoint toLayer:self.layerView.layer];
    NSLog(@"self.layerView.layer = %f,%f",point.x ,point.y);
    NSLog(@"tempOnePoint = %f,%f",tempOnePoint.x ,tempOnePoint.y);

    //3、get layer using containsPoint:
    //判断point是否包含在layer范围内
    if ([self.layerView.layer containsPoint:point])
    {
        //4、convert point to blueLayer’s coordinates
        //将point转化到blueLayer的坐标系中
        CGPoint tempPoint = point;
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        //与上述方法一样，达到坐标转化效果
        CGPoint tempTwoPoint = [self.layerView.layer convertPoint:tempPoint toLayer:self.blueLayer];
        NSLog(@"self.blueLayer = %f,%f",point.x ,point.y);
        NSLog(@"tempTwoPoint = %f,%f",tempTwoPoint.x ,tempTwoPoint.y);

        if ([self.blueLayer containsPoint:point])
        {
            UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"Inside Blue Layer"
                                                                                message:nil
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击蓝色成功");
            }]];
            [self presentViewController:alertView animated:true completion:nil];
        }
        else
        {
            UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"Inside White Layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击白色成功");
            }]];
            [self presentViewController:alertView animated:true completion:nil];
        }
    }
}

#pragma mark - HitTest方法调用
- (void)hitTestWithTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1、get touch position
    //获取当前self.view中的坐标系点击point
    CGPoint point = [[touches anyObject] locationInView:self.view];

    //2、get touched layer
    //获取当前点击layer、利用hitTest
    CALayer *layer = [self.layerView.layer hitTest:point];
    //判断layer类型
    if (layer == self.blueLayer)
    {

        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"Inside Blue Layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击蓝色成功");
        }]];
        [self presentViewController:alertView animated:true completion:nil];
    }
    else if (layer == self.layerView.layer)
    {
        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"Inside White Layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击白色成功");
        }]];
        [self presentViewController:alertView animated:true completion:nil];
    }
    else
    {
        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"不在范围内" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"不在范围内");
        }]];
        [self presentViewController:alertView animated:true completion:nil];
    }
}


@end
