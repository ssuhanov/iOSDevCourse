//
//  AppDelegate.m
//  ProtocolsHomework
//
//  Created by Serge Sukhanov on 12/26/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"
#import "Biker.h"
#import "Developer.h"
#import "Cat.h"
#import "Dog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Human *human = [[Human alloc] init];
    Biker *biker = [[Biker alloc] init];
    biker.wearColor = ColorRed;
    Developer *developer = [[Developer alloc] init];
    developer.runType = Sprint;
    developer.favoriteTrack = @"First, only first";
    Cat *cat = [[Cat alloc] init];
    Dog *dog = [[Dog alloc] init];

    NSArray *array = @[human, cat, biker, developer, dog];

    for (id obj in array) {
        BOOL doSomething = NO;
        if ([obj conformsToProtocol:@protocol(Jumper)]) {
            NSLog(@"==========");
            id <Jumper> jumper = obj;
            if ([jumper areYouReady]) {
                if ([jumper isKindOfClass:[Human class]]) {
                    Human *hum = (Human *) jumper;
                    NSLog(@"Jumper %@ is ready for the jumping", hum.name);
                } else if ([jumper isKindOfClass:[Animal class]]) {
                    Animal *anim = (Animal *) jumper;
                    NSLog(@"Jumper %@ is an animal. It always ready for the jumping", anim.type);
                } else {
                    NSLog(@"Jumper is ready for the jumping");
                }
                [jumper jump];
                doSomething = YES;
            }

            if ([jumper respondsToSelector:@selector(wearColor)]) {
                NSLog(@"Wear color: %i", jumper.wearColor);
            }

            if ([jumper respondsToSelector:@selector(areYouReadyForInterview)]) {
                if ([jumper areYouReadyForInterview]) {
                    if ([jumper isKindOfClass:[Human class]]) {
                        Human *hum = (Human *)jumper;
                        NSLog(@"Jumper %@ is ready for the interview", hum.name);
                    } else if ([jumper isKindOfClass:[Animal class]]) {
                        Animal *anim = (Animal *)jumper;
                        NSLog(@"Jumper %@ is an animal. It cannot be ready for the interview", anim.type);
                    } else {
                        NSLog(@"Jumper is ready for the interview");
                    }
                }
            }
        }

        if ([obj conformsToProtocol:@protocol(Runner)]) {
            NSLog(@"==========");
            id <Runner> runner = obj;
            if (![runner areYouTired]) {
                if ([runner isKindOfClass:[Human class]]) {
                    Human *hum = (Human *) runner;
                    NSLog(@"Runner %@ is ready for the running", hum.name);
                } else if ([runner isKindOfClass:[Animal class]]) {
                    Animal *anim = (Animal *) runner;
                    NSLog(@"Runner %@ is an animal. It always ready for the running", anim.type);
                } else {
                    NSLog(@"Runner is ready for the running");
                }
                [runner run];
                doSomething = YES;
            }

            if ([runner respondsToSelector:@selector(runType)]) {
                NSLog(@"Run type: %i", runner.runType);
            }

            if ([runner respondsToSelector:@selector(saySomething)]) {
                NSString *runnerSays = [runner saySomething];
                if ([runner isKindOfClass:[Human class]]) {
                    Human *hum = (Human *)runner;
                    NSLog(@"Runner %@ says %@", hum.name, runnerSays);
                } else if ([runner isKindOfClass:[Animal class]]) {
                    Animal *anim = (Animal *)runner;
                    NSLog(@"Runner %@ is animal. But it says %@", anim.type, runnerSays);
                } else {
                    NSLog(@"Runner says %@", runnerSays);
                }
            }
        }

        if ([obj conformsToProtocol:@protocol(Swimmer)]) {
            NSLog(@"==========");
            id <Swimmer> swimmer = obj;
            if ([swimmer isKindOfClass:[Human class]]) {
                Human *hum = (Human *) swimmer;
                NSLog(@"Swimmer %@ is ready for the swimming", hum.name);
            } else if ([swimmer isKindOfClass:[Animal class]]) {
                Animal *anim = (Animal *) swimmer;
                NSLog(@"Swimmer %@ is an animal. It always ready for the swimming", anim.type);
            } else {
                NSLog(@"Swimmer is ready for the swimming");
            }
            [swimmer swim];
            doSomething = YES;

            NSLog(@"Swimmer can dive to %.2f meters", [swimmer dive]);

            if ([swimmer respondsToSelector:@selector(favoriteTrack)]) {
                NSLog(@"Swimmer's favorite track is %@", swimmer.favoriteTrack);
            }

            if ([swimmer respondsToSelector:@selector(interview)]) {
                NSString *swimmerSays = [swimmer interview];
                if ([swimmer isKindOfClass:[Human class]]) {
                    Human *hum = (Human *)swimmer;
                    NSLog(@"Swimmer %@ says %@", hum.name, swimmerSays);
                } else if ([swimmer isKindOfClass:[Animal class]]) {
                    Animal *anim = (Animal *)swimmer;
                    NSLog(@"Swimmer %@ is animal. But it says %@", anim.type, swimmerSays);
                } else {
                    NSLog(@"Swimmer says %@", swimmerSays);
                }
            }
        }

        if (!doSomething) {
            NSLog(@"==========");
            NSLog(@"This person is LODYR!!!");
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
