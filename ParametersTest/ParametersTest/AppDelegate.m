//
//  AppDelegate.m
//  ParametersTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Object.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"TEST1");
    [self testObject1];
    NSLog(@"Test1 did finish");
    NSLog(@"%@", [self getObject1]);
//    self.object1 = nil;
    [self setShmetObject1:nil];
    
    NSLog(@"\n");
    NSLog(@"TEST2");
    [self testObject2];
    NSLog(@"Test2 did finish");
    self.object2 = [[Object alloc] init];

    NSLog(@"\n");
    NSLog(@"TEST3");
    [self testObject3];
    NSLog(@"Test3 did finish");
    
    NSLog(@"\n");
    NSLog(@"TEST4");
    [self testObject4];
    NSLog(@"Test4 did finish");

    return YES;
}

- (void)testObject1 {
    Object *obj = [[Object alloc] init];
    self.object1 = obj;
    NSLog(@"Test1 will finish");
}

- (void)testObject2 {
    Object *obj = [[Object alloc] init];
    self.object2 = obj;
    NSLog(@"Test2 will finish");
}

- (void)testObject3 {
    Object *obj = [[Object alloc] init];
    self.object3 = obj;
    NSLog(@"Test3 will finish");
}

- (void)testObject4 {
    Object *obj = [[Object alloc] init];
    self.object4 = obj;
    NSLog(@"Test4 will finish");
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
