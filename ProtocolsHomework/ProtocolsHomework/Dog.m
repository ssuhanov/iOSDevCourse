//
//  Dog.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = @"Pincher";
        self.color = ColorBlack;
    }
    return self;
}

- (void)move {
    NSLog(@"Woof-woof! I am walking here!");
}

#pragma mark - Swimmer

- (void)swim {
    NSLog(@"Dog %@ is swimming", self.type);
}

- (double)dive {
    double result = (arc4random() % 100) / 10.0;
    NSLog(@"Dog %@ dive for %.2f meters", self.type, result);
    return result;
}

#pragma mark - Runner

- (BOOL)areYouTired {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"tired" : @"not tired" ;
    NSLog(@"Dog %@ is %@", self.type, strResult);
    return result;
}

- (void)run {
    NSLog(@"Dog %@ is running", self.type);
}

@end
