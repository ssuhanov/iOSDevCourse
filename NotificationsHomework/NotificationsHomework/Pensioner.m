//
//  Pensioner.m
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:GovernmentPensionDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name andPension:(double)pension {
    self = [self init];
    if (self) {
        self.name = name;
        self.pension = pension;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)pensionChangedNotification:(NSNotification *)notification {
    NSNumber *pensionValue = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    double pension = [pensionValue doubleValue];
    
    if (pension < self.pension) {
        NSLog(@"Pensioner %@ is not happy. His pension was %.2f, and now %.2f", self.name, self.pension, pension);
    } else if (pension > self.pension) {
        NSLog(@"Pensioner %@ is happy. His pension was %.2f, and now %.2f", self.name, self.pension, pension);
    }
    
    self.pension = pension;
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *priceValue = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    NSNumber *oldPriceValue = [notification.userInfo objectForKey:GovernmentOldAveragePriceUserInfoKey];
    
    double averagePrice = [priceValue doubleValue];
    double oldAveragePrice = [oldPriceValue doubleValue];
    
    if (averagePrice > oldAveragePrice) {
        NSLog(@"Pensioner %@ is not happy with new prices %.2f", self.name, averagePrice);
    } else {
        NSLog(@"Pensioner %@ is happy with new prices %.2f", self.name, averagePrice);
    }
}

@end
