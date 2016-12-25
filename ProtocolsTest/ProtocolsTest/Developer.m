//
//  Developer.m
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (void)work {
    
}

#pragma mark - Patient

- (BOOL)areYouOK {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"OK" : @"not OK" ;
    NSLog(@"Developer %@ is %@", self.name, strResult);
    return result;
}

- (void)takePill {
    NSLog(@"Developer %@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"Developer %@ makes a shot", self.name);
}

- (NSString *)howIsYourJob {
    return @"Awesome, thanks";
}

@end
