//
//  ReflectionView.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "ReflectionView.h"

@implementation ReflectionView
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    //1、设置图层
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;
    //2、将实例垂直下移、并反转
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.frame.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    //图层旋转
    layer.instanceTransform = transform;
    //3、设置透明度
    layer.instanceAlphaOffset = -0.6;
}

#pragma mark - 一定要写，否则会报错
+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

@end
