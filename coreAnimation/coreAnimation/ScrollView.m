//
//  ScrollView.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    //1、允许裁剪
    self.layer.masksToBounds = YES;
    //2、添加手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
}

#pragma mark - 添加手势
- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    //1、获取手势的偏移量
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    //2、滚动layer
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    //3、重置位置
    [recognizer setTranslation:CGPointZero inView:self];
}

#pragma mark - Getter And Setter
+ (Class)layerClass
{
    return [CAScrollLayer class];
}

@end
