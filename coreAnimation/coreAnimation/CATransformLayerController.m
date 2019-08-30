//
//  CATransformLayerController.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "CATransformLayerController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface CATransformLayerController ()
@property (nonatomic,strong) UIView *containerView;
@end

@implementation CATransformLayerController
#pragma mark - Cycle Lift
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self setViews];
}

- (void)initView
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
}

- (void)setViews
{
    //1、设置透视变换
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500;
    self.containerView.layer.sublayerTransform = pt;

    //2、设置立方体1
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.containerView.layer addSublayer:cube1];

    //3、设置立方体2
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containerView.layer addSublayer:cube2];
}

#pragma mark - 绘制3D图层
#pragma mark - CALayer图层绘制
- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //创建图层
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    //添加颜色
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //添加旋转
    face.transform = transform;
    return face;

}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //创建图层
    CATransformLayer *cube = [CATransformLayer layer];

    //添加 face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];

    //添加 face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //添加 face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //添加 face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    // 添加 face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    // 添加 face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //将整个容器放置在e界面中心
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);

    //应用transform
    cube.transform = transform;

    return cube;
}


#pragma mark - Getter And Setter
- (UIView *)containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _containerView.backgroundColor = [UIColor redColor];
    }
    return _containerView;
}

@end
