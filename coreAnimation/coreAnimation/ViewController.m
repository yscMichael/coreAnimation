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
@property (nonatomic,strong) NSMutableArray *sectionSource;
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
    NSArray *sectionArray = self.controllerSoure[indexPath.section];
    Class viewControl = NSClassFromString(sectionArray[indexPath.row]);
    UIViewController *viewcontroller = [[viewControl alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    NSArray *sectionArray = self.dataSoure[section];
    return sectionArray.count;
}

//设置每组的标题头
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionSource[section];
}

//设置每个cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    NSArray *sectionArray = self.dataSoure[indexPath.section];
    cell.textLabel.text = sectionArray[indexPath.row];

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

- (NSMutableArray *)sectionSource
{
    if (!_sectionSource)
    {
        _sectionSource = [[NSMutableArray alloc]initWithObjects:
                          @"图层树",
                          @"寄宿图",
                          @"图层几何学",
                          @"视觉效果",
                          @"变换",
                          @"专用图层",
                          @"动画制作方式",
                          @"动画和layer属性关系", nil];
    }
    return _sectionSource;
}

- (NSMutableArray *)dataSoure
{
    if (!_dataSoure)
    {

        _dataSoure = [[NSMutableArray alloc]initWithObjects:
                      @[@"添加图层"],
                      @[@"layer显示图片",
                        @"layer分割图片",
                        @"layer拉伸图片",
                        @"layer重绘"],
                      @[@"锚点-观察frame",
                        @"锚点-闹钟",
                        @"坐标系转化",
                        @"Z坐标轴",
                        @"Hit Testing",
                        @"扩大按钮的点击范围",
                        @"子类超出父类范围",
                        @"scrollView预览界面",
                        @"自动布局Xib"],
                      @[@"圆角和图层边框",
                        @"阴影",
                        @"阴影剪裁",
                        @"阴影按照形状剪裁",
                        @"基本图层蒙版",
                        @"蒙版动态显示",
                        @"动态移动控件的两种方法",
                        @"蒙版动态显示增强",
                        @"拉伸过滤"],
                      @[@"仿射变换",
                        @"3D变换"],
                      @[@"贝赛尔曲线基础知识",
                        @"CAShapeLayer基础知识",
                        @"进度条总结",
                        @"CATextLayer"],
                      @[@"UIView制作动画的三种方式"],
                      @[@"UIView更改透明度"], nil];
    }
    return _dataSoure;
}

- (NSMutableArray *)controllerSoure
{
    if (!_controllerSoure)
    {
        _controllerSoure = [[NSMutableArray alloc]initWithObjects:
                            @[@"LayerCreateController"],
                            @[@"layerShowImageController",
                              @"SplitImageController",
                              @"stretchViewController",
                              @"redrawViewController"],
                            @[@"ChangeAnchorPointController",
                              @"AlarmClockController",
                              @"ConvertPointController",
                              @"ZPositionController",
                              @"HitTestingController",
                              @"expandButtonAreaController",
                              @"beyondRangeController",
                              @"scrollViewPreviewController",
                              @"AutoLayoutController"],
                            @[@"cornerViewController",
                              @"shadowController",
                              @"shadowTailoringController",
                              @"shadowPathController",
                              @"MaskViewController",
                              @"DynamicMaskController",
                              @"TwoMethodsMoveViewController",
                              @"DynamicMaskImprovedController",
                              @"FilterViewController"],
                            @[@"AffineTransformController",
                              @"BasicThreeListViewController"],
                            @[@"BezierPathViewController",
                              @"CAShapeLayerController",
                              @"CAProgressController",
                              @"TextLayerListController"],
                            @[@"threeMethodsController"],
                            @[@"changeOpacityController"],nil];
    }
    return _controllerSoure;
}


@end
