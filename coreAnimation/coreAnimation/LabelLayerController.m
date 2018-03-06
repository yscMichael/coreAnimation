//
//  LabelLayerController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/3/6.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "LabelLayerController.h"

@interface LabelLayerController ()

@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation LabelLayerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelView.backgroundColor = [UIColor clearColor];
    self.labelView.layer.borderColor = [UIColor redColor].CGColor;
    self.labelView.layer.borderWidth = 1.0;

    //添加textLayer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];

    //设置textLayer
    textLayer.foregroundColor = [UIColor blackColor].CGColor;//字体颜色
    textLayer.alignmentMode = kCAAlignmentJustified;//字体对齐样式
    textLayer.wrapped = YES;//是否根据textLayer大小调整内容
    UIFont *font = [UIFont systemFontOfSize:15.0];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;//设置字体
    textLayer.fontSize = font.pointSize;//设置字体大小
    CGFontRelease(fontRef);

    //设置textLayer内容
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \
    elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \
    leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \
    elementum, libero ut porttitor dictum, diam odio congue lacus, vel \
    fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \
    lobortis";
    textLayer.string = text;

    //适应Retina屏幕
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}


@end
