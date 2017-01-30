//
//  Student.h
//  BitsTest
//
//  Created by Serge Sukhanov on 1/30/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    StudentSubjectTypeBiology       = 1 << 0,
    StudentSubjectTypeMath          = 1 << 1,
    StudentSubjectTypeDevelopment   = 1 << 2,
    StudentSubjectTypeEngineering   = 1 << 3,
    StudentSubjectTypeArt           = 1 << 4,
    StudentSubjectTypePsychology    = 1 << 5,
    StudentSubjectTypeAnathomy      = 1 << 6
} StudentSubjectType;

@interface Student : NSObject

@property (assign, nonatomic) StudentSubjectType subjectType;

- (void)addSubjectType:(StudentSubjectType)subjectType;
- (void)removeSubjectType:(StudentSubjectType)subjectType;

//@property (assign, nonatomic) BOOL studiesBiology;
//@property (assign, nonatomic) BOOL studiesMath;
//@property (assign, nonatomic) BOOL studiesDevelopment;
//@property (assign, nonatomic) BOOL studiesEngineering;
//@property (assign, nonatomic) BOOL studiesArt;
//@property (assign, nonatomic) BOOL studiesPsychology;
//@property (assign, nonatomic) BOOL studiesAnathomy;

@end
