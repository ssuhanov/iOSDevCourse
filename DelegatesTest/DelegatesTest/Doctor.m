//
//  Doctor.m
//  DelegatesTest
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

#pragma mark - PatientDelegate

- (void)patientFeelsBad:(Patient *)patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    
    if (patient.temperature >= 37.0 && patient.temperature <= 39.0) {
        [patient takePill];
    } else if (patient.temperature > 39.0) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should have a rest", patient.name);
    }
}

- (void)patient:(Patient *)patient hasQuestion:(NSString *)question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
