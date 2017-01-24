//
//  AppDelegate.m
//  StringsHomework
//
//  Created by Serge Sukhanov on 1/24/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    
    NSUInteger halfIndex = text.length / 2;
    NSString *firstHalf = [text substringToIndex:halfIndex];
    NSString *secondHalf = [text substringFromIndex:halfIndex];
    NSLog(@"First part is \n %@", firstHalf);
    NSLog(@"Second part is \n %@", secondHalf);
    
    NSArray *sentences = [text componentsSeparatedByString:@". "];
    NSLog(@"Sentences: \n %@", sentences);
    
    NSMutableArray *nsstringSentences = [NSMutableArray array];
    for (NSString *sentence in sentences) {
        if ([sentence rangeOfString:@"NSString" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [nsstringSentences addObject:sentence];
        }
    }
    NSLog(@"Sentences with \"NSString\": \n %@", nsstringSentences);
    
    NSMutableArray *reverseSentences = [[NSMutableArray alloc] init];
    for (NSString *sentence in nsstringSentences) {
        [reverseSentences addObject:[self reverseSentence:sentence]];
    }
    NSLog(@"Reverse sentences with \"NSString\": \n %@", reverseSentences);
    
    NSLog(@"Capitalize last letters: \n %@", [self capitalizeLastLetterInString:text]);
    
    return YES;
}

- (NSString *)reverseSentence:(NSString *)sentence {
    NSArray *words = [sentence componentsSeparatedByString:@" "];
    NSMutableArray *reverseWords = [NSMutableArray array];
    
    for (int i = (int)words.count-1; i >= 0; --i) {
        NSString *word = [words objectAtIndex:i];
        [reverseWords addObject:word];
    }
    
    return [reverseWords componentsJoinedByString:@" "];
}

- (NSString *)capitalizeLastLetterInString:(NSString *)string {
    NSArray *words = [string componentsSeparatedByString:@" "];
    NSMutableArray *resultWords = [NSMutableArray array];
    
    for (NSString *word in words) {
        NSUInteger lastCharIndex = word.length - 1;
        NSString *firstPart = [[word substringToIndex:lastCharIndex] lowercaseString];
        NSString *lastPart = [[word substringFromIndex:lastCharIndex] uppercaseString];
        [resultWords addObject:[firstPart stringByAppendingString:lastPart]];
    }
    
    return [resultWords componentsJoinedByString:@" "];
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
