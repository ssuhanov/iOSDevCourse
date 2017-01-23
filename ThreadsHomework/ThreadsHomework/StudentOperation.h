//
//  StudentOperation.h
//  ThreadsHomework
//
//  Created by Serge Sukhanov on 1/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentOperation : NSObject

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)guessTheAnswer:(NSInteger)answer
      withIntervalFrom:(NSInteger)intervalFrom
                    to:(NSInteger)intervalTo
               inQueue:(NSString *)queueName
   withCompletionBlock:(StudentCompletionBlock)block;

@end
