//
//  Cat.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = @"Russian blue";
        self.color = ColorGrey;
    }
    return self;
}

- (void)move {
    NSLog(@"Meeeoooow, I am going!");
}

@end
