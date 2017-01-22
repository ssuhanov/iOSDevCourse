//
//  AppDelegate.m
//  ThreadsTest
//
//  Created by Serge Sukhanov on 1/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // MARK: selector in background
    [self performSelectorInBackground:@selector(testThreadWithID:) withObject:@1];
    [self performSelectorInBackground:@selector(testThreadWithID:) withObject:@2];
    [self performSelectorInBackground:@selector(testThreadWithID:) withObject:@3];
    [self performSelectorInBackground:@selector(testThreadWithID:) withObject:@4];
    
    NSLog(@"%@", [[NSThread currentThread] isMainThread] ? @"Main thread" : @"Background");
    
    for (int i = 0; i < 10; ++i) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
        thread.name = [NSString stringWithFormat:@"Thread #%i", i+1];
        [thread start];
    }
    
    
    // MARK: NSThread
    self.array = [NSMutableArray array];
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"X"];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"O"];
    thread1.name = @"Thread for Xs";
    thread2.name = @"Thread for Os";
    [thread1 start];
    [thread2 start];
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3.0];
    
    // MARK: GCD
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started in %@", [NSThread currentThread].name, [[NSThread currentThread] isMainThread] ? @"main thread" : @"background");
        for (int i = 0; i < 20000000; ++i) { }
        NSLog(@"%@ finished in %f", [NSThread currentThread].name, CACurrentMediaTime() - startTime);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            double startTime = CACurrentMediaTime();
            NSLog(@"%@ started in %@", [NSThread currentThread].name, [[NSThread currentThread] isMainThread] ? @"main thread" : @"background");
            for (int i = 0; i < 20000000; ++i) { }
            NSLog(@"%@ finished in %f", [NSThread currentThread].name, CACurrentMediaTime() - startTime);
        });
        
    });
    
    dispatch_queue_t queue1 = dispatch_queue_create("com.ssuhanov.ThreadsTest.queue1", DISPATCH_QUEUE_SERIAL);
    __weak id weakSelf = self;
    dispatch_async(queue1, ^{
        [weakSelf addStringToArray:@"X"];
    });
    dispatch_async(queue1, ^{
        [weakSelf addStringToArray:@"O"];
    });
    dispatch_async(queue1, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf printArray];
            // UI refresh
        });
    });
    
    NSLog(@"application did fininsh launching");
    
    return YES;
}

- (void)testThread {
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started in %@", [NSThread currentThread].name, [[NSThread currentThread] isMainThread] ? @"main thread" : @"background");
        
        for (int i = 0; i < 20000000; ++i) {
//            NSLog(@"%i", i);
        }
        
        NSLog(@"%@ finished in %f", [NSThread currentThread].name, CACurrentMediaTime() - startTime);
        
        // for main thread
        //[self performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
    }
}

- (void)testThreadWithID:(NSNumber *)threadID {
    for (int i = 0; i < 500; ++i) {
        NSLog(@"id: %li, value: %i", (long)[threadID integerValue], i);
    }
}

- (void)addStringToArray:(NSString *)string {
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started in %@", [NSThread currentThread].name, [[NSThread currentThread] isMainThread] ? @"main thread" : @"background");
        
        double calculationsStartTime = CACurrentMediaTime();
        NSLog(@"%@ calculations started", [NSThread currentThread].name);
//        @synchronized (self) {
            for (int i = 0; i < 200000; ++i) {
                @synchronized (self) {
                    [self.array addObject:string];
                }
            }
//        }
        NSLog(@"%@ calculations finished in %f", [NSThread currentThread].name, CACurrentMediaTime() - calculationsStartTime);
        
        NSLog(@"%@ finished in %f", [NSThread currentThread].name, CACurrentMediaTime() - startTime);
    }
}

- (void)printArray {
    NSLog(@"%@ with count %lu", self.array, (unsigned long)self.array.count);
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
