//
//  AppDelegate.m
//  BitsHomework
//
//  Created by Serge Sukhanov on 1/31/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableArray *students = [NSMutableArray array];
    
    for (int i = 0; i < 10; ++i) {
        Student *student = [[Student alloc] init];
        [students addObject:student];
//        NSLog(@"%@", student);
    }
    
    for (Student *student in students) {
        student.subjectType = arc4random() % 128;
//        NSLog(@"%@", student);
    }
    
    NSMutableArray *techSpecialists = [NSMutableArray array];
    NSMutableArray *humanities = [NSMutableArray array];
    NSInteger programmersCount = 0;
    
    for (Student *student in students) {
        if ([student isTechSpecialist]) {
            [techSpecialists addObject:student];
            if ([student isType:StudentSubjectTypeProgramming]) {
                ++programmersCount;
            }
        } else {
            [humanities addObject:student];
        }
    }
    
    NSLog(@"\n");
    NSLog(@"====================\n");
    NSLog(@"Tech specialists (count of programmers = %li):\n", (long)programmersCount);
    for (Student *student in techSpecialists) {
        NSLog(@"%@", student);
    }

    NSLog(@"\n");
    NSLog(@"====================\n");
    NSLog(@"Humanities:\n");
    for (Student *student in humanities) {
        NSLog(@"%@", student);
    }
    
    NSLog(@"\n");
    NSLog(@"====================\n");
    NSLog(@"Students with(out) biology:\n");
    for (Student *student in students) {
        if ([student isType:StudentSubjectTypeBiology]) {
            [student removeSubjectType:StudentSubjectTypeBiology];
            NSLog(@"%@", student);
        }
    }
    
    NSLog(@"%u = %@", 5, [self bitsFromInteger:5]);
    NSLog(@"%u = %@", 1, [self bitsFromInteger:1]);
    NSLog(@"%u = %@", 8, [self bitsFromInteger:8]);
    UInt32 randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);
    randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);
    randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);
    randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);
    randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);
    randomUInt = arc4random();
    NSLog(@"%u = %@", randomUInt, [self bitsFromInteger:randomUInt]);

    return YES;
}

- (NSString *)bitsFromInteger:(UInt32)integerValue {
    NSMutableString *result = [NSMutableString string];
    for (int i = sizeof(UInt32)*8; i > 0; --i) {
        if (i % 8 == 0) {
            [result appendString:@" "];
        }
        UInt32 bitToCheck = 1 << (i-1);
        [result appendString:(integerValue & bitToCheck) ? @"1" : @"0"];
    }
    return result;
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
