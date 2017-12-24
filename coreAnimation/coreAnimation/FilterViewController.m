//
//  FilterViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 17/12/24.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViews;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation FilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIImage *digits = [UIImage imageNamed:@"Digits.png"];
    for (UIView *view in self.allViews)
    {
        view.layer.contents = (__bridge  id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        //不加上这句话，图片显示不清楚
        view.layer.magnificationFilter = kCAFilterNearest;
    }

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];

}

- (void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];

    //set hours
    [self setDigit:components.hour / 10 forView:self.allViews[0]];
    [self setDigit:components.hour % 10 forView:self.allViews[1]];

    //set minutes
    [self setDigit:components.minute / 10 forView:self.allViews[2]];
    [self setDigit:components.minute % 10 forView:self.allViews[3]];

    //set seconds
    [self setDigit:components.second / 10 forView:self.allViews[4]];
    [self setDigit:components.second % 10 forView:self.allViews[5]];
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view
{
    //adjust contentsRect to select correct digit
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
}


@end
