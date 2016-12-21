//
//  AppDelegate.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Biker.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Developer.h"
#import "Cat.h"
#import "Dog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Human *human = [[Human alloc] init];
    Biker *biker = [[Biker alloc] init];
    Runner *runner = [[Runner alloc] init];
    Swimmer *swimmer = [[Swimmer alloc] init];
    Developer *developer = [[Developer alloc] init];
    
    NSMutableArray *humansArray = [NSMutableArray arrayWithArray:@[human, biker, runner, swimmer]];
    
    for (Human *hum in humansArray) {
        NSLog(@"\n");
        [self showHuman:hum];
    }
    
    [humansArray addObject:developer];
    
    NSLog(@"\n====================");
    for (int i = (int)[humansArray count]-1; i >= 0; --i) {
        Human *hum = [humansArray objectAtIndex:i];
        NSLog(@"\n");
        [self showHuman:hum];
    }
    
    Cat *cat = [[Cat alloc] init];
    Dog *dog = [[Dog alloc] init];
    
    NSArray *zooArray = @[cat, dog];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:zooArray];
    [array addObjectsFromArray:humansArray];
    
    NSLog(@"\n====================");
    for (id someone in array) {
        [self showSomeoneAsHuman:someone];
        [self showSomeoneAsAnimal:someone];
    }
    
    NSLog(@"\n====================");
    NSInteger maxElementsCount = MAX([humansArray count], [zooArray count]);
    for (int i = 0; i < maxElementsCount; ++i) {
        if (i < [humansArray count]) {
            id someone = [humansArray objectAtIndex:i];
            [self showSomeoneAsHuman:someone];
        }
        
        if (i < [zooArray count]) {
            id someone = [zooArray objectAtIndex:i];
            [self showSomeoneAsAnimal:someone];
        }
    }
    
    NSLog(@"\n====================");
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 isKindOfClass:[Human class]] && [obj2 isKindOfClass:[Human class]]) {
            Human *hum1 = (Human *)obj1;
            Human *hum2 = (Human *)obj2;
            return [hum1.name compare:hum2.name];
            
        } else  if ([obj1 isKindOfClass:[Animal class]] && [obj2 isKindOfClass:[Animal class]]) {
            Animal *anim1 = (Animal *)obj1;
            Animal *anim2 = (Animal *)obj2;
            return [anim1.type compare:anim2.type];
            
        } else if ([obj1 isKindOfClass:[Human class]]) {
            return NSOrderedAscending;
            
        } else {
            return NSOrderedDescending;
        }
    }];
    
    for (id someone in array) {
        [self showSomeoneAsHuman:someone];
        [self showSomeoneAsAnimal:someone];
    }
    
    return YES;
}

- (void)showSomeoneAsHuman:(id)someone {
    if ([someone isKindOfClass:[Human class]]) {
        Human *hum = (Human *)someone;
        NSLog(@"\n");
        NSLog(@"I'm a human!");
        [self showHuman:hum];
    }
}

- (void)showSomeoneAsAnimal:(id)someone {
    if ([someone isKindOfClass:[Animal class]]) {
        Animal *anim = (Animal *)someone;
        NSLog(@"\n");
        NSLog(@"I'm an animal!");
        [self showAnimal:anim];
    }
}

- (void)showHuman:(Human *)hum {
    NSLog(@"Name: %@", hum.name);
    NSLog(@"Height: %.2f", hum.height);
    NSLog(@"Weight: %.2f", hum.weight);
    NSLog(@"Gender: %@", [hum getGender]);
    if ([hum isKindOfClass:[Developer class]]) {
        Developer *dev = (Developer *)hum;
        NSLog(@"Experience: %li year(s)", (long)dev.experience);
        NSLog(@"Language: %@", dev.language);
    }
    [hum move];
}

- (void)showAnimal:(Animal *)anim {
    NSLog(@"Type: %@", anim.type);
    NSLog(@"Color: %@", [anim getColor]);
    [anim move];
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
