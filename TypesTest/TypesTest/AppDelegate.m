//
//  AppDelegate.m
//  TypesTest
//
//  Created by Serge Sukhanov on 12/24/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Primitive types
    BOOL boolVar = YES;
    NSInteger intVar = -10;
    NSUInteger uIntVar = 20;
    CGFloat floatVar = 1.5f;
    double doubleVar = 2.5f;
    
    NSLog(@"boolVar = %d, intVar = %li, uIntVar = %lu, floatVar = %f, doubleVar = %f", boolVar, (long)intVar, (unsigned long)uIntVar, floatVar, doubleVar);
    NSLog(@"boolVar = %lu, intVar = %lu, uIntVar = %lu, floatVar = %lu, doubleVar = %lu", sizeof(boolVar), sizeof(intVar), sizeof(uIntVar), sizeof(floatVar), sizeof(doubleVar));
    
    Student *studentA = [[Student alloc] init];
    studentA.name = @"The best student :)";
    NSLog(@"StudentA name = %@", studentA.name);
    
    Student *studentB = studentA;
    studentB.name = @"Not the best student :(";
    NSLog(@"StudentA name = %@", studentA.name);
    
    NSInteger a = 10;
    NSLog(@"a = %li", (long)a);
    
    NSInteger b = a;
    b = 5;
    NSLog(@"a = %li, b = %li", (long)a, (long)b);
    
    NSInteger *c = &a;
    *c = 8;
    NSLog(@"a = %li, b = %li, *c = %li", (long)a, (long)b, (long)*c);
    
    NSLog(@"a = %li, test = %li, a = %li", (long)a, (long)[self test:a testPointer:&a], (long)a);
    NSLog(@"a = %li, b = %li, *c = %li", (long)a, (long)b, (long)*c);

    
    // NSNumber and array of NSNumbers
    NSNumber *boolObject = [NSNumber numberWithBool:boolVar];
    NSNumber *intObject = [NSNumber numberWithInteger:intVar];
    NSNumber *uIntObject = [NSNumber numberWithUnsignedInteger:uIntVar];
    NSNumber *floatObject = [NSNumber numberWithFloat:floatVar];
    NSNumber *doubleObject = [NSNumber numberWithDouble:doubleVar];
    
    NSArray *array = [NSArray arrayWithObjects:
                      boolObject,
                      intObject,
                      uIntObject,
                      floatObject,
                      doubleObject,
                      nil];
    
    NSLog(@"%@", array);
    NSLog(@"boolVar = %d, intVar = %li, uIntVar = %lu, floatVar = %f, doubleVar = %f",
          [[array objectAtIndex:0] boolValue],
          (long)[[array objectAtIndex:1] integerValue],
          (unsigned long)[[array objectAtIndex:2] unsignedIntegerValue],
          [[array objectAtIndex:3] floatValue],
          [[array objectAtIndex:4] doubleValue]);

    
    // Enums
    Student *studentMale = [[Student alloc] init];
    //[studentMale setGender:GenderMale];
    studentMale.gender = GenderMale;
    NSLog(@"Student gender (male) = %i", studentMale.gender);
    
    studentMale.gender = GenderFemale;
    NSLog(@"Student gender (female) = %i", studentMale.gender);

    
    // Structs
    CGPoint point;
    point.x = 5.5f;
    point.y = 10.f;
    
    CGSize size;
    size.width = 10.0;
    size.height = 5.0;
    
    CGRect rect1;
    rect1.origin = point;
    rect1.size = size;
    
    NSLog(@"point = (%.1f, %.1f), size = (%.1f, %.1f)", point.x, point.y, size.width, size.height);
    NSLog(@"point = (%.1f, %.1f), size = (%.1f, %.1f)", rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
    
    point = CGPointMake(6.0, 13.4);
    size = CGSizeMake(15.4, 2.5);
    CGRect rect2 = CGRectMake(6.5, 2.3, 12.7, 11.2);
    
    NSLog(@"point = (%.1f, %.1f), size = (%.1f, %.1f)", point.x, point.y, size.width, size.height);
    NSLog(@"point = (%.1f, %.1f), size = (%.1f, %.1f)", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
    
    BOOL rectIntersect = CGRectIntersectsRect(rect1, rect2);
    CGRect rectIntersection = CGRectIntersection(rect1, rect2);
    BOOL rectContainsPoint = CGRectContainsPoint(rect1, point);
    
    NSLog(@"Is intersection: %d", rectIntersect);
    NSLog(@"point = (%.1f, %.1f), size = (%.1f, %.1f)", rectIntersection.origin.x, rectIntersection.origin.y, rectIntersection.size.width, rectIntersection.size.height);
    NSLog(@"Rect contains point: %d", rectContainsPoint);
    
    // Array of structs
    CGPoint point1 = CGPointMake(0, 5);
    CGPoint point2 = CGPointMake(3, 4);
    CGPoint point3 = CGPointMake(2, 8);
    CGPoint point4 = CGPointMake(7, 1);
    CGPoint point5 = CGPointMake(4, 4);
    
    NSArray *array2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:point1],
                       [NSValue valueWithCGPoint:point2],
                       [NSValue valueWithCGPoint:point3],
                       [NSValue valueWithCGPoint:point4],
                       [NSValue valueWithCGPoint:point5],
                       nil];
    
    for (NSValue *value in array2) {
        CGPoint p = [value CGPointValue];
        NSUInteger index = [array2 indexOfObject:value];
        NSLog(@"point[%lu] = %@", (unsigned long)index, NSStringFromCGPoint(p));
    }
    
    return YES;
}

- (NSInteger)test:(NSInteger) test testPointer:(NSInteger *)testPointer {
    *testPointer = 2;
    return (int)test;
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
