//
//  Dancer.m
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Dancer.h"

@implementation Dancer

- (void)dance {
    
}

#pragma mark - Patient

- (BOOL)areYouOK {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"OK" : @"not OK" ;
    NSLog(@"Dancer %@ is %@", self.name, strResult);
    return result;
}

- (void)takePill {
    NSLog(@"Dancer %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Dancer %@ makes a shot", self.name);
}

@end
