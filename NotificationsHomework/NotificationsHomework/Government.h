//
//  Government.h
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSNotificationName const GovernmentTaxLevelDidChangeNotification;
extern NSNotificationName const GovernmentSalaryDidChangeNotification;
extern NSNotificationName const GovernmentPensionDidChangeNotification;
extern NSNotificationName const GovernmentAveragePriceDidChangeNotification;

extern NSString *const GovernmentTaxLevelUserInfoKey;
extern NSString *const GovernmentOldTaxLevelUserInfoKey;
extern NSString *const GovernmentSalaryUserInfoKey;
extern NSString *const GovernmentOldSalaryUserInfoKey;
extern NSString *const GovernmentPensionUserInfoKey;
extern NSString *const GovernmentOldPensionUserInfoKey;
extern NSString *const GovernmentAveragePriceUserInfoKey;
extern NSString *const GovernmentOldAveragePriceUserInfoKey;

@interface Government : NSObject

@property (assign, nonatomic) double taxLevel;
@property (assign, nonatomic) double salary;
@property (assign, nonatomic) double pension;
@property (assign, nonatomic) double averagePrice;

@end
