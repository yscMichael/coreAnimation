//
//  ViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/10/15.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int x,y,z;

    x=y=z=1;

    ++x||(++y&&++z);
    NSLog(@"x = %d , y = %d, z = %d",x,y,z);
}


@end
