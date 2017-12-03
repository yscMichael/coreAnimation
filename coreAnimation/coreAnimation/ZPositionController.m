//
//  ZPositionController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/3.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ZPositionController.h"

@interface ZPositionController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ZPositionController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 150, 20)];
    [button setTitle:@"更改zPosition" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(changeZPosition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 更改zPosition
- (void)changeZPosition
{
    //zPosition 提高一个像素就可以让绿色视图前置
    //当然0.1或者0.0001也能够做到
    //但是最好不要这样,因为浮点类型四舍五入的计算可能会造成一些不便的麻烦
    self.greenView.layer.zPosition = 1.0f;
}



@end



