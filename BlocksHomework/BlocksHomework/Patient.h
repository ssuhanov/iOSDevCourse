//
//  Patient.h
//  BlocksHomework
//
//  Created by Serge Sukhanov on 1/18/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Patient;
typedef void(^FeelBadBlock)(Patient *patient, double temperature);

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double temperature;

- (instancetype)initWithBlock:(FeelBadBlock)block;
- (void)howAreYouWithBlock:(FeelBadBlock)block;
- (void)takePill;
- (void)makeShot;

@end
