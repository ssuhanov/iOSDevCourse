//
//  Human.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Human.h"

@implementation Human

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Michael";
        self.height = 1.8f;
        self.weight = 85.f;
        self.gender = GenderMale;
    }
    return self;
}

- (void)move {
    NSLog(@"I am just walking.");
}

- (NSString *)getGender {
    switch (self.gender) {
        case GenderMale:
            return @"male";
            break;
            
        case GenderFemale:
            return @"female";
            break;
            
        default:
            return @"unknown gender";
            break;
    }
}

@end
