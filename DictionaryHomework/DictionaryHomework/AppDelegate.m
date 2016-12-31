//
//  AppDelegate.m
//  DictionaryHomework
//
//  Created by Serge Sukhanov on 12/28/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Student *student1 = [[Student alloc] initWithFirstName:@"Ivan" andLastName:@"Ivanov"];
    Student *student2 = [[Student alloc] initWithFirstName:@"Petr" andLastName:@"Petrov"];
    Student *student3 = [[Student alloc] initWithFirstName:@"Sidr" andLastName:@"Sidorov"];
    Student *student4 = [[Student alloc] initWithFirstName:@"Michael" andLastName:@"Jackson"];
    Student *student5 = [[Student alloc] initWithFirstName:@"Robbie" andLastName:@"Williams"];
    Student *student6 = [[Student alloc] initWithFirstName:@"Andrew" andLastName:@"Jackson"];
    Student *student7 = [[Student alloc] initWithFirstName:@"Bob" andLastName:@"Marley"];
    Student *student8 = [[Student alloc] initWithFirstName:@"Charlie" andLastName:@"Angel"];
    Student *student9 = [[Student alloc] initWithFirstName:@"Eva" andLastName:@"Adams"];
    Student *student10 = [[Student alloc] initWithFirstName:@"Donnie" andLastName:@"Dummy"];
    Student *student11 = [[Student alloc] initWithFirstName:@"Frank" andLastName:@"Chan"];
    Student *student12 = [[Student alloc] initWithFirstName:@"Lisa" andLastName:@"Kudrow"];
    
    student5.greeting = @"Hi!";
    student10.greeting = @"Hello!";
    NSDictionary *studentsDictionary = @{[student1 fullName]: student1,
                                         [student2 fullName]: student2,
                                         [student3 fullName]: student3,
                                         [student4 fullName]: student4,
                                         [student5 fullName]: student5,
                                         [student6 fullName]: student6,
                                         [student7 fullName]: student7,
                                         [student8 fullName]: student8,
                                         [student9 fullName]: student9,
                                         [student10 fullName]: student10,
                                         [student11 fullName]: student11,
                                         [student12 fullName]: student12};
    
    NSLog(@"%@", studentsDictionary);
    
    NSLog(@"==========");
    for (NSString *key in studentsDictionary.allKeys) {
        Student *student = [studentsDictionary objectForKey:key];
        NSLog(@"%@", student);
    }
    
    NSLog(@"==========");
    NSMutableArray *keysArray = [NSMutableArray arrayWithArray:studentsDictionary.allKeys];
    [keysArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *key1 = (NSString *)obj1;
        NSString *key2 = (NSString *)obj2;
        return [key1 compare:key2];
    }];

    for (NSString *key in keysArray) {
        Student *student = [studentsDictionary objectForKey:key];
        NSLog(@"%@", student);
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
