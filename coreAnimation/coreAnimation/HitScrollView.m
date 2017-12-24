//
//  HitScrollView.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "HitScrollView.h"

@interface HitScrollView ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HitScrollView

- (void)awakeFromNib
{
    [super awakeFromNib];

    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;

    for (int i = 0; i < self.dataArray.count; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(width * i, 0, width, height)];
        imageView.image = [UIImage imageNamed:self.dataArray[i]];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(width * self.dataArray.count, height);
    self.scrollView.clipsToBounds = NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (hitTestView)
    {
        hitTestView = self.scrollView;
    }
    return hitTestView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 18; i ++)
        {
            [_dataArray addObject:[NSString stringWithFormat:@"%d",(i + 1)]];
        }

    }
    return _dataArray;
}



@end


