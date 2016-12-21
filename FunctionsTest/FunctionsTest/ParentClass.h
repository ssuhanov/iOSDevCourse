//
//  ParentClass.h
//  FunctionsTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParentClass : NSObject

+ (void)whoAreYou;

- (void)sayHello;
- (void)say:(NSString *)string;
- (void)say:(NSString *)string and:(NSString *)string2;
- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3;
- (NSString *)saySomething;
- (NSString *)saySomeNumberString;

@end
