//
//  fallingSnowViewController.m
//  coreAnimation
//
//  Created by Michael on 2019/12/14.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "fallingSnowViewController.h"

@interface fallingSnowViewController ()
//UI
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIImageView *backImageView;
//timer
@property (nonatomic,strong) NSTimer *timer;
//数据源
@property (nonatomic,strong) NSMutableArray *startArray;
@property (nonatomic,strong) NSMutableArray *endArray;
@property (nonatomic,strong) NSMutableArray *scaleArray;
@end

@implementation fallingSnowViewController
#pragma mark - Cycle Life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initViews];
}

#pragma mark - 初始化
- (void)initData{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)initViews{
    [self.view addSubview:self.backImageView];
    self.image = [UIImage imageNamed:@"2-1.png"];
}

#pragma mark - Private Methods
- (void)onTimer{
    //1、创建雪花图像(这里最好放在自动释放池中，否则太多，容易内存泄漏)
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
    //2、计算开始位置和结束位置
    int startX = round(random() % (int)YYScreenWidth);
    int endX = round(random() % (int)YYScreenWidth);
    //3、计算方法倍数和速率
    double scale = 1 / round(random() % 100) + 1.0;
    double speed = 1 / round(random() % 100) + 1.0;
    //4、添加到界面
    imageView.frame = CGRectMake(startX, -100, 25.0 * scale, 25.0 * scale);
    imageView.alpha = 0.5;
    [self.view addSubview:imageView];
    //5、开始动画
    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(imageView)];
    [UIView setAnimationDuration:5 * speed];
    imageView.frame = CGRectMake(endX, YYScreenHeight + 10, 25.0 * scale , 25.0 * scale);
    [UIView commitAnimations];
}

#pragma mark - Getter And Setter
- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYScreenHeight)];
        _backImageView.image = [UIImage imageNamed:@"1-1.jpg"];
    }
    return _backImageView;
}

- (NSMutableArray *)startArray{
    if (!_startArray) {
        _startArray = [[NSMutableArray alloc] initWithObjects:
                       @"15",
                       @"25",
                       @"35",
                       @"45",
                       @"55",
                       @"65",
                       @"75",
                       @"85",nil];
    }
    return _startArray;
}

- (NSMutableArray *)endArray{
    if (!_endArray) {
        _endArray = [[NSMutableArray alloc] initWithObjects:
                       @"15",
                       @"25",
                       @"35",
                       @"45",
                       @"55",
                       @"65",
                       @"75",
                       @"85",nil];
    }
    return _endArray;
}

- (NSMutableArray *)scaleArray{
    if (!_scaleArray) {
        _scaleArray = [[NSMutableArray alloc] initWithObjects:
                     @"1",
                     @"2",
                     @"0.5",nil];
    }
    return _scaleArray;
}

@end
