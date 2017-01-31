//
//  Student.h
//  BitsHomework
//
//  Created by Serge Sukhanov on 1/31/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    StudentSubjectTypeBiology       = 1 << 0,
    StudentSubjectTypeMath          = 1 << 1,
    StudentSubjectTypeProgramming   = 1 << 2,
    StudentSubjectTypeEngineering   = 1 << 3,
    StudentSubjectTypeArt           = 1 << 4,
    StudentSubjectTypePsychology    = 1 << 5,
    StudentSubjectTypeAnathomy      = 1 << 6
} StudentSubjectType;

@interface Student : NSObject

@property (assign, nonatomic) StudentSubjectType subjectType;

- (BOOL)isType:(StudentSubjectType)subjectType;
- (void)addSubjectType:(StudentSubjectType)subjectType;
- (void)removeSubjectType:(StudentSubjectType)subjectType;
- (BOOL)isTechSpecialist;

@end
