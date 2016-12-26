//
//  Runner.h
//  ProtocolsHomework
//
//  Created by Serge Sukhanov on 12/26/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Sprint = 5,
    Marathon = 11
} RunType;

@protocol Runner <NSObject>

@property (assign, nonatomic) double distance;

- (BOOL)areYouTired;
- (void)run;

@optional

@property (assign, nonatomic) RunType runType;
- (NSString *)saySomething;

@end
