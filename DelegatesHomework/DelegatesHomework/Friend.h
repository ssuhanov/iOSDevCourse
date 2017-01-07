//
//  Friend.h
//  DelegatesHomework
//
//  Created by Serge Sukhanov on 1/7/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Friend : NSObject <PatientDelegate>

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
