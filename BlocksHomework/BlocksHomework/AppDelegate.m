//
//  AppDelegate.m
//  BlocksHomework
//
//  Created by Serge Sukhanov on 1/18/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Patient.h"

typedef NSString *(^DoubleToStringBlock)(double doubleValue);

@interface AppDelegate ()

@property (strong, nonatomic) NSArray *patients;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"==========");
    void (^firstBlock)(void) = ^{
        NSLog(@"This is the first block");
    };
    firstBlock();
    
    void (^secondBlock)(NSString *) = ^(NSString *string) {
        NSLog(@"The second block with the string: %@", string);
    };
    secondBlock(@"some string for the second block");
    
    DoubleToStringBlock thirdBlock = ^(double doubleValue) {
        return [NSString stringWithFormat:@"Double value for the third block is %f", doubleValue];
    };
    NSString *myString = thirdBlock(2.5);
    NSLog(@"%@", myString);
    
    NSString *stringFromMethod = [self methodWithDoubleValue:3.4 andBlock:^NSString *(double doubleValue) {
        return [NSString stringWithFormat:@"Value from the method is %f", doubleValue];
    }];
    NSLog(@"%@", stringFromMethod);
    
    NSLog(@"==========");
    Student *student1 = [[Student alloc] initWithFirstName:@"Alex" andLastName:@"Alexandrov"];
    Student *student2 = [[Student alloc] initWithFirstName:@"Bobby" andLastName:@"Morgan"];
    Student *student3 = [[Student alloc] initWithFirstName:@"Michael" andLastName:@"Jackson"];
    Student *student4 = [[Student alloc] initWithFirstName:@"Anna" andLastName:@"Jackson"];
    Student *student5 = [[Student alloc] initWithFirstName:@"Debra" andLastName:@"Morgan"];
    Student *student6 = [[Student alloc] initWithFirstName:@"Cindy" andLastName:@"Lake"];
    Student *student7 = [[Student alloc] initWithFirstName:@"Anna" andLastName:@"Alexandrova"];
    
    NSArray *students = @[student1,
                          student2,
                          student3,
                          student4,
                          student5,
                          student6,
                          student7];
    [self showStudents:students];
    
    NSMutableArray *mutableStudents = [NSMutableArray arrayWithArray:students];
    
    [mutableStudents sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *student1 = [(Student *)obj1 description];
        NSString *student2 = ((Student *)obj2).description;
        
        return [student1 compare:student2];
    }];
    
    [self showStudents:(NSArray *)mutableStudents];
    
    NSLog(@"==========");
    FeelBadBlock patientBlock = ^(Patient *patient, double temperature) {
        NSLog(@"Patient %@ feels bad", patient.name);
        
        if (patient.temperature >= 37.0 && patient.temperature <= 39.0) {
            [patient takePill];
        } else if (patient.temperature > 39.0) {
            [patient makeShot];
        } else {
            NSLog(@"Patient %@ should have a rest", patient.name);
        }
    };
    
    Patient *patient1 = [[Patient alloc] initWithBlock:patientBlock];
    patient1.name = @"Vova";
    patient1.temperature = 36.6;
    
    Patient *patient2 = [[Patient alloc] initWithBlock:patientBlock];
    patient2.name = @"Petro";
    patient2.temperature = 40.2;
    
    Patient *patient3 = [[Patient alloc] initWithBlock:patientBlock];
    patient3.name = @"Dima";
    patient3.temperature = 37.1;
    
    Patient *patient4 = [[Patient alloc] initWithBlock:patientBlock];
    patient4.name = @"Alex";
    patient4.temperature = 38.0;
    
    self.patients = @[patient1, patient2, patient3, patient4];
    
//    for (Patient *patient in patients) {
//        [patient howAreYouWithBlock:patientBlock];
//    }
    
    return YES;
}

- (NSString *)methodWithDoubleValue:(double)doubleValue andBlock:(DoubleToStringBlock)block {
    return block(doubleValue);
}

- (void)showStudents:(NSArray *)students {
    NSLog(@"=====");
    for (Student *student in students) {
        NSLog(@"%@", student);
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
