//
//  Developer.m
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Serge";
        self.height = 1.75f;
        self.weight = 65.f;
        self.gender = GenderMale;
        self.experience = 2;
        self.language = @"Objective-C";
    }
    return self;
}

- (void)move {
    [super move];
    NSLog(@"And I am developing the best apps in the World!");
}

#pragma mark - Swimmer

- (void)swim {
    NSLog(@"Developer %@ is swimming", self.name);
}

- (double)dive {
    double result = (arc4random() % 100) / 10.0;
    NSLog(@"Developer %@ dive for %.2f meters", self.name, result);
    return result;
}

- (NSString *)interview {
    NSString *result = [NSString stringWithFormat:@"Developer %@ on the interview now", self.name];
    return result;
}

#pragma mark - Runner

- (BOOL)areYouTired {
    BOOL result = (arc4random()%2 == 0) ? YES : NO;
    NSString *strResult = result ? @"tired" : @"not tired" ;
    NSLog(@"Developer %@ is %@", self.name, strResult);
    return result;
}

- (void)run {
    NSLog(@"Developer %@ is running", self.name);
}

- (NSString *)saySomething {
    NSString *result = [NSString stringWithFormat:@"I'm a developer and my name is %@", self.name];
    return result;
}

@end
