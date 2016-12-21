//
//  AppDelegate.m
//  ArraysTest
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Child.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSArray *array1 = [[NSArray alloc] initWithObjects:
                       @"String 11",
                       @"String 12",
                       @"String 13",
                       @"String 14",
                       nil];
    
    NSLog(@"\n==========");
    for (int i = 0; i < [array1 count]; ++i) {
        NSLog(@"%@", [array1 objectAtIndex:i]);
        NSLog(@"i = %i", i);
    }
    
    NSLog(@"\n==========");
    for (int i = [array1 count] - 1; i >= 0; --i) {
        NSLog(@"%@", [array1 objectAtIndex:i]);
        NSLog(@"i = %i", i);
    }
    
    NSLog(@"\n==========");
    for (NSString *string in array1) {
        NSLog(@"%@", string);
        NSLog(@"index = %lu", (unsigned long)[array1 indexOfObject:string]);
    }
    
    NSArray *array2 = [NSArray arrayWithObjects:
                       @"String 21",
                       @"String 22",
                       @"String 23",
                       @"String 24",
                       nil];
    
    NSLog(@"\n==========");
    for (NSString *string in array2) {
        NSLog(@"%@", string);
        NSLog(@"index = %lu", (unsigned long)[array2 indexOfObject:string]);
    }
    
    NSArray *array3 = @[@"String 31",
                        @"String 32",
                        @"String 33",
                        @"String 34"];
    
    NSLog(@"\n==========");
    for (NSString *string in array3) {
        NSLog(@"%@", string);
        NSLog(@"index = %lu", (unsigned long)[array3 indexOfObject:string]);
    }
    
    Object *obj1 = [[Object alloc] init];
    Object *obj2 = [[Object alloc] init];
    Object *obj3 = [[Object alloc] init];
    
    obj1.name = @"Andrew";
    obj2.name = @"Bob";
    [obj3 setName:@"Charley"];
    
    NSArray *arrayObj1 = @[obj1, obj2, obj3];
    NSLog(@"\n==========");
    for (Object *obj in arrayObj1) {
        NSLog(@"%@", obj.name);
        [obj action];
    }
    
    Child *child1 = [[Child alloc] init];
    child1.name = @"Justin";
    child1.lastName = @"Bieber";
    
    NSArray *arrayObj2 = @[child1, obj1, obj2, obj3];
    NSLog(@"\n==========");
    for (Object *obj in arrayObj2) {
        NSLog(@"%@", obj.name);
        [obj action];
        
        if ([obj isKindOfClass:[Child class]]) {
            Child *child = (Child *)obj;
            NSLog(@"%@", child.lastName);
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
