//
//  AppDelegate.m
//  StringsTest
//
//  Created by Serge Sukhanov on 1/24/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *string1 = @"String 1";
    NSString *string2 = @"String 2";
    
    NSArray *array = [NSArray arrayWithObjects:
                      string1,
                      string2,
                      nil];
    
    for (NSString *string in array) {
        if ([string isEqualToString:@"String 1"]) {
            NSLog(@"String 1 is here");
            NSLog(@"index of %@ is %li", string, [array indexOfObject:string]);
        }
        NSLog(@"%@", string);
    }
    
    NSString *helloString = @"Hello world world!";
    NSLog(@"%@", helloString);
    
    NSRange range = [helloString rangeOfString:@"World" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
    NSLog(@"range = %@", NSStringFromRange(range));
    if (range.location == NSNotFound) {
        NSLog(@"Not found");
    } else {
        NSLog(@"range = %@", NSStringFromRange(range));
    }
    range = [helloString rangeOfString:@"World" options:NSCaseInsensitiveSearch];
    NSLog(@"range = %@", NSStringFromRange(range));
    if (range.location == NSNotFound) {
        NSLog(@"Not found");
    } else {
        NSLog(@"range = %@", NSStringFromRange(range));
    }
    
    NSString *text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    text = [text substringToIndex:10];
    NSLog(@"%@", text);
    NSLog(@"%li", [text length]);
    
    text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    text = [text substringFromIndex:10];
    NSLog(@"%@", text);
    NSLog(@"%li", [text length]);
    
    text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    text = [text substringWithRange:NSMakeRange(10, 10)];
    NSLog(@"%@", text);
    NSLog(@"%li", [text length]);
    
    text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    NSRange textRange = [text rangeOfString:@"an old man"];
    if (textRange.location != NSNotFound) {
        text = [text substringToIndex:textRange.location];
    }
    NSLog(@"%@", text);
    NSLog(@"%li", [text length]);
    
    text = @"This is some NSString, which is very-very long. It is as long as a distance from Earth to Moon. While you're reading this NSString you can become an old man (or woman) and maybe, I don't know, you can die before this NSString will end.";
    
    NSInteger count = 0;
    NSRange searchRange = NSMakeRange(0, [text length]);
    NSLog(@"%@", NSStringFromRange(searchRange));
    while ([text rangeOfString:@"NSString" options:0 range:searchRange].location != NSNotFound) {
        NSRange textRange = [text rangeOfString:@"NSString" options:0 range:searchRange];
        NSInteger index = textRange.location + textRange.length;
        searchRange.location = index;
        searchRange.length = [text length] - index;
        NSLog(@"%@", NSStringFromRange(searchRange));
        ++count;
    }
    NSLog(@"Count of NSString is %li", count);
    
    text = [text stringByReplacingOccurrencesOfString:@"NSString" withString:@"tralala"];
    NSLog(@"%@", [text uppercaseString]);
    NSLog(@"%@", [text lowercaseString]);
    NSLog(@"%@", [text capitalizedString]);
    
    text = [text stringByReplacingOccurrencesOfString:@", " withString:@" "];
    text = [text stringByReplacingOccurrencesOfString:@". " withString:@" "];
    text = [text stringByReplacingOccurrencesOfString:@"," withString:@" "];
    text = [text stringByReplacingOccurrencesOfString:@"." withString:@" "];
    text = [text stringByReplacingOccurrencesOfString:@" (" withString:@" "];
    text = [text stringByReplacingOccurrencesOfString:@") " withString:@" "];
    NSArray *wordsArray = [text componentsSeparatedByString:@" "];
    NSLog(@"%@", wordsArray);
    
    NSString *newString = [wordsArray componentsJoinedByString:@"_"];
    NSLog(@"%@", newString);
    
    NSString *s1 = @"Hello";
    NSString *s2 = @"World";
    
    NSString *s3 = [NSString stringWithFormat:@"%@, %@!", s1, s2];
    s3 = [s1 stringByAppendingFormat:@", %@!", s2];
    NSLog(@"%@", s3);
    
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
