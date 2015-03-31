//
//  BikingProgressViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "BikingProgressViewController.h"
#import "Rides.h"

@implementation BikingProgressViewController

- (void)viewDidLoad {
    distance = 6;
    speed = 10;
    isPaused = false;
    [super viewDidLoad];
    [self setTitle:@"Bike Ride in Progress"];
    [self.navigationItem setHidesBackButton:YES]; // Pretty sure we still want this button?
    [self showFinishRideButton];
    [self showPauseRideButton];
    [self showTimer];
    [self showDistance];
    [self showSpeed];
}

- (void)showFinishRideButton {
    self.endRideButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 500, 200, 100)];
    [self.endRideButton setTitle:@"End Ride" forState:UIControlStateNormal];
    [self.endRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.endRideButton addTarget:self action:@selector(endRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.endRideButton];
}


- (void)showPauseRideButton {
    self.pauseRideButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 500, 100, 100)];
    [self.pauseRideButton setTitle:@"Pause" forState:UIControlStateNormal];
    [self.pauseRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.pauseRideButton addTarget:self action:@selector(pauseRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pauseRideButton];
}


- (void)showTimer {
    rideTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopWatch) userInfo:nil repeats:YES];
    
    self.timerLabel = [[UILabel alloc]initWithFrame:
                       CGRectMake(150, 200, 280, 80)];
    self.timerLabel.numberOfLines = 0;
    self.timerLabel.textColor = [UIColor blueColor];
    self.timerLabel.backgroundColor = [UIColor clearColor];
    self.timerLabel.font = [self.timerLabel.font fontWithSize:40];
    self.timerLabel.text = @"00:00";
    [self.view addSubview:self.timerLabel];
}

- (void)stopWatch {
    if (isPaused == false) {
        ++rideTime;
        minutes = rideTime / 60;
        seconds = rideTime % 60;
        self.timerLabel.text = [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)seconds];
    }
}

- (void)showDistance {
    self.distanceLabel = [[UILabel alloc]initWithFrame:
                       CGRectMake(80, 400, 100, 80)];
    self.distanceLabel.numberOfLines = 0;
    self.distanceLabel.textColor = [UIColor blueColor];
    self.distanceLabel.backgroundColor = [UIColor clearColor];
    self.distanceLabel.font = [self.distanceLabel.font fontWithSize:30];
    self.distanceLabel.text = [NSString stringWithFormat:@"%0.2f miles", distance];
    [self.view addSubview:self.distanceLabel];
}


- (void)showSpeed {
    self.speedLabel = [[UILabel alloc]initWithFrame:
                          CGRectMake(200, 400, 100, 80)];
    self.speedLabel.numberOfLines = 0;
    self.speedLabel.textColor = [UIColor blueColor];
    self.speedLabel.backgroundColor = [UIColor clearColor];
    self.speedLabel.font = [self.speedLabel.font fontWithSize:30];
    self.speedLabel.text = [NSString stringWithFormat:@"%.02f mph", speed];
    [self.view addSubview:self.speedLabel];
}


- (void)showAlertView {
    NSString *message = [NSString stringWithFormat:@"You rode %.02f miles over %02d minutes and %02d seconds. This comes out to an average speed of %.02f miles per hour.", distance, minutes, seconds, speed];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Great Ride!" message:message delegate:self cancelButtonTitle:@"Yay!" otherButtonTitles:nil];
    // optional - add more buttons:
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
        // send ride data to MainViewController
        if(_delegate && [_delegate respondsToSelector:@selector(bikingProgressDidDismissWithData:)])
        {
            [_delegate bikingProgressDidDismissWithData:self.ride];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void) pauseRide {
    // Stop  or start timer depending on state
    isPaused = !isPaused;
    if (isPaused == true) {
        [self.pauseRideButton setTitle:@"Resume" forState:UIControlStateNormal];
    }
    else {
        [self.pauseRideButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}


- (void)endRide {
    // Invalidate the timer
    [self.timer invalidate];
    
    // Save the ride data
    self.ride = [[Rides alloc] initWithDistance:distance rideSpeed:speed rideTime:rideTime dateOfRide:[NSDate date]];
    
    // Display the alert box
    [self showAlertView];
}




- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Unhide back button
    [self.navigationItem setHidesBackButton:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
