//
//  Human.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenderMale,
    GenderFemale
} Gender;

@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double height;
@property (assign, nonatomic) double weight;
@property (assign, nonatomic) Gender gender;

- (void)move;
- (NSString *)getGender;

@end
