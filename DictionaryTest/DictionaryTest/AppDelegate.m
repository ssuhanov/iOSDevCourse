//
//  AppDelegate.m
//  DictionaryTest
//
//  Created by Serge Sukhanov on 12/28/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *dictionary1 = [[NSDictionary alloc] init];
    NSDictionary *dictionary2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 @"Petrov", @"lastName",
                                 @"Vasiliy", @"name",
                                 [NSNumber numberWithInt:25], @"age",
                                 nil];
    
    NSLog(@"%@", dictionary2);
    NSLog(@"name: %@, lastName: %@, age: %li, unknownField: %li",
          [dictionary2 objectForKey:@"name"],
          [dictionary2 objectForKey:@"lastName"],
          [[dictionary2 objectForKey:@"age"] integerValue],
          [[dictionary2 objectForKey:@"name"] integerValue]);
    
    NSDictionary *dictionary3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Ivanov", @"lastName",
                                 @"Ivan", @"firstName",
                                 [NSNumber numberWithDouble:75.5], @"weight",
                                 nil];
    
    NSLog(@"%@", dictionary3);
    NSLog(@"name: %@, firstName: %@, lastName: %@, weight: %.2f, unknownField: %li",
          [dictionary3 objectForKey:@"name"],
          [dictionary3 objectForKey:@"firstName"],
          [dictionary3 objectForKey:@"lastName"],
          [[dictionary3 objectForKey:@"weight"] doubleValue],
          [[dictionary3 objectForKey:@"name"] integerValue]);
    
    NSInteger someWeight = 70;
    NSDictionary *dictionary4 = @{@"lastName": @"Sidorov",
                                  @"name": @"Vova",
                                  @"height": @87.36,
                                  @"weight": @(someWeight)};
    
    NSLog(@"%@\ncount = %lu", dictionary4, (unsigned long)dictionary4.count);
    NSLog(@"name: %@, firstName: %@, lastName: %@, weight: %.2f, height: %.2f",
          [dictionary4 objectForKey:@"name"],
          [dictionary4 objectForKey:@"firstName"],
          [dictionary4 objectForKey:@"lastName"],
          [[dictionary4 objectForKey:@"weight"] doubleValue],
          [[dictionary4 objectForKey:@"height"] doubleValue]);

    for (NSString *key in dictionary4.allKeys) {
        id obj = [dictionary4 objectForKey:key];
        NSLog(@"key: %@, value: %@", key, obj);
    }
    
    NSLog(@"==========");
    for (id obj in dictionary3.allValues) {
        NSArray *keys = [dictionary3 allKeysForObject:obj];
        for (NSString *key in keys) {
            NSLog(@"key: %@, value: %@", key, obj);
        }
    }
    
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
