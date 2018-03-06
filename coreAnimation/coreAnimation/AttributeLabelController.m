//
//  AttributeLabelController.m
//  coreAnimation
//
//  Created by 杨世川 on 18/3/6.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "AttributeLabelController.h"
#import <CoreText/CoreText.h>

@interface AttributeLabelController ()
@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation AttributeLabelController

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
    textLayer.alignmentMode = kCAAlignmentJustified;//字体对齐样式
    textLayer.wrapped = YES;//是否根据textLayer大小调整内容
    textLayer.contentsScale = [UIScreen mainScreen].scale;//适应Retina屏幕

    //创建富文本
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \
    elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \
    leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \
    elementum, libero ut porttitor dictum, diam odio congue lacus, vel \
    fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \
    lobortis";
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];

    //设置文本属性
    UIFont *font = [UIFont systemFontOfSize:15.0];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    NSDictionary *attributes = @{
                                 (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                                 (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
    };
    [string setAttributes:attributes range:NSMakeRange(0, [text length])];

    attributes = @{
                   (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor redColor].CGColor,
                   (__bridge id)kCTUnderlineStyleAttributeName:@(kCTUnderlineStyleSingle),
                   (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
    };
    [string setAttributes:attributes range:NSMakeRange(6, 5)];
    CFRelease(fontRef);

    //设置文本内容
    textLayer.string = string;
}




@end



