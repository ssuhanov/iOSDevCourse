//
//  Biker.h
//  ArraysHomework
//
//  Created by Serge Sukhanov on 12/21/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import "Human.h"
#import "Jumper.h"

@interface Biker : Human <Jumper>

#pragma mark - Jumper

@property (assign, nonatomic) double maxHeight;
@property (assign, nonatomic) WearColor wearColor;

@end
