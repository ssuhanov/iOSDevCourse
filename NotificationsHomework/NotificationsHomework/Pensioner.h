//
//  Pensioner.h
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pensioner : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double pension;

- (instancetype)initWithName:(NSString *)name andPension:(double)pension;

@end
