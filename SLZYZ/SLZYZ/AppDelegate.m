//
//  AppDelegate.m
//  SLZY
//
//  Created by 1780933497@qq.com on 16/4/25.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "AppDelegate.h"
#import "SlideNavigationController.h"
#import "CSLeftViewController.h"
#import "CSMainViewController.h"
#import "CSNetFatureController.h"
#define CSVersionKey @"version"
//#import "AFNetworking.h"
//#import "MBProgressHUD+MJ.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
      
    // Override point for customization after application launch.
    //选择根控制器
    //1.获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //2.获取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:CSVersionKey];
    //判断当前是否是新的版本
    if ([currentVersion isEqualToString:lastVersion]) {
        
        CSMainViewController *mainVC = [[CSMainViewController alloc] init];
        self.window.rootViewController = [[SlideNavigationController alloc] initWithRootViewController:mainVC];
        
        CSLeftViewController *leftVC = [[CSLeftViewController alloc] init];
        
        [SlideNavigationController sharedInstance].leftMenu = leftVC;
        [SlideNavigationController sharedInstance].menuRevealAnimationDuration = .18;
        
//        [SlideNavigationController sharedInstance].navigationBar.backgroundColor = CSColor(107, 67, 21);
        
    }
    
    else{ // 有最新的版本号
        
        // 进入新特性界面
        
        // 如果有新特性，进入新特性界面
        CSNetFatureController *NewVC = [[CSNetFatureController alloc] init];
        self.window.rootViewController = NewVC;
        
        
        // 保持当前的版本，用偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:CSVersionKey];
    }
    
  
    //创建网路监测管理对象
    //设置监听
    //创建网络监听管理者对象
   // AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    /*
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,//未识别的网络
     AFNetworkReachabilityStatusNotReachable     = 0,//不可达的网络(未连接)
     AFNetworkReachabilityStatusReachableViaWWAN = 1,//2G,3G,4G...
     AFNetworkReachabilityStatusReachableViaWiFi = 2,//wifi网络
     };
     */
    
      /*
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                //[Singleton shareSingleton].afnconnection = -1;
                [MBProgressHUD showSuccess:@"未识别的网络"];
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                //[Singleton shareSingleton].afnconnection = 0;
                [MBProgressHUD showSuccess:@"没有网络(断网)"];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //[Singleton shareSingleton].afnconnection = 1;
                [MBProgressHUD showSuccess:@"手机自带网络"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // [Singleton shareSingleton].afnconnection = 2;
                [MBProgressHUD showSuccess:@"WIFI"];
                break;
            default:
                break;
        }
    }];
    //开始监听
    [manager startMonitoring];
    
    */
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
