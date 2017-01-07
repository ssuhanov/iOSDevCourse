//
//  Patient.m
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature andBrokenLeg:(BOOL)isBrokenLeg {
    self = [super init];
    if (self) {
        self.name = name;
        self.temperature = temperature;
        self.isBrokenLeg = isBrokenLeg;
        self.doctorsRating = 0;
    }
    return self;
}

- (void)areYouOk {
    BOOL patientIsOk = arc4random() % 2 && !self.isBrokenLeg;
    NSLog(@"%@ feels %@", self.name, patientIsOk ? @"good" : @"bad");
    if (!patientIsOk) {
        [self.delegate patientFeelsBad:self];
        BodyPart bodyPart = self.isBrokenLeg ? Leg : arc4random() % 6;
        [self.delegate patient:self hasPainInBodyPart:bodyPart];
    }
}

- (void)takePill {
    NSLog(@"%@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"%@ makes a shot", self.name);
}

- (void)repairLeg {
    NSLog(@"%@ repairs own leg", self.name);
}

- (BOOL)displeased {
    BOOL result = (self.doctorsRating > 0 && self.doctorsRating < 4);
    if (result) {
        NSLog(@"Patient %@ displeased", self.name);
    }
    return result;
}

- (NSString *)descriptionOfBodyPart:(BodyPart)bodyPart {
    switch (bodyPart) {
        case Head:
            return @"head";
        case Neck:
            return @"neck";
        case Chest:
            return @"chest";
        case Stomach:
            return @"stomach";
        case Arm:
            return @"arm";
        case Leg:
            return @"leg";
        default:
            return @"unknown body part";
    }
}

#pragma mark - NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
    Patient *copyPatient = [[Patient alloc] initWithName:self.name temperature:self.temperature andBrokenLeg:self.isBrokenLeg];
    return copyPatient;
}

@end
