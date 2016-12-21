//
//  ChildClass.m
//  FunctionsTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "ChildClass.h"

@implementation ChildClass

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"Instance of ChildClass is initialized");
    }
    return self;
}

- (NSString *)saySomeNumberString {
    return @"Something!";
}

- (NSString *)saySomething {
    return [self saySomeNumberString];
}

@end
