//
//  Rides.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "Rides.h"

@implementation Rides

@synthesize rideDistance = _rideDistance;
@synthesize rideSpeed = _rideSpeed;
@synthesize rideTimeInSeconds = _rideTimeInSeconds;
@synthesize dateOfRide = _dateOfRide;

#pragma mark NSCoding

#define DistanceKey       @"Distance"
#define SpeedKey          @"Speed"
#define TimeKey           @"Time"


- (id)initWithDistance:(float)distance rideSpeed:(float)speed rideTime:(NSInteger)time dateOfRide:(NSDate *)date{
    if ((self = [super init])) {
        self.rideDistance = distance;
        self.rideSpeed = speed;
        self.rideTimeInSeconds = time;
        self.dateOfRide = date;
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeFloat:_rideDistance forKey:DistanceKey];
    [encoder encodeFloat:_rideSpeed forKey:SpeedKey];
    [encoder encodeInt64:_rideTimeInSeconds forKey:TimeKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    _rideDistance = [decoder decodeFloatForKey:DistanceKey];
    _rideSpeed = [decoder decodeFloatForKey:SpeedKey];
    _rideTimeInSeconds = [decoder decodeIntegerForKey:TimeKey];

    return [self initWithDistance:_rideDistance rideSpeed:_rideSpeed rideTime:_rideTimeInSeconds dateOfRide:_dateOfRide];
}


@end
