//
//  Animal.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/23/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ColorGrey = 3,
    ColorBlack, // == 4
    ColorWhite // == 5
} Color;

@interface Animal : NSObject

@property (strong, nonatomic) NSString *type;
@property (assign, nonatomic) Color color;

- (void)move;
- (NSString *)getColor;

@end
