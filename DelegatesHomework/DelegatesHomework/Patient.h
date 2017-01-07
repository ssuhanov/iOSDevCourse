//
//  Patient.h
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;

@protocol PatientDelegate <NSObject>

typedef enum {
    Head,
    Neck,
    Chest,
    Stomach,
    Arm,
    Leg
} BodyPart;

- (void)patientFeelsBad:(Patient *)patient;
- (void)patient:(Patient *)patient hasPainInBodyPart:(BodyPart)bodyPart;

@end

@interface Patient : NSObject <NSCopying>

@property (weak, nonatomic) id <PatientDelegate> delegate;

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double temperature;
@property (assign, nonatomic) BOOL isBrokenLeg;
@property (assign, nonatomic) NSInteger doctorsRating;

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature andBrokenLeg:(BOOL)isBrokenLeg;
- (void)areYouOk;
- (void)takePill;
- (void)makeShot;
- (void)repairLeg;
- (BOOL)displeased;
- (NSString *)descriptionOfBodyPart:(BodyPart)bodyPart;

@end
