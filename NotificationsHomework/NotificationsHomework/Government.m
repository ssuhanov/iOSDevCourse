//
//  Government.m
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Government.h"

NSNotificationName const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSNotificationName const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSNotificationName const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSNotificationName const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString *const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString *const GovernmentOldTaxLevelUserInfoKey = @"GovernmentOldTaxLevelUserInfoKey";
NSString *const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString *const GovernmentOldSalaryUserInfoKey = @"GovernmentOldSalaryUserInfoKey";
NSString *const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString *const GovernmentOldPensionUserInfoKey = @"GovernmentOldPensionUserInfoKey";
NSString *const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";
NSString *const GovernmentOldAveragePriceUserInfoKey = @"GovernmentOldAveragePriceUserInfoKey";

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
    NSLog(@"\n");
    NSDictionary *userInfo = @{GovernmentTaxLevelUserInfoKey : @(taxLevel),
                               GovernmentOldTaxLevelUserInfoKey : @(_taxLevel)};
    _taxLevel = taxLevel;
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setSalary:(double)salary {
    NSLog(@"\n");
    NSDictionary *userInfo = @{GovernmentSalaryUserInfoKey : @(salary),
                               GovernmentOldSalaryUserInfoKey : @(_salary)};
    _salary = salary;
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setPension:(double)pension {
    NSLog(@"\n");
    NSDictionary *userInfo = @{GovernmentPensionUserInfoKey : @(pension),
                               GovernmentOldPensionUserInfoKey : @(_pension)};
    _pension = pension;
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

- (void)setAveragePrice:(double)averagePrice {
    NSLog(@"\n");
    NSDictionary *userInfo = @{GovernmentAveragePriceUserInfoKey : @(averagePrice),
                               GovernmentOldAveragePriceUserInfoKey : @(_averagePrice)};
    _averagePrice = averagePrice;
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:userInfo];
}

@end
