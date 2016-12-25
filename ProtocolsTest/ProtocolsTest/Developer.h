//
//  Developer.h
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Patient.h"

typedef enum {
    ObjectiveC,
    Swift,
    Java,
    Python
} ProgramminLanguage;

@interface Developer : NSObject <Patient>

@property (strong, nonatomic) NSString *name;

@property (assign, nonatomic) ProgramminLanguage language;
@property (assign, nonatomic) CGFloat experience;

- (void)work;

@end
