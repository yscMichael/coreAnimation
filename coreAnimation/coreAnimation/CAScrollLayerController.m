//
//  CAScrollLayerController.m
//  coreAnimation
//
//  Created by Michael on 2019/8/30.
//  Copyright © 2019年 杨世川. All rights reserved.
//

#import "CAScrollLayerController.h"
#import "ScrollView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define BarHeight 20

@interface CAScrollLayerController ()
@property (nonatomic,strong) ScrollView *scrollView;
@property (nonatomic,strong) UIImageView *contentImage;
@end

@implementation CAScrollLayerController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
}

- (void)initViews
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentImage];

    self.scrollView.center = CGPointMake(ScreenWidth / 2.0, ScreenHeight / 2.0);
}

#pragma mark - Getter And Setter
- (ScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        _scrollView.layer.borderColor = [UIColor whiteColor].CGColor;
        _scrollView.layer.borderWidth = 2.0;
        _scrollView.contentMode = UIViewContentModeScaleToFill;
    }
    return _scrollView;
}

- (UIImageView *)contentImage
{
    if (!_contentImage)
    {
        _contentImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Snowman"]];
    }
    return _contentImage;
}

@end
