//
//  CAReplicatorLayerController.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "CAReplicatorLayerController.h"
#import "ReflectionView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface CAReplicatorLayerController ()
@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) ReflectionView *reflectionView;
@end

@implementation CAReplicatorLayerController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
//    [self makeRepeatView];
    [self makeReflectionView];
}

- (void)initViews
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    self.containerView.center = CGPointMake(ScreenWidth / 2.0, ScreenHeight / 2.0);
}

#pragma mark - 创建重复图形
- (void)makeRepeatView
{
    //1、创建图层
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicatorLayer];
    //2、创建数量
    replicatorLayer.instanceCount = 10;
    //3、每个实例进行转换
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    //设置图层转换
    replicatorLayer.instanceTransform = transform;
    //4、设置颜色
    replicatorLayer.instanceBlueOffset = -0.1;
    replicatorLayer.instanceGreenOffset = -0.1;

    //5、需要重新创建一个子图层
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];
}

#pragma mark - 创建反射
- (void)makeReflectionView
{
    self.containerView.frame = CGRectMake(0, 0, 160, 160);
    self.containerView.center = CGPointMake(ScreenWidth / 2.0, ScreenHeight / 2.0);
    [self.containerView addSubview:self.reflectionView];
}

#pragma mark - Setter And Setter
- (UIView *)containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _containerView.backgroundColor = [UIColor brownColor];
        _containerView.layer.borderColor = [UIColor redColor].CGColor;
        _containerView.layer.borderWidth = 1.0;
    }
    return _containerView;
}

- (ReflectionView *)reflectionView
{
    if (!_reflectionView)
    {
        _reflectionView = [[[NSBundle mainBundle] loadNibNamed:@"ReflectionView" owner:nil options:nil] lastObject];
        _reflectionView.frame = CGRectMake(0, 0, 160, 160);
    }
    return _reflectionView;
}
@end
