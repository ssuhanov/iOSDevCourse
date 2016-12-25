//
//  AppDelegate.m
//  TypesHomework
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Developer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Enums
    Developer *developer1 = [[Developer alloc] init];
    developer1.programmingLanguage = ObjectiveC;
    developer1.operatingSystem = MacOS;
    
    Developer *developer2 = [[Developer alloc] init];
    developer2.programmingLanguage = Java;
    developer2.operatingSystem = Win10;
    
    
    // Random dots
    CGFloat fieldSize = 10.0;
    CGFloat centerRectWidthHeight = 3.0;
    CGFloat centerX = fieldSize / 2.0;
    CGFloat centerY = fieldSize / 2.0;
    
    CGSize centerRectSize = CGSizeMake(centerRectWidthHeight, centerRectWidthHeight);
    CGPoint centerRectOrigin = CGPointMake(centerX-centerRectWidthHeight/2, centerY-centerRectWidthHeight/2);
    CGRect centerRect;
    centerRect.origin = centerRectOrigin;
    centerRect.size = centerRectSize;
    
    for (int i = 0; i < 20; ++i) {
        NSInteger randomX = arc4random() % 10;
        NSInteger randomY = arc4random() % 10;
        CGPoint point = CGPointMake(randomX, randomY);
        if (CGRectContainsPoint(centerRect, point)) {
            NSLog(@"====================");
            NSLog(@"Center rect: %@", NSStringFromCGRect(centerRect));
            NSLog(@"Point: %@", NSStringFromCGPoint(point));
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
