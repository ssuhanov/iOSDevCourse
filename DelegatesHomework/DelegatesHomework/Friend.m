//
//  Friend.m
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

#pragma mark - PatientDelegate

- (void)patientFeelsBad:(Patient *)patient {
    NSLog(@"\nDear %@, my name is %@.\nI have no idea what to do with your illnes.\nJust drink this tea and everything will be okay.", patient.name, self.name);
}

- (void)patient:(Patient *)patient hasPainInBodyPart:(BodyPart)bodyPart {
    NSLog(@"\nHi %@, my name is %@.\nI don't know what to do with your %@",
          patient.name,
          self.name,
          [patient descriptionOfBodyPart:bodyPart]);
}

@end
