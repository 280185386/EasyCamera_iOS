//
//  AppDelegate.m
//  EasyCapture
//
//  Created by phylony on 9/11/16.
//  Copyright © 2016 phylony. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [application setIdleTimerDisabled:YES];
    [[NSUserDefaults standardUserDefaults] setObject:@"114.55.107.180" forKey:@"ConfigIP"];
    [[NSUserDefaults standardUserDefaults] setObject:@"10554" forKey:@"ConfigPORT"];
    [[NSUserDefaults standardUserDefaults] setObject:@"480*640" forKey:@"resolition"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultConfig"];
    if (!array) {
        NSMutableString *randomNum = [[NSMutableString alloc] init];
        for(int i = 0; i < 13;i++){
            int num = arc4random() % 10;
            [randomNum appendString:[NSString stringWithFormat:@"%d",num]];
        }
        NSString* userPhoneName = [[UIDevice currentDevice] name];
        NSArray *configArray = @[@"121.40.50.44",@"10000",randomNum,userPhoneName,@"000000",@"iOS",@"30"];
        [[NSUserDefaults standardUserDefaults] setObject:configArray forKey:@"defaultConfig"];
        //    [[NSUserDefaults standardUserDefaults] setObject:@"192.168.66.108" forKey:@"ConfigIP"];
        //    [[NSUserDefaults standardUserDefaults] setObject:@"554" forKey:@"ConfigPORT"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
   
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
