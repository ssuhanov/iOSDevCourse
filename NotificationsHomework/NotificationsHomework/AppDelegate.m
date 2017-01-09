//
//  AppDelegate.m
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"

@interface AppDelegate ()

@property (strong, nonatomic) Doctor *doctor1;
@property (strong, nonatomic) Doctor *doctor2;
@property (strong, nonatomic) Doctor *doctor3;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Government *government = [[Government alloc] init];
    self.doctor1 = [[Doctor alloc] initWithName:@"Serge" andSalary:800.0];
    self.doctor2 = [[Doctor alloc] initWithName:@"Andrew" andSalary:1100.0];
    self.doctor3 = [[Doctor alloc] initWithName:@"Bobby" andSalary:2000.0];
    Pensioner *pensioner1 = [[Pensioner alloc] initWithName:@"Serge" andPension:500.0];
    Pensioner *pensioner2 = [[Pensioner alloc] initWithName:@"Andrew" andPension:350.0];
    Pensioner *pensioner3 = [[Pensioner alloc] initWithName:@"Bobby" andPension:1000.0];
    Businessman *businessman1 = [[Businessman alloc] initWithName:@"Serge"];
    Businessman *businessman2 = [[Businessman alloc] initWithName:@"Charlie"];
    Businessman *businessman3 = [[Businessman alloc] initWithName:@"Greg"];
    
    government.taxLevel = 50.5;
    government.salary = 1100.0;
    government.pension = 750.0;
    government.averagePrice = 12.0;
    
    government.taxLevel = 4.5;
    government.salary = 900.0;
    government.pension = 650.0;
    government.averagePrice = 13.0;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
