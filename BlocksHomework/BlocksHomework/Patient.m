//
//  Patient.m
//  BlocksHomework
//
//  Created by Serge Sukhanov on 1/18/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithBlock:(FeelBadBlock)block {
    self = [super init];
    if (self) {
        NSTimeInterval timeInterval = arc4random() % 15 + 1;
        NSLog(@"%f", timeInterval);
        [self performSelector:@selector(howAreYouWithBlock:) withObject:block afterDelay:timeInterval];
    }
    return self;
}

- (void)howAreYouWithBlock:(FeelBadBlock)block {
    BOOL iFeelGood = arc4random() % 2;
    NSLog(@"%@ feels %@", self.name, (iFeelGood ? @"good" : @"bad"));
    if (!iFeelGood) {
        block(self, self.temperature);
    }
}

- (void)takePill {
    NSLog(@"%@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"%@ makes a shot", self.name);
}

@end
