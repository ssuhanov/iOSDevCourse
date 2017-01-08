//
//  Government.m
//  NotificationsTest
//
//  Created by Serge Sukhanov on 1/8/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Government.h"

NSNotificationName const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSNotificationName const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSNotificationName const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSNotificationName const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString *const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString *const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString *const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString *const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.0;
        _salary = 1000.0;
        _pension = 500.0;
        _averagePrice = 10.0;
    }
    return self;
}

- (void)setTaxLevel:(double)taxLevel {
    _taxLevel = taxLevel;
    NSDictionary *userInfo = @{GovernmentTaxLevelUserInfoKey : @(taxLevel)};
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setSalary:(double)salary {
    _salary = salary;
    NSDictionary *userInfo = @{GovernmentSalaryUserInfoKey : @(salary)};
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setPension:(double)pension {
    _pension = pension;
    NSDictionary *userInfo = @{GovernmentPensionUserInfoKey : @(pension)};
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setAveragePrice:(double)averagePrice {
    _averagePrice = averagePrice;
    NSDictionary *userInfo = @{GovernmentAveragePriceUserInfoKey : @(averagePrice)};
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

@end
