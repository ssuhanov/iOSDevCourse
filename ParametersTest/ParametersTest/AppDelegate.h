//
//  AppDelegate.h
//  ParametersTest
//
//  Created by Serge Sukhanov on 12/11/16.
//  Copyright © 2016 Serge Sukhanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Object;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, getter = getObject1, setter = setShmetObject1:) Object *object1;
@property (strong, nonatomic) Object *object2;
@property (weak, nonatomic) Object *object3;
@property (copy, nonatomic) Object *object4;

@end

