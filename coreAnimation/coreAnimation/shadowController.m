//
//  shadowController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "shadowController.h"

@interface shadowController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation shadowController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    //shadowOpacity:0~1
    view.layer.shadowOpacity = 0.5;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    //shadowOffset默认(0,-3)、控制着左右上下位移
    view.layer.shadowOffset = CGSizeMake(0, 5);
    view.layer.shadowRadius = 20.0;

    //阴影按照轮廓
    self.imageView.layer.shadowOpacity = 0.5;
    self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    //shadowOffset默认(0,-3)、控制着左右上下位移
    self.imageView.layer.shadowOffset = CGSizeMake(0, 5);
    self.imageView.layer.shadowRadius = 20.0;
}


@end


