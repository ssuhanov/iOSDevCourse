//
//  AppDelegate.m
//  SelectorsTest
//
//  Created by Serge Sukhanov on 1/11/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "SimpleObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SimpleObject *simpleObject = [[SimpleObject alloc] init];
    [self testMethod];
    SEL selector1 = @selector(testMethod);
    [self performSelector:selector1];
    [simpleObject performSelector:selector1];
    
    SEL selector2 = @selector(testMethod:);
    [self performSelector:selector2 withObject:@"some string"];
    
    [self performSelector:@selector(testMethod:parameter2:) withObject:@"first string" withObject:@"second string"];
    [self performSelector:@selector(testMethod:) withObject:@"string 1" afterDelay:5.0];
    
    NSString *secret = [simpleObject performSelector:@selector(superSecretText)];
    NSLog(@"secret = %@", secret);
    
    [simpleObject performSelector:selector1 withObject:nil afterDelay:5.0];
    
    [self performSelector:@selector(testMethodParameter1:) withObject:@(11)];
    
    NSString *a = NSStringFromSelector(selector1);
    NSLog(@"selector1 = %@", a);
    
    SEL sel = NSSelectorFromString(a);
    [self performSelector:sel];
    
    NSString *someString = [self testMethodParameter1:2 parameter2:3.1 parameter3:5.5];
    NSLog(@"Some string = %@", someString);
    
    NSMethodSignature *signature = [AppDelegate instanceMethodSignatureForSelector:@selector(testMethodParameter1:parameter2:parameter3:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = @selector(testMethodParameter1:parameter2:parameter3:);
    
    NSInteger intVal = 2;
    double doubleVal = 4.2;
    double doubleVal2 = 6.6;
    
    NSInteger *pIntVal = &intVal;
    double *pDoubleVal = &doubleVal;
    double *pDoubleVal2 = &doubleVal2;
    
    [invocation setArgument:pIntVal atIndex:2];
    [invocation setArgument:pDoubleVal atIndex:3];
    [invocation setArgument:pDoubleVal2 atIndex:4];
    
    [invocation invoke];
    
    __unsafe_unretained NSString *someStringInvoke = nil;
    [invocation getReturnValue:&someStringInvoke];
    NSLog(@"Invoke some string = %@", someStringInvoke);
    
    return YES;
}

- (void)testMethod {
    NSLog(@"testMethod");
}

- (void)testMethod:(NSString *)string {
    NSLog(@"testMethod: %@", string);
}

- (void)testMethod:(NSString *)string parameter2:(NSString *)string2 {
    NSLog(@"test method: %@, parameter2: %@", string, string2);
}

- (void)testMethodParameter1:(NSInteger)intValue {
    NSLog(@"testMethod with int: %li", (long)intValue);
}

- (NSString *)testMethodParameter1:(NSInteger)intValue parameter2:(double)doubleValue parameter3:(double)doubleValue2 {
    NSString *result = [NSString stringWithFormat:@"test method with int: %li, double: %f, double2: %f", (long)intValue, doubleValue, doubleValue2];
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
