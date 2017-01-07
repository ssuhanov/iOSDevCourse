//
//  Doctor.m
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Doctor.h"

@interface Doctor ()

@property (strong, nonatomic) NSMutableDictionary *patients;

@end

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.patients = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)raport {
    [self raportByBodyPart:Head];
    [self raportByBodyPart:Neck];
    [self raportByBodyPart:Chest];
    [self raportByBodyPart:Stomach];
    [self raportByBodyPart:Arm];
    [self raportByBodyPart:Leg];
}

- (void)raportByBodyPart:(BodyPart)bodyPart {
    for (Patient *patient in self.patients) {
        NSString *descriptionBodyPart = [self.patients objectForKey:patient];
        if ([patient descriptionOfBodyPart:bodyPart] != descriptionBodyPart) {
            continue;
        }
        
        NSLog(@"Patient: %@, body part: %@", patient.name, [patient descriptionOfBodyPart:bodyPart]);
    }
}

#pragma mark - PatientDelegate

- (void)patientFeelsBad:(Patient *)patient {
    if (patient.temperature >= 37.7 && patient.temperature < 40.0) {
        NSLog(@"Patient %@ should take a pill", patient.name);
        [patient takePill];
    } else if (patient.temperature >= 40.0) {
        NSLog(@"Patient %@ should make a shot", patient.name);
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should have a rest", patient.name);
    }
    
    if (patient.isBrokenLeg) {
        NSLog(@"Patient %@ should repair own leg", patient.name);
        [patient repairLeg];
    }
    
    patient.doctorsRating = arc4random() % 5 + 1;
}

- (void)patient:(Patient *)patient hasPainInBodyPart:(BodyPart)bodyPart {
    [self.patients setObject:[patient descriptionOfBodyPart:bodyPart] forKey:patient];
    NSLog(@"Patient %@ should be care about own %@", patient.name, [patient descriptionOfBodyPart:bodyPart]);
}

@end
