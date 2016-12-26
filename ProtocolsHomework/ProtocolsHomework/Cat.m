//
//  Cat.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = @"Russian blue";
        self.color = ColorGrey;
    }
    return self;
}

- (void)move {
    NSLog(@"Meeeoooow, I am going!");
}

#pragma mark - Runner

- (BOOL)areYouTired {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"tired" : @"not tired" ;
    NSLog(@"Cat %@ is %@", self.type, strResult);
    return result;
}

- (void)run {
    NSLog(@"Cat %@ is running", self.type);
}

#pragma mark - Jumper

- (BOOL)areYouReady {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"ready" : @"not ready" ;
    NSLog(@"Cat %@ is %@ for the jumping", self.type, strResult);
    return result;
}

- (void)jump {
    NSLog(@"Cat %@ is jumping", self.type);
}
@end
