//
//  ParentClass.m
//  FunctionsTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"Instance of ParentClass is initialized");
    }
    return self;
}

+ (void)whoAreYou {
    NSLog(@"I am ParentClass %@", self);
}

- (void)sayHello {
    NSLog(@"Parent says hello! %@", self);
}

- (void)say:(NSString *)string {
    NSLog(@"%@", string);
}

- (void)say:(NSString *)string and:(NSString *)string2 {
    NSLog(@"%@, %@", string, string2);
}

- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3 {
    NSLog(@"%@ %@ %@", string, string2, string3);
}

- (NSString *)saySomething {
    NSString *string = [self saySomeNumberString];
    return string;
}

- (NSString *)saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

@end
