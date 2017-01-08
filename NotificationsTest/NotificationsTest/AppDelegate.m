//
//  AppDelegate.m
//  NotificationsTest
//
//  Created by Serge Sukhanov on 1/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government *government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    self.government = [[Government alloc] init];
    Doctor *doctor1 = [[Doctor alloc] initWithName:@"Serge" andSalary:800.0];
    Doctor *doctor2 = [[Doctor alloc] initWithName:@"Andrew" andSalary:1100.0];
    Doctor *doctor3 = [[Doctor alloc] initWithName:@"Bobby" andSalary:2000.0];
    
    self.government.taxLevel = 5.5;
    
    NSLog(@"Doctor %@ salary: %.2f", doctor1.name, doctor1.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor2.name, doctor2.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor3.name, doctor3.salary);
    self.government.salary = 1100.0;
    NSLog(@"Doctor %@ salary: %.2f", doctor1.name, doctor1.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor2.name, doctor2.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor3.name, doctor3.salary);
    self.government.salary = 900.0;
    NSLog(@"Doctor %@ salary: %.2f", doctor1.name, doctor1.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor2.name, doctor2.salary);
    NSLog(@"Doctor %@ salary: %.2f", doctor3.name, doctor3.salary);
    
    self.government.pension = 550.0;
    self.government.averagePrice = 15.0;
    
    return YES;
}

- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:GovernmentTaxLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)governmentNotification:(NSNotification *)notification {
    NSLog(@"government notify about %@", notification.userInfo);
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
