//
//  Developer.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Human.h"
#import "Swimmer.h"
#import "Runner.h"

@interface Developer : Human <Swimmer, Runner>

@property (assign, nonatomic) NSInteger experience;
@property (strong, nonatomic) NSString *language;

#pragma mark - Swimmer

@property (assign, nonatomic) double speed;
@property (strong, nonatomic) NSString *favoriteTrack;

#pragma mark - Runner

@property (assign, nonatomic) double distance;
@property (assign, nonatomic) RunType runType;

@end
