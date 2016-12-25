//
//  Dancer.h
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Dancer : NSObject <Patient>

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *favoriteDance;

- (void)dance;

@end
