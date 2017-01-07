//
//  AppDelegate.m
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h"
#import "Friend.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Doctor *doctor = [[Doctor alloc] init];
    Friend *friend1 = [[Friend alloc] initWithName:@"Tolyan"];
    Friend *friend2 = [[Friend alloc] initWithName:@"Kolyan"];
    
    Patient *patient1 = [[Patient alloc] initWithName:@"Serge" temperature:38.0 andBrokenLeg:NO];
    Patient *patient2 = [[Patient alloc] initWithName:@"Nick" temperature:40.5 andBrokenLeg:NO];
    Patient *patient3 = [[Patient alloc] initWithName:@"Bobby" temperature:36.6 andBrokenLeg:YES];
    Patient *patient4 = [[Patient alloc] initWithName:@"Garry" temperature:37.9 andBrokenLeg:NO];
    Patient *patient5 = [[Patient alloc] initWithName:@"Jasper" temperature:38.0 andBrokenLeg:YES];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = friend1;
    patient5.delegate = friend2;
    
    NSArray *patients = @[patient1, patient2, patient3, patient4, patient5];
    
    for (Patient *patient in patients) {
        [patient areYouOk];
    }
    
    [doctor raport];
    
    Doctor *otherDoctor = [[Doctor alloc] init];
    NSMutableArray *displeasedPatients = [[NSMutableArray alloc] init];
    for (Patient *patient in patients) {
        if ([patient displeased]) {
            [displeasedPatients addObject:patient];
            patient.delegate = otherDoctor;
        }
    }
    
    for (Patient *patient in displeasedPatients) {
        NSLog(@"%@ for the patient %@", (patient.delegate == otherDoctor ? @"Doctor changed" : @"The same doctor"), patient.name);
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
