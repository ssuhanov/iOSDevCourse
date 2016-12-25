//
//  AppDelegate.m
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Student.h"
#import "Dancer.h"
#import "Developer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Student *student1 = [[Student alloc] init];
    Student *student2 = [[Student alloc] init];
    Student *student3 = [[Student alloc] init];
    student1.name = @"Alex";
    student2.name = @"Bob";
    student3.name = @"Garre";
    
    Dancer *dancer1 = [[Dancer alloc] init];
    Dancer *dancer2 = [[Dancer alloc] init];
    dancer1.name = @"Mike";
    dancer2.name = @"Bobby";
    
    Developer *developer1 = [[Developer alloc] init];
    developer1.name = @"Serge";
    
    NSObject *fakeObject = [[NSObject alloc] init];
    
    NSArray *patients = [NSArray arrayWithObjects:
                         fakeObject,
                         dancer1,
                         student1,
                         student2,
                         developer1,
                         student3,
                         dancer2,
                         nil];
    
    NSLog(@"\n");
    for (id <Patient> patient in patients) {
        NSLog(@"==========");
        
        if (![patient conformsToProtocol:@protocol(Patient)]) {
            NSLog(@"FAKE PATIENT!");
            continue;
        }
        NSLog(@"Patient name: %@", patient.name);
        
        if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
            NSLog(@"How is your family? %@", [patient howIsYourFamily]);
        }
        
        if ([patient respondsToSelector:@selector(howIsYourJob)]) {
            NSLog(@"How is your job? %@", [patient howIsYourJob]);
        }
        [self healPatient:patient];
    }
    
    NSLog(@"\n ");
    for (int i = 0; i < [patients count]; ++i) {
        id <Patient> patient = [patients objectAtIndex:i];
        NSLog(@"==========");
        
        if (![patient conformsToProtocol:@protocol(Patient)]) {
            NSLog(@"FAKE PATIENT!");
            continue;
        }
        NSLog(@"Patient name: %@", patient.name);
        [self healPatient:patient];
    }
    
    return YES;
}

- (void)healPatient:(id <Patient>)patient {
    if (![patient areYouOK]) {
        [patient takePill];
        if (![patient areYouOK]) {
            [patient makeShot];
        }
    }
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
