//
//  AppDelegate.m
//  coreAnimation
//
//  Created by 杨世川 on 17/10/15.
//  Copyright © 2017年 杨世川. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "fallingSnowViewController.h"
#import "TaijiViewController.h"
#import "EmitterViewController.h"
#import "RainViewController.h"
#import "LoadingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    ViewController *viewCtrl = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewCtrl];
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

    //飘落的雪花
    //fallingSnowViewController *fallingCtrl = [[fallingSnowViewController alloc] init];
    //自动旋转的太极
    //TaijiViewController *taijiViewCtrl = [[TaijiViewController alloc] init];
    //雪花效果
    //EmitterViewController *emitterViewCtrl = [[EmitterViewController alloc] init];
    //下雨效果
    //RainViewController *rainViewCtrl = [[RainViewController alloc] init];
    //旋转效果
    LoadingViewController *loadingViewCtrl = [[LoadingViewController alloc] init];
    self.window.rootViewController = loadingViewCtrl;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
