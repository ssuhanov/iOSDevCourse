//
//  Businessman.h
//  NotificationsHomework
//
//  Created by Serge Sukhanov on 1/9/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Businessman : NSObject

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
