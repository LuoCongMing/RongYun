//
//  AppDelegate.m
//  RongYun
//
//  Created by mac on 2018/7/26.
//  Copyright © 2018年 Zhou. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[RCIM sharedRCIM]initWithAppKey:@"uwd1c0sxuplw1"];
    //连接融云服务器
    [[RCIM sharedRCIM]connectWithToken:@"p4FHYpw+EvzXmhVDrytaOxS2F9k4N1gKBA5YuKlPaPoTYg+f5uKVf1m+pKx7E52Bjv/lhVAXSJMMq9JPcSetyA==" success:^(NSString *userId) {
        NSLog(@"%@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登录的错误码为：%ld",(long)status);
    } tokenIncorrect:^{
        NSLog(@"");
    }];
    
    [[RCIM sharedRCIM] setUserInfoDataSource:self];

    
 
    return YES;
}
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion
{
    // 每次展示用户头像等信息都会调用,正常开发应该从app服务器获取,保存在本地
    RCUserInfo *info = [[RCUserInfo alloc] initWithUserId:userId name:@"name" portrait:@"http://tx.haiqq.com/uploads/allimg/160417/1_041F15KK0L.jpg"];
    completion(info);
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
