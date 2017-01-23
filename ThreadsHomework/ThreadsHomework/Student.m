//
//  Student.m
//  ThreadsHomework
//
//  Created by Serge Sukhanov on 1/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>

@implementation Student

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t sharedQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedQueue = dispatch_queue_create("com.ssuhanov.ThreadsHomework.Student.sharedQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    return sharedQueue;
}

- (void)guessTheAnswer:(NSInteger)answer
      withIntervalFrom:(NSInteger)intervalFrom
                    to:(NSInteger)intervalTo
               inQueue:(NSString *)queueName
   withCompletionBlock:(StudentCompletionBlock)block {

    __weak Student *weakSelf = self;
//    dispatch_queue_t queue = dispatch_queue_create([queueName UTF8String], DISPATCH_QUEUE_SERIAL);
    dispatch_async([Student sharedQueue], ^{
        NSInteger studentAnswer = [weakSelf randomWithIntervalFrom:intervalFrom to:intervalTo];
        double startTime = CACurrentMediaTime();
        while (studentAnswer != answer) {
            studentAnswer = [weakSelf randomWithIntervalFrom:intervalFrom to:intervalTo];
        }
        
        NSString *studentName = weakSelf.name;
        if (studentAnswer == answer) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(studentName, CACurrentMediaTime() - startTime);
            });
        }
    });
}

- (NSInteger)randomWithIntervalFrom:(NSInteger)intervalFrom to:(NSInteger)intervalTo {
    return (arc4random() % (intervalTo-intervalFrom+1)) + intervalFrom;;
}

@end
