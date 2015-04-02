//
//  BikingProgressViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rides.h"
#import "BikingProgressDelegate.h"

@interface BikingProgressViewController : UIViewController {
    int rideTime;
    int minutes;
    int seconds;
    float speed;
    float distance;
    bool isPaused;
}

@property (strong, nonatomic) UIButton *pauseRideButton;
@property (strong, nonatomic) UIButton *endRideButton;
@property (strong, nonatomic) UILabel *timerLabel;
@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) Rides *ride;
@property (nonatomic, weak) id<BikingProgressDelegate> delegate;

@end
