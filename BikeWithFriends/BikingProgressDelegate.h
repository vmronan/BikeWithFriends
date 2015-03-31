//
//  BikingProgressDelegate.h
//  BikeWithFriends
//
//  Created by JennerPerry on 3/27/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rides.h"

@protocol BikingProgressDelegate <NSObject>

@required
- (void)bikingProgressDidDismissWithData:(Rides*)ride;
@end