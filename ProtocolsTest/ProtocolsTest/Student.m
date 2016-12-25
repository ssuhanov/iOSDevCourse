//
//  Student.m
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)study {
    
}

#pragma mark - Patient

- (BOOL)areYouOK {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"OK" : @"not OK" ;
    NSLog(@"Student %@ is %@", self.name, strResult);
    return result;
}

- (void)takePill {
    NSLog(@"Student %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Student %@ makes a shot", self.name);
}

- (NSString *)howIsYourFamily {
    return @"Well, thank you";
}

@end
