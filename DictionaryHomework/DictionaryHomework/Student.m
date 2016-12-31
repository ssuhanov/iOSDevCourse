//
//  Student.m
//  DictionaryHomework
//
//  Created by Serge Sukhanov on 12/28/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.greeting = @"I am a student";
    }
    return self;
}

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    self = [self init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.lastName, self.firstName];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Hello, %@. My name is %@ %@", self.greeting, self.firstName, self.lastName];
}

@end
