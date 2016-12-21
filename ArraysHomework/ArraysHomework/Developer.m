//
//  Developer.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Serge";
        self.height = 1.75f;
        self.weight = 65.f;
        self.gender = GenderMale;
        self.experience = 2;
        self.language = @"Objective-C";
    }
    return self;
}

- (void)move {
    [super move];
    NSLog(@"And I am developing the best apps in the World!");
}

@end
