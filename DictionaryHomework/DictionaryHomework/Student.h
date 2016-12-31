//
//  Student.h
//  DictionaryHomework
//
//  Created by Serge Sukhanov on 12/28/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *greeting;

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;
- (NSString *)fullName;

@end
