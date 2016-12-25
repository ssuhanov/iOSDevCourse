//
//  Patient.h
//  ProtocolsTest
//
//  Created by Serge Sukhanov on 12/25/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Patient <NSObject>

@required

@property (strong, nonatomic) NSString *name;

- (BOOL)areYouOK;
- (void)takePill;
- (void)makeShot;

@optional

- (NSString *)howIsYourFamily;
- (NSString *)howIsYourJob;

@end
