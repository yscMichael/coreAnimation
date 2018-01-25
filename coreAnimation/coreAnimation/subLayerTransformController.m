//
//  subLayerTransformController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/25.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "subLayerTransformController.h"

@interface subLayerTransformController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *twoImageView;

@end

@implementation subLayerTransformController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.containerView.layer.sublayerTransform = perspective;

    //1、逆时针旋转45度
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.oneImageView.layer.transform = transform1;
    self.oneImageView.layer.doubleSided = NO;

    //2、顺时针旋转45度
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.twoImageView.layer.transform = transform2;
    self.twoImageView.layer.doubleSided = NO;
}


@end
