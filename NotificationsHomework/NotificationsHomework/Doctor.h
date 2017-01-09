//
//  Doctor.h
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double salary;

- (instancetype)initWithName:(NSString *)name andSalary:(double)salary;

@end
