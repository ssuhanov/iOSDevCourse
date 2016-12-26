//
//  Jumper.h
//  ProtocolsHomework
//
//  Created by Serge Sukhanov on 12/26/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    ColorBlue,
    ColorGreen,
    ColorRed
} WearColor;

@protocol Jumper <NSObject>

@property (assign, nonatomic) double maxHeight;

- (BOOL)areYouReady;
- (void)jump;

@optional

@property (assign, nonatomic) WearColor wearColor;
- (BOOL)areYouReadyForInterview;

@end
