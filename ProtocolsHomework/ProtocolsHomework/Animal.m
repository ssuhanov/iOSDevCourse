//
//  Animal.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)move {
    NSLog(@"I am an animal and I am just walking.");
}

- (NSString *)getColor {
    switch (self.color) {
        case ColorGrey:
            return @"grey";
            break;
            
        case ColorBlack:
            return @"black";
            break;
            
        case ColorWhite:
            return @"white";
            break;
            
        default:
            return @"unknown color";
            break;
    }
}

@end
