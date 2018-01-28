//
//  threeDTransformController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/1/25.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "threeDTransformController.h"

@interface threeDTransformController ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewArray;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, assign) CGPoint diceAngle;

@end

@implementation threeDTransformController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewTransform:)];
    [self.contentView addGestureRecognizer:pan];

    //add cube face 1
    CATransform3D diceTransform = CATransform3DIdentity;
    diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 75);
    [self addFace:0 withTransform:diceTransform];

    //add cube face 2
    diceTransform = CATransform3DTranslate(CATransform3DIdentity, 75, 0, 0);
    diceTransform = CATransform3DRotate(diceTransform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:diceTransform];

    //add cube face 3
    //move this code after the setup for face no. 6 to enable button
    diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -75, 0);
    diceTransform = CATransform3DRotate(diceTransform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:diceTransform];

    //add cube face 4
    diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 75, 0);
    diceTransform = CATransform3DRotate(diceTransform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:diceTransform];

    //add cube face 5
    diceTransform = CATransform3DTranslate(CATransform3DIdentity, -75, 0, 0);
    diceTransform = CATransform3DRotate(diceTransform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:diceTransform];

    //add cube face 6
    diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -75);
    diceTransform = CATransform3DRotate(diceTransform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:diceTransform];
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    UIImageView *face = (UIImageView *)self.imageViewArray[index];
    [self.contentView addSubview:face];

    CGSize containerSize = self.contentView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0,
                              containerSize.height / 2.0);

    face.layer.transform = transform;
    face.layer.doubleSided = NO;
}

- (void)viewTransform:(UIPanGestureRecognizer *)sender
{
    CGPoint point = [sender translationInView:self.contentView];
    CGFloat angleX = self.diceAngle.x + (point.x/30);
    CGFloat angleY = self.diceAngle.y - (point.y/30);

    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 500;
    transform = CATransform3DRotate(transform, angleX, 0, 1, 0);
    transform = CATransform3DRotate(transform, angleY, 1, 0, 0);
    self.contentView.layer.sublayerTransform = transform;

    if (sender.state == UIGestureRecognizerStateEnded)
    {
        self.diceAngle = CGPointMake(angleX, angleY);
    }
}


@end
