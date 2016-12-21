//
//  Swimmer.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Swimmer.h"

@implementation Swimmer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Susan";
        self.height = 1.65f;
        self.weight = 65.f;
        self.gender = GenderFemale;
    }
    return self;
}

- (void)move {
    NSLog(@"I am swimming like a fish.");
}

@end
