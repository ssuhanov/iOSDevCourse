//
//  Object.m
//  ParametersTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Object.h"

@implementation Object

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"object is initialized");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"object is deallocated");
}

- (id)copyWithZone:(NSZone *)zone {
    Object *newObject = [[Object alloc] init];
    newObject.name = self.name;
    return newObject;
}

@end
