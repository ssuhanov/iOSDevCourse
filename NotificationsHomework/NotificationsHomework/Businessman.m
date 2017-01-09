//
//  Businessman.m
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

@interface Businessman ()

@property (assign, nonatomic) double profitIncLevel;

@end

@implementation Businessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:GovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [self init];
    if (self) {
        self.name = name;
        self.profitIncLevel = 0.0;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)taxLevelChangedNotification:(NSNotification *)notification {
    NSNumber *taxLevelValue = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    NSNumber *oldTaxLevelValue = [notification.userInfo objectForKey:GovernmentOldTaxLevelUserInfoKey];
    
    double taxLevel = [taxLevelValue doubleValue];
    double oldTaxLevel = [oldTaxLevelValue doubleValue];
    
    self.profitIncLevel = [self increaseLevelFromValue:(100.0-oldTaxLevel) toValue:(100.0-taxLevel)];
                                                                                    
    if (taxLevel > oldTaxLevel) {
        NSLog(@"Businessman %@ is not happy with new taxes %.2f. Profit increase level is %.2f", self.name, taxLevel, self.profitIncLevel);
    } else {
        NSLog(@"Businessman %@ is happy with new taxes %.2f. Profit increase level is %.2f", self.name, taxLevel, self.profitIncLevel);
    }
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    NSNumber *priceValue = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    NSNumber *oldPriceValue = [notification.userInfo objectForKey:GovernmentOldAveragePriceUserInfoKey];
    
    double averagePrice = [priceValue doubleValue];
    double oldAveragePrice = [oldPriceValue doubleValue];
    double priceIncLevel = [self increaseLevelFromValue:oldAveragePrice toValue:averagePrice];
    
    if (priceIncLevel > self.profitIncLevel) {
        NSLog(@"Businessman %@ is not happy. Price increase level is %.2f", self.name, (priceIncLevel));
    } else {
        NSLog(@"Businessman %@ is happy. Price increase level is %.2f", self.name, (priceIncLevel));
    }
}

- (double)increaseLevelFromValue:(double)oldValue toValue:(double)newValue {
    return 100.0 * (oldValue == 0 ? 1 : (newValue-oldValue) / oldValue);
}


@end
