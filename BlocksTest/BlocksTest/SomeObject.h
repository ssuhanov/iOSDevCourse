//
//  SomeObject.h
//  BlocksTest
//
//  Created by Serge Sukhanov on 1/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ObjectBlock)(void);

@interface SomeObject : NSObject

@property (strong, nonatomic) NSString *name;

- (void)testMethod:(ObjectBlock)block;

@end
