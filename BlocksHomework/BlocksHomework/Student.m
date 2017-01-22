//
//  Student.m
//  BlocksHomework
//
//  Created by Serge Sukhanov on 1/18/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", self.lastName, self.firstName];
}

@end
