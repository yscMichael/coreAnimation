//
//  TextLayerController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/3/6.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "TextLayerListController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface TextLayerListController ()<CAAnimationDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSoure;
@property (nonatomic,strong) NSMutableArray *controllerSoure;

@end

@implementation TextLayerListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

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

//设置每个cell的内容
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataSoure
{
    if (!_dataSoure)
    {

        _dataSoure = [[NSMutableArray alloc]initWithObjects:
                      @"实现Label效果",
                      @"富文本",
                      @"替代Label",
                      nil];
    }
    return _dataSoure;
}

- (NSMutableArray *)controllerSoure
{
    if (!_controllerSoure)
    {
        _controllerSoure = [[NSMutableArray alloc]initWithObjects:
                            @"LabelLayerController",
                            @"AttributeLabelController",
                            @"AlternativeLabelController",
                            nil];
    }
    return _controllerSoure;
}


@end

