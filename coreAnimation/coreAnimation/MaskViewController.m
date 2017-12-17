//
//  MaskViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation MaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    //create mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"Cone.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;

    //apply mask to image layer
    self.imageView.layer.mask = maskLayer;
}



@end
