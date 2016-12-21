//
//  Runner.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Runner.h"

@implementation Runner

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Gregory";
        self.height = 1.85f;
        self.weight = 75.f;
        self.gender = GenderMale;
    }
    return self;
}

- (void)move {
    NSLog(@"I am running as fast as I can!");
}

@end
