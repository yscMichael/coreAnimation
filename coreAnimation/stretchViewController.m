//
//  stretchViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/11/26.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "stretchViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface stretchViewController ()

@property (nonatomic, strong)  CALayer *firstLayer;
@property (nonatomic, strong)  CALayer *secondLayer;
@property (nonatomic, strong)  CALayer *threeLayer;
@property (nonatomic, strong)  UIImage *image;

@end

@implementation stretchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self initLayer];
    [self stretchImage];
    [self setContentsCenter];
}

#pragma mark - 初始化
- (void)initLayer
{
    //创建CGImageRef（test.png是工程Bundle中的资源图片文件）
    CGImageRef img = [UIImage imageNamed:@"Button2"].CGImage;
    //创建CALayer
    CALayer *layer = [CALayer layer];
    self.firstLayer = layer;
    //设置CALayer的内容
    layer.contents = (__bridge id)img;
    layer.frame = CGRectMake(0, 70, CGImageGetWidth(img), CGImageGetHeight(img));
    layer.contentsScale = [UIScreen mainScreen].scale;
    //添加Layer到View
    [self.view.layer addSublayer:layer];
}

#pragma mark - 拉伸图片
- (void)stretchImage
{
    //创建CGImageRef（test.png是工程Bundle中的资源图片文件）
    CGImageRef img = [UIImage imageNamed:@"Button2"].CGImage;
    //创建CALayer
    CALayer *layer = [CALayer layer];
    self.secondLayer = layer;
    //设置CALayer的内容
    layer.contents = (__bridge id)img;
    CGFloat orginY = CGRectGetMaxY(self.firstLayer.frame);
    layer.frame = CGRectMake(0, orginY + 50, CGImageGetWidth(img), CGImageGetHeight(img));
    //添加Layer到View
    [self.view.layer addSublayer:layer];

    //选择右上角的四分之一为内容
    layer.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
    //拉伸
    layer.contentsGravity = kCAGravityResize;
}

#pragma mark - 设置contentsCenter
- (void)setContentsCenter
{
    //创建CGImageRef（test.png是工程Bundle中的资源图片文件）
    CGImageRef img = [UIImage imageNamed:@"Button2"].CGImage;
    //创建CALayer
    CALayer *layer = [CALayer layer];
    self.threeLayer = layer;
    //设置CALayer的内容
    layer.contents = (__bridge id)img;
    CGFloat orginY = CGRectGetMaxY(self.secondLayer.frame);
    layer.frame = CGRectMake(0, orginY + 50, CGImageGetWidth(img), CGImageGetHeight(img));
    //添加Layer到View
    [self.view.layer addSublayer:layer];

    //选择右上角的四分之一为内容
    layer.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
    //拉伸
    layer.contentsGravity = kCAGravityResize;

    //左下角的四分之一拉伸
    //前提是图片被拉伸才有效
    layer.contentsCenter = CGRectMake(0, 0.5, 0.5, 0.5);
}

@end


