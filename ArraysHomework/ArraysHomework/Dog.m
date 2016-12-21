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

@end
