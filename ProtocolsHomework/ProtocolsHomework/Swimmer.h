//
//  Swimmer.h
//  ProtocolsHomework
//
//  Created by Serge Sukhanov on 12/26/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Swimmer <NSObject>

@property (assign, nonatomic) double speed;

- (void)swim;
- (double)dive;

@optional

@property (strong, nonatomic) NSString *favoriteTrack;
- (NSString *)interview;

@end
