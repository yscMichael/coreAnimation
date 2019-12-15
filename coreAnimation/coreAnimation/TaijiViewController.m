//
//  TaijiViewController.m
//  coreAnimation
//
//  Created by Michael on 2019/12/15.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "TaijiViewController.h"
#import "TaijiView.h"

@interface TaijiViewController ()
@property (nonatomic,strong) TaijiView *taiji;
@end

@implementation TaijiViewController
#pragma mark - Cycle Life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

#pragma mark - 初始化View
- (void)initViews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.taiji];
}

#pragma mark - Getter And Setter
- (TaijiView *)taiji{
    if (!_taiji) {
        _taiji = [[TaijiView alloc] initWithFrame:CGRectMake(50.0, 80.0, 230.0, 320.0)];
        _taiji.layer.borderColor = [UIColor redColor].CGColor;
        _taiji.layer.borderWidth = 1.0;
    }
    return _taiji;
}

@end
