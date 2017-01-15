//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Serge Sukhanov on 1/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "SomeObject.h"

typedef void (^OurTestBlock)(void);
typedef NSString *(^OurStringTestBlock)(NSInteger intValue);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock ourTestBlock;
@property (strong, nonatomic) NSString *name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // ==========
    [self testMethod];
    
    void (^testBlock)(void);
    testBlock = ^{
        NSLog(@"test block");
    };
    
    testBlock();
    testBlock();
    testBlock();
    
    // ==========
    [self testMethodWithParams:@"Hello!" andValue:5];
    
    void (^testBlockWithParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        NSLog(@"test block with \"%@\" and %li", string, (long)intValue);
    };
    
    testBlockWithParams(@"Hello man", 12);
    
    // ==========
    NSString *result = [self testMethodWithReturnValueAndParams:@"hi" andValue:25];
    NSLog(@"%@", result);
    
    NSString *(^testBlockWithReturnedValueAndParams)(NSString *, double);
    testBlockWithReturnedValueAndParams = ^(NSString *string, double doubleValue) {
        return [NSString stringWithFormat:@"returned value from test block with \"%@\" and %f", string, doubleValue];
    };
    
    NSString *resultBlock = testBlockWithReturnedValueAndParams(@"hi man", 33);
    NSLog(@"%@", resultBlock);
    
    // ==========
    __block NSString *testString = @"How it is possible?";
    __block NSInteger i = 0;
    
    void (^testBlock2)(void) = ^{
        testString = [NSString stringWithFormat:@"How it is possible? called %li times", (long)++i];
        NSLog(@"test block with test string: %@", testString);
    };
    
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    
    // ==========
    [self testBlocksMethod:testBlock];
    [self testBlocksMethod:testBlock2];
    [self testBlocksMethod:^{
        NSLog(@"Block is here");
    }];
    
    OurTestBlock testBlock3 = ^{
        NSLog(@"Our test block");
    };
    
    [self testBlocksMethod2:testBlock3];
    [self testBlocksMethod2:testBlock2];
    
    OurStringTestBlock testStringBlock = ^(NSInteger intValue) {
        return [NSString stringWithFormat:@"result is %li", (long)intValue];
    };
    
    [self testBlocksMethod3WithIntValue:5 andBlock:testStringBlock];
    [self testBlocksMethod3WithIntValue:7 andBlock:^NSString *(NSInteger intValue) {
        return [NSString stringWithFormat:@"Happy number is %li", (long)intValue];
    }];
    
    // ==========
    SomeObject *someObject1 = [[SomeObject alloc] init];
    someObject1.name = @"Serge";
    OurTestBlock testObjectBlock = ^{
        NSLog(@"Some object name: %@", someObject1.name);
    };
    someObject1.name = @"Andrew";
    testObjectBlock();
    
    self.ourTestBlock = testObjectBlock;
    __weak SomeObject *weakSomeObject1 = someObject1;
    self.ourTestBlock = ^{
        NSLog(@"Some object name: %@", weakSomeObject1.name);
    };
    someObject1.name = @"Charlie";
    
    self.ourTestBlock();
    
    // ==========
    self.name = @"Hi";
    
    SomeObject *someObject2 = [[SomeObject alloc] init];
    someObject2.name = @"Garry";
    
    [someObject2 testMethod:^{
        NSLog(@"self.name = %@", self.name);
    }];
    
    return YES;
}

- (void)testMethod {
    NSLog(@"test method");
}

- (void)testMethodWithParams:(NSString *)string andValue:(NSInteger)intValue {
    NSLog(@"test method with \"%@\" and %li", string, (long)intValue);
}

- (NSString *)testMethodWithReturnValueAndParams:(NSString *)string andValue:(NSInteger)intValue {
    return [NSString stringWithFormat:@"returned value from test method with \"%@\" and %li", string, (long)intValue];
}

- (void)testBlocksMethod:(void (^)(void))block {
    NSLog(@"test block method");
    block();
    block();
    block();
    NSLog(@"test block method ended");
}

- (void)testBlocksMethod2:(OurTestBlock)block {
    NSLog(@"test block 2 method");
    block();
    block();
    NSLog(@"test block 2 method ended");
}

- (void)testBlocksMethod3WithIntValue:(NSInteger)intValue andBlock:(OurStringTestBlock)block {
    NSLog(@"test block 3 method");
    NSLog(@"%@", block(intValue));
    NSLog(@"test block 3 method ended");
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
