//
//  HWButton.h
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWButton : UIButton

//第一种方法
@property (nonatomic,assign) CGFloat minimumHitTestWidth;
@property (nonatomic,assign) CGFloat minimumHitTestHeight;

//第二种方法
@property (nonatomic,assign) UIEdgeInsets hitTestEdgeInsets;

@end
