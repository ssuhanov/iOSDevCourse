//
//  Doctor.m
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import "Government.h"

@interface Doctor ()

@property (assign, nonatomic) double salaryIncLevel;

@end

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
        
        [nc addObserver:self
               selector:@selector(applicationDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(applicationWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(applicationDidBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(applicationWillResignActiveNotification:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        NSLog(@"Observers added");
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name andSalary:(double)salary {
    self = [self init];
    if (self) {
        self.name = name;
        self.salary = salary;
        self.salaryIncLevel = 0.0;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"Observers removed");
}

#pragma mark - Notifications

- (void)salaryChangedNotification:(NSNotification *)notification {
    NSNumber *salaryValue = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    double salary = [salaryValue doubleValue];
    
    self.salaryIncLevel = [self increaseLevelFromValue:self.salary toValue:salary];
    
    if (salary < self.salary) {
        NSLog(@"Doctor %@ is not happy. His salary was %.2f, and now %.2f. Salary increase level is %.2f", self.name, self.salary, salary, self.salaryIncLevel);
    } else if (salary > self.salary) {
        NSLog(@"Doctor %@ is happy. His salary was %.2f, and now %.2f. Salary increase level is %.2f", self.name, self.salary, salary, self.salaryIncLevel);
    }
    
    self.salary = salary;
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *priceValue = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    NSNumber *oldPriceValue = [notification.userInfo objectForKey:GovernmentOldAveragePriceUserInfoKey];
    
    double averagePrice = [priceValue doubleValue];
    double oldAveragePrice = [oldPriceValue doubleValue];
    double priceIncLevel = [self increaseLevelFromValue:oldAveragePrice toValue:averagePrice];
    
    if (priceIncLevel > self.salaryIncLevel) {
        NSLog(@"Doctor %@ is not happy. Price increase level is %.2f", self.name, (priceIncLevel));
    } else {
        NSLog(@"Doctor %@ is happy. Price increase level is %.2f", self.name, (priceIncLevel));
    }
}

- (double)increaseLevelFromValue:(double)oldValue toValue:(double)newValue {
    return 100.0 * (oldValue == 0 ? 1 : (newValue-oldValue) / oldValue);
}

- (void)applicationDidEnterBackgroundNotification:(NSNotification *)notification {
    NSLog(@"applicationDidEnterBackgroundNotification");
    NSLog(@"Notification: %@", notification);
    NSLog(@"user info: %@", notification.userInfo);
}

- (void)applicationWillEnterForegroundNotification:(NSNotification *)notification {
    NSLog(@"applicationWillEnterForegroundNotification");
    NSLog(@"Notification: %@", notification);
    NSLog(@"user info: %@", notification.userInfo);
}

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification {
    NSLog(@"applicationDidBecomeActiveNotification");
    NSLog(@"Notification: %@", notification);
    NSLog(@"user info: %@", notification.userInfo);
}

- (void)applicationWillResignActiveNotification:(NSNotification *)notification {
    NSLog(@"applicationWillResignActiveNotification");
    NSLog(@"Notification: %@", notification);
    NSLog(@"user info: %@", notification.userInfo);
}

@end
