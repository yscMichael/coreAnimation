//
//  ViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/10/15.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "ViewController.h"
#import "threeMethodsController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface ViewController ()<CAAnimationDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSoure;
@property (nonatomic,strong) NSMutableArray *controllerSoure;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class viewControl = NSClassFromString(self.controllerSoure[indexPath.row]);
    UIViewController *viewcontroller = [[viewControl alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return self.dataSoure.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataSoure[indexPath.row];

    return cell;
}

#pragma mark - Getters And Setters
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - BarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataSoure
{
    if (!_dataSoure)
    {
        _dataSoure = [[NSMutableArray alloc]initWithObjects:@"UIView创建动画的三种方式",@"更改透明度－隐式动画", nil];
    }
    return _dataSoure;
}

- (NSMutableArray *)controllerSoure
{
    if (!_controllerSoure)
    {
        _controllerSoure = [[NSMutableArray alloc]initWithObjects:@"threeMethodsController",@"changeOpacityController", nil];
    }
    return _controllerSoure;
}


@end
