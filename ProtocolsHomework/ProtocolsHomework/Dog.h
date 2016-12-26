//
//  Dog.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Animal.h"
#import "Runner.h"
#import "Swimmer.h"

@interface Dog : Animal <Swimmer, Runner>

#pragma mark - Swimmer

@property (assign, nonatomic) double speed;

#pragma mark - Runner

@property (assign, nonatomic) double distance;

@end
