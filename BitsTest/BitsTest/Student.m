//
//  Student.m
//  BitsTest
//
//  Created by Serge Sukhanov on 1/30/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Student.h"

@implementation Student

//- (NSString *)description {
//    return [NSString stringWithFormat:@"Student studies:\n"
//            "biology = %@\n"
//            "math = %@\n"
//            "development = %@\n"
//            "engineering = %@\n"
//            "art = %@\n"
//            "psychology = %@\n"
//            "anathomy = %@\n",
//            self.studiesBiology ? @"yes" : @"no",
//            self.studiesMath ? @"yes" : @"no",
//            self.studiesDevelopment ? @"yes" : @"no",
//            self.studiesEngineering ? @"yes" : @"no",
//            self.studiesArt ? @"yes" : @"no",
//            self.studiesPsychology ? @"yes" : @"no",
//            self.studiesAnathomy ? @"yes" : @"no"];
//}

- (NSString *)description {
    return [NSString stringWithFormat:@"Student studies:\n"
            "biology = %@\n"
            "math = %@\n"
            "development = %@\n"
            "engineering = %@\n"
            "art = %@\n"
            "psychology = %@\n"
            "anathomy = %@\n",
            [self answerByType:StudentSubjectTypeBiology],
            [self answerByType:StudentSubjectTypeMath],
            [self answerByType:StudentSubjectTypeDevelopment],
            [self answerByType:StudentSubjectTypeEngineering],
            [self answerByType:StudentSubjectTypeArt],
            [self answerByType:StudentSubjectTypePsychology],
            [self answerByType:StudentSubjectTypeAnathomy]];
}

- (NSString *)answerByType:(StudentSubjectType)subjectType {
    return self.subjectType & subjectType ? @"yes" : @"no";
}

- (void)addSubjectType:(StudentSubjectType)subjectType {
    self.subjectType = self.subjectType | subjectType;
}

- (void)removeSubjectType:(StudentSubjectType)subjectType {
    self.subjectType = self.subjectType & (~subjectType);
}

@end
