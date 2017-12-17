//
//  shadowTailoringController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "shadowTailoringController.h"

@interface shadowTailoringController ()
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@end

@implementation shadowTailoringController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstView.layer.cornerRadius = 20.f;
    self.secondView.layer.cornerRadius = 20.f;

    self.firstView.layer.borderWidth = 5.0f;
    self.secondView.layer.borderWidth = 5.0f;

    self.firstView.layer.shadowOpacity = 0.5;
    self.firstView.layer.shadowOffset = CGSizeMake(0, 5);
    self.firstView.layer.shadowRadius = 5.0f;

    self.shadowView.layer.shadowOpacity = 0.5;
    self.shadowView.layer.shadowOffset = CGSizeMake(0, 5);
    self.shadowView.layer.shadowRadius = 5.0f;

    self.secondView.layer.masksToBounds = YES;
}


@end
