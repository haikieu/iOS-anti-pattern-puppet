//
//  AppDelegate.m
//  PuppetAntiPattern
//
//  Created by HK on 10/17/14.
//  Copyright (c) 2014 haikieu2907@gmail.com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUserDefaults * pref = [NSUserDefaults standardUserDefaults];
    [pref setObject:@"data" forKey:@"key"];
    id data = [pref objectForKey:@"key"];
    
    return YES;
}


@end
