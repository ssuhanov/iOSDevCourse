//
//  SomeObject.m
//  BlocksTest
//
//  Created by Serge Sukhanov on 1/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "SomeObject.h"

@interface SomeObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation SomeObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"No name";
        __weak SomeObject *weakSelf = self;
        self.objectBlock = ^{
            NSLog(@"self.name = %@", weakSelf.name);
        };
        NSLog(@"\n");
        NSLog(@"SomeObject is initialized");
        NSLog(@"===============\n");
    }
    return self;
}

- (void)testMethod:(ObjectBlock)block {
    block();
}

- (void)dealloc
{
    NSLog(@"\n");
    NSLog(@"SomeObject %@ is deallocated", self.name);
    NSLog(@"===============\n");
}

@end
