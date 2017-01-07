//
//  Patient.m
//  DelegatesTest
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (BOOL)howAreYou {
    BOOL iFeelGood = arc4random() % 2;
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
    }
    
    return iFeelGood;
}

- (void)takePill {
    NSLog(@"%@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"%@ makes a shot", self.name);
}

@end
