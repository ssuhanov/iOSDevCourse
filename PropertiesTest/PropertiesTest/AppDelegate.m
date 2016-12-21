//
//  AppDelegate.m
//  PropertiesTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Boxer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Boxer *boxer1 = [[Boxer alloc] init];
    boxer1.name = @"Vasiliy";
    boxer1.age = 25;
    boxer1.height = 1.8f;
    boxer1.weight = 80.f;
    
    NSLog(@"name = %@", boxer1.name);
    NSLog(@"age = %li", (long)boxer1.age);
    NSLog(@"height = %.2f", boxer1.height);
    NSLog(@"weight = %.2f", boxer1.weight);

    Boxer *boxer2 = [[Boxer alloc] init];
    [boxer2 setName:@"Vasiliy"];
    [boxer2 setAge:25];
    [boxer2 setHeight:1.8f];
    [boxer2 setWeight:80.f];
    
    NSLog(@"name = %@", [boxer2 name]);
    NSLog(@"age = %li", (long)[boxer2 age]);
    NSLog(@"height = %.2f", [boxer2 height]);
    NSLog(@"weight = %.2f", [boxer2 weight]);
    
     NSLog(@"how old are you? %li", [boxer2 howOldAreYou]);
    
    Boxer *boxer3 = [[Boxer alloc] init];
    NSLog(@"name = %@", boxer3.name);
    NSLog(@"age = %li", (long)boxer3.age);
    NSLog(@"height = %.2f", boxer3.height);
    NSLog(@"weight = %.2f", boxer3.weight);
    NSLog(@"how old are you? %li", [boxer3 howOldAreYou]);
    
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
