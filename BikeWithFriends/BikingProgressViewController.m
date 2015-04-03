//
//  BikingProgressViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "BikingProgressViewController.h"
#import "Rides.h"

@implementation BikingProgressViewController {
    int _screenWidth;
    int _screenHeight;
    int _navBarHeight;
    int _progressImageHeight;
    int _boxPadding;
    int _boxEdge;
}

- (void)viewDidLoad {
    _navBarHeight = 64;
    _progressImageHeight = 120;
    _boxPadding = self.view.frame.size.width/22;
    _boxEdge = self.view.frame.size.width*10/22;
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
    self.endRideButton = [[UIButton alloc] initWithFrame:CGRectMake(_boxPadding * 4 + _boxEdge, _navBarHeight + _boxPadding * 2 + _progressImageHeight + _boxEdge * 2, _boxEdge/2, _boxEdge/2)];
    [self.endRideButton setImage:[UIImage imageNamed:@"finishIcon.png"] forState: UIControlStateNormal];
    [self.endRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.endRideButton addTarget:self action:@selector(endRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.endRideButton];
}


- (void)showPauseRideButton {
    self.pauseRideButton = [[UIButton alloc] initWithFrame:CGRectMake(_boxPadding * 4, _navBarHeight + _boxPadding * 2 + _progressImageHeight + _boxEdge * 2, _boxEdge/2, _boxEdge/2)];
    [self.pauseRideButton setImage:[UIImage imageNamed:@"pauseIcon.png"] forState: UIControlStateNormal];
    [self.pauseRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.pauseRideButton addTarget:self action:@selector(pauseRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pauseRideButton];
}


- (void)showTimer {
    rideTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopWatch) userInfo:nil repeats:YES];

    NSValue *frame = [NSValue valueWithCGRect:CGRectMake(_boxPadding, _navBarHeight + _boxPadding + _progressImageHeight, _boxEdge * 2, _boxEdge)];
    UIColor *backgroundColor = [UIColor colorWithRed:26==78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0f];
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame.CGRectValue];
    [background setBackgroundColor:backgroundColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, 4, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3)];
    [icon setContentMode: UIViewContentModeScaleToFill];
    [icon setImage:[UIImage imageNamed:@"timerIcon.png"]];
    [background addSubview:icon];
    
    // add time
    self.timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/2.5, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3)];
    [self.timerLabel setFont:[UIFont systemFontOfSize:46]];
    [self.timerLabel setText:@"00:00"];
    [background addSubview:self.timerLabel];
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
    NSValue *frame = [NSValue valueWithCGRect:CGRectMake(_boxPadding, _navBarHeight + _boxPadding + _progressImageHeight + _boxEdge, _boxEdge, _boxEdge)];
    UIColor *backgroundColor = [UIColor colorWithRed:199.0f/255.0f green:244.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame.CGRectValue];
    [background setBackgroundColor:backgroundColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, 0, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/4)];
    [icon setContentMode: UIViewContentModeScaleToFill];
    [icon setImage:[UIImage imageNamed:@"roadIcon.png"]];
    [background addSubview:icon];
    
    // add distance traveled
    NSString *distanceString = [NSString stringWithFormat:@"%0.2f", distance];
    UILabel *distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3)];
    [distanceLabel setFont:[UIFont systemFontOfSize:25]];
    [distanceLabel setText:distanceString];
    [background addSubview:distanceLabel];
    
    // add title
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, frame.CGRectValue.size.height*2/3, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3)];
    [textLabel setText:@"MILES"];
    [background addSubview:textLabel];
}


- (void)showSpeed {
    NSValue *frame = [NSValue valueWithCGRect:CGRectMake(_boxPadding + _boxEdge, _navBarHeight + _boxPadding + _progressImageHeight + _boxEdge, _boxEdge, _boxEdge)];
    UIColor *backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame.CGRectValue];
    [background setBackgroundColor:backgroundColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, 0, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/4)];
    [icon setContentMode: UIViewContentModeScaleToFill];
    [icon setImage:[UIImage imageNamed:@"speedIcon.png"]];
    [background addSubview:icon];
    
    // add speed
    NSString *speedString = [NSString stringWithFormat:@"%0.2f", speed];
    UILabel *speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/4, frame.CGRectValue.size.height/3, frame.CGRectValue.size.width/2, frame.CGRectValue.size.height/3)];
    [speedLabel setFont:[UIFont systemFontOfSize:25]];
    [speedLabel setText:speedString];
    [background addSubview:speedLabel];
    
    // add title
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.CGRectValue.size.width/3, frame.CGRectValue.size.height*2/3, frame.CGRectValue.size.width/3, frame.CGRectValue.size.height/3)];
    [textLabel setText:@"MPH"];
    [background addSubview:textLabel];
}


- (void)showAlertView {
    NSString *message = [NSString stringWithFormat:@"You rode %.02f miles over %02d minutes and %02d seconds. This comes out to an average speed of %.02f miles per hour.", distance, minutes, seconds, speed];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Great Ride!" message:message delegate:self cancelButtonTitle:@"Yay!" otherButtonTitles:nil];
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
        [self.pauseRideButton setImage:[UIImage imageNamed:@"playIcon.png"] forState: UIControlStateNormal];
    }
    else {
        [self.pauseRideButton setImage:[UIImage imageNamed:@"pauseIcon.png"] forState: UIControlStateNormal];
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
