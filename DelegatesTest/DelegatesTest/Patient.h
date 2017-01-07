//
//  Patient.h
//  DelegatesTest
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;

@protocol PatientDelegate <NSObject>

- (void)patientFeelsBad:(Patient *)patient;
- (void)patient:(Patient *)patient hasQuestion:(NSString *)question;

@end

@interface Patient : NSObject

@property (weak, nonatomic) id <PatientDelegate> delegate;

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double temperature;

- (BOOL)howAreYou;
- (void)takePill;
- (void)makeShot;

@end
