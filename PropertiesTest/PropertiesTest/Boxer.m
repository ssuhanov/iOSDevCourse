//
//  Boxer.m
//  PropertiesTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Boxer.h"

@interface Boxer ()

@property (assign, nonatomic) NSInteger nameCount;

@end

@implementation Boxer
@synthesize name = _name;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.52f;
        self.weight = 5.1f;
    }
    return self;
}

- (void)setName:(NSString *)name {
    NSLog(@"setName setter is called");
    _name = name;
}

- (NSString *)name {
    NSLog(@"name getter is called %li times", ++self.nameCount);
    return _name;
}

- (NSInteger)age {
    NSLog(@"age getter is called");
    return _age;
}

- (NSInteger)howOldAreYou {
    return self.age;
}

@end
