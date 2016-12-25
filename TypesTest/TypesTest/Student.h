//
//  Student.h
//  TypesTest
//
//  Created by Serge Sukhanov on 12/24/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenderMale = 5,
    GenderFemale // == 6
} Gender;

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) Gender gender;

@end
