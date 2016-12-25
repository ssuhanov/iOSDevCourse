//
//  Student.h
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"

@interface Student : NSObject <Patient>

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *university;

- (void)study;

@end
