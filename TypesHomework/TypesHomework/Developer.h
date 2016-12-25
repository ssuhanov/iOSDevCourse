//
//  Developer.h
//  TypesHomework
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ObjectiveC,
    Swift,
    Java,
    Python
} ProgrammingLanguage;

typedef enum {
    MacOS,
    Win10,
    Win7
} OperatingSystem;

@interface Developer : NSObject

@property (assign, nonatomic) ProgrammingLanguage programmingLanguage;
@property (assign, nonatomic) OperatingSystem operatingSystem;

@end
