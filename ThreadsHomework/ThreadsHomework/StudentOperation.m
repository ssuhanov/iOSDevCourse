//
//  StudentOperation.m
//  ThreadsHomework
//
//  Created by Serge Sukhanov on 1/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "StudentOperation.h"
#import <UIKit/UIKit.h>

@implementation StudentOperation

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

+ (NSOperationQueue *)sharedQueue {
    static NSOperationQueue *sharedQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedQueue = [[NSOperationQueue alloc] init];
    });
    return sharedQueue;
}

- (void)guessTheAnswer:(NSInteger)answer
      withIntervalFrom:(NSInteger)intervalFrom
                    to:(NSInteger)intervalTo
               inQueue:(NSString *)queueName
   withCompletionBlock:(StudentCompletionBlock)block {
    
    __weak StudentOperation *weakSelf = self;
    [[StudentOperation sharedQueue] addOperationWithBlock:^{
        NSInteger studentAnswer = [weakSelf randomWithIntervalFrom:intervalFrom to:intervalTo];
        double startTime = CACurrentMediaTime();
        while (studentAnswer != answer) {
            studentAnswer = [weakSelf randomWithIntervalFrom:intervalFrom to:intervalTo];
        }
        
        NSString *studentName = weakSelf.name;
        if (studentAnswer == answer) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                block(studentName, CACurrentMediaTime() - startTime);
            }];
        }
    }];
}

- (NSInteger)randomWithIntervalFrom:(NSInteger)intervalFrom to:(NSInteger)intervalTo {
    return (arc4random() % (intervalTo-intervalFrom+1)) + intervalFrom;;
}

@end
