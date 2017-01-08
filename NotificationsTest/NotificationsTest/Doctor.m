//
//  Doctor.m
//  NotificationsTest
//
//  Created by Serge Sukhanov on 1/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:GovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
        
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name andSalary:(double)salary {
    self = [self init];
    if (self) {
        self.name = name;
        self.salary = salary;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)salaryChangedNotification:(NSNotification *)notification {
    NSNumber *salaryValue = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    double salary = [salaryValue doubleValue];
    
    if (salary < self.salary) {
        NSLog(@"Doctor %@ is not happy", self.name);
    } else if (salary > self.salary) {
        NSLog(@"Doctor %@ is happy", self.name);
    }
    
    self.salary = salary;
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *priceValue = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    double averagePrice = [priceValue doubleValue];
    
    NSLog(@"Doctor %@ is not happy with new prices %.2f", self.name, averagePrice);
}

@end
