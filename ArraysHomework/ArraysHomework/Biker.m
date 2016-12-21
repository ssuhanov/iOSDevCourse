//
//  Biker.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Biker.h"

@implementation Biker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Janine";
        self.height = 1.75f;
        self.weight = 70.f;
        self.gender = GenderFemale;
    }
    return self;
}

- (void)move {
    NSLog(@"I am riding the bike.");
}

@end
