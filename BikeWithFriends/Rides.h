//
//  Rides.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rides : NSObject <NSCoding>

@property (assign) float rideDistance;
@property (assign) float rideSpeed;
@property (assign) NSInteger rideTimeInSeconds;
@property (nonatomic,strong) NSDate* dateOfRide;

- (id)initWithDistance:(float)distance rideSpeed:(float)speed rideTime:(NSInteger)time dateOfRide:(NSDate*) date;



@end
