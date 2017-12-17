//
//  cornerViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/17.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "cornerViewController.h"

@interface cornerViewController ()
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@end

@implementation cornerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstView.layer.cornerRadius = 20.0;
    self.secondView.layer.cornerRadius = 20.0;
    self.secondView.layer.masksToBounds = YES;

    self.firstView.layer.borderWidth = 5.0;
    self.secondView.layer.borderWidth = 5.0;
}


@end
