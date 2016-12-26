//
//  Cat.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Animal.h"
#import "Runner.h"
#import "Jumper.h"

@interface Cat : Animal <Runner, Jumper>

#pragma mark - Runner

@property (assign, nonatomic) double distance;

#pragma mark - Jumper

@property (assign, nonatomic) double maxHeight;

@end
