//
//  Student.m
//  BitsHomework
//
//  Created by Serge Sukhanov on 1/31/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)description
{
    return [NSString stringWithFormat:@"==========\n"
            "Student studies:\n"
            "biology = %@\n"
            "math = %@\n"
            "programming = %@\n"
            "engineering = %@\n"
            "art = %@\n"
            "psychology = %@\n"
            "anathomy = %@\n",
            [self answerByType:StudentSubjectTypeBiology],
            [self answerByType:StudentSubjectTypeMath],
            [self answerByType:StudentSubjectTypeProgramming],
            [self answerByType:StudentSubjectTypeEngineering],
            [self answerByType:StudentSubjectTypeArt],
            [self answerByType:StudentSubjectTypePsychology],
            [self answerByType:StudentSubjectTypeAnathomy]];
}

- (BOOL)isType:(StudentSubjectType)subjectType {
    return self.subjectType & subjectType;
}

- (NSString *)answerByType:(StudentSubjectType)subjectType {
    return [self isType:subjectType] ? @"yes" : @"no";
}

- (void)addSubjectType:(StudentSubjectType)subjectType {
    self.subjectType = self.subjectType | subjectType;
}

- (void)removeSubjectType:(StudentSubjectType)subjectType {
    self.subjectType = self.subjectType & (~subjectType);
    NSLog(@"%@ removed", [self subjectTypeDescription:subjectType].capitalizedString);
}

- (NSString *)subjectTypeDescription:(StudentSubjectType)subjectType {
    switch (subjectType) {
        case StudentSubjectTypeBiology:
            return @"biology";
            break;
        case StudentSubjectTypeMath:
            return @"math";
            break;
        case StudentSubjectTypeProgramming:
            return @"programming";
            break;
        case StudentSubjectTypeEngineering:
            return @"engineering";
            break;
        case StudentSubjectTypeArt:
            return @"art";
            break;
        case StudentSubjectTypePsychology:
            return @"psychology";
            break;
        case StudentSubjectTypeAnathomy:
            return @"anathomy";
            break;
            
        default:
            return @"";
            break;
    }
}

- (BOOL)isTechSpecialist {
    return self.subjectType & (StudentSubjectTypeEngineering | StudentSubjectTypeProgramming | StudentSubjectTypeMath);
}

@end
