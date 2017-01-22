//
//  Student.h
//  BlocksHomework
//
//  Created by Serge Sukhanov on 1/18/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

@end
