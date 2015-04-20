//
//  BikingProgressViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "BikingProgressViewController.h"
#import "Rides.h"
#import "Constants.h"

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
    _boxPadding = self.view.frame.size.width/22;
    _boxEdge = self.view.frame.size.width*10/22;
    distance = 0;
    speed = 5.2;
    isPaused = false;
    
    [super viewDidLoad];
    [self setTitle:@"Enjoy Your Ride!"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setHidesBackButton:YES];
    [self showLevelProgress];
    [self showCancelRideButton];
    [self showFinishRideButton];
    [self showPauseRideButton];
    [self showProgress];
    [self showTimer];
    [self showDistance];
    [self showSpeed];
}

- (void)showCancelRideButton {
    UIBarButtonItem *cancelRideButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelRide)];
    [self.navigationItem setRightBarButtonItem:cancelRideButton];
}


- (void)showLevelProgress {
    int imgWidth = self.view.frame.size.width-20;
    UIImageView *levelProgressView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"level-progress"]];
    _progressImageHeight = imgWidth/levelProgressView.image.size.width*levelProgressView.image.size.height;
    [levelProgressView setFrame:CGRectMake(10, 74, imgWidth, imgWidth/levelProgressView.image.size.width*levelProgressView.image.size.height)];
    [self.view addSubview:levelProgressView];
}

- (void)showProgress {
    // Level progress -----
    CGFloat progressXOffset = 0;
    CGFloat progressYOffset = _screenHeight * 0.10;
    CGFloat progressWidth = _screenWidth - (2 * progressXOffset);
    CGFloat progressHeight = _screenHeight / 5.5;
    
    UIImageView* levelProgress = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    UIImage *levelProgressImage = [UIImage imageNamed:@"level-progress"];
    [levelProgress setImage:[UIImage imageNamed:@"level-progress"]];
    
    [self.view addSubview:levelProgress];
}


- (void)showTimer {
    rideTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopWatch) userInfo:nil repeats:YES];
    CGRect frame = CGRectMake(_boxPadding, _navBarHeight + _boxPadding + _progressImageHeight, _boxEdge * 2, _boxEdge);
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:kGreenColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/3, 20, frame.size.width/3, frame.size.height/3)];
    [icon setContentMode: UIViewContentModeScaleAspectFit];
    [icon setImage:[UIImage imageNamed:@"timerIcon.png"]];
    [background addSubview:icon];
    
    // add time
    self.timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/3, frame.size.height/2, frame.size.width/3, frame.size.height/3)];
    [self.timerLabel setFont:[UIFont fontWithName:kMainFont size:46]];
    [self.timerLabel setTextAlignment:NSTextAlignmentCenter];
    [self.timerLabel setText:@"00:00"];
    [background addSubview:self.timerLabel];
}

- (void)showDistance {
    CGRect frame = CGRectMake(_boxPadding, _navBarHeight + _boxPadding + _progressImageHeight + _boxEdge, _boxEdge, _boxEdge);
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:kOrangeColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/3, 10, frame.size.width/3, frame.size.height/4)];
    [icon setContentMode: UIViewContentModeScaleAspectFit];
    [icon setImage:[UIImage imageNamed:@"roadIcon.png"]];
    [background addSubview:icon];
    
    // add distance traveled
    NSString *distanceString = [NSString stringWithFormat:@"%0.2f", distance];
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height*2/5, frame.size.width, frame.size.height/3)];
    [self.distanceLabel setFont:[UIFont fontWithName:kMainFont size:36]];
    [self.distanceLabel setText:distanceString];
    [self.distanceLabel setTextAlignment:NSTextAlignmentCenter];
    [background addSubview:self.distanceLabel];
    
    // add title
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height*2/3, frame.size.width, frame.size.height/3)];
    [textLabel setText:@"MILES"];
    [textLabel setFont:[UIFont fontWithName:kMainFont size:22]];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    
    [background addSubview:textLabel];
}

- (void)showSpeed {
    CGRect frame = CGRectMake(_boxPadding + _boxEdge, _navBarHeight + _boxPadding + _progressImageHeight + _boxEdge, _boxEdge, _boxEdge);
    
    // colored background square
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:kRedColor];
    [self.view addSubview:background];
    
    // add icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/3, 10, frame.size.width/3, frame.size.height/3)];
    [icon setContentMode: UIViewContentModeScaleAspectFit];
    [icon setImage:[UIImage imageNamed:@"speedIcon.png"]];
    [background addSubview:icon];
    
    // add speed
    NSString *speedString = [NSString stringWithFormat:@"%0.2f", speed];
    self.speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/4, frame.size.height*2/5, frame.size.width/2, frame.size.height/3)];
    [self.speedLabel setFont:[UIFont fontWithName:kMainFont size:36]];
    [self.speedLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.speedLabel setText:speedString];
    [background addSubview:self.speedLabel];
    
    // add title
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/3, frame.size.height*2/3, frame.size.width/3, frame.size.height/3)];
    [textLabel setText:@"MPH"];
    [textLabel setFont:[UIFont fontWithName:kMainFont size:22]];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [background addSubview:textLabel];
}

- (void)showPauseRideButton {
    self.pauseRideButton = [[UIButton alloc] initWithFrame:CGRectMake(_boxPadding * 4, _navBarHeight + _boxPadding * 2 + _progressImageHeight + _boxEdge * 2, _boxEdge/2, _boxEdge/2)];
    [self.pauseRideButton setImage:[UIImage imageNamed:@"pauseIcon.png"] forState: UIControlStateNormal];
    [self.pauseRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.pauseRideButton addTarget:self action:@selector(pauseRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pauseRideButton];
}

- (void)showFinishRideButton {
    self.endRideButton = [[UIButton alloc] initWithFrame:CGRectMake(_boxPadding * 4 + _boxEdge, _navBarHeight + _boxPadding * 2 + _progressImageHeight + _boxEdge * 2, _boxEdge/2, _boxEdge/2)];
    [self.endRideButton setImage:[UIImage imageNamed:@"finishIcon.png"] forState: UIControlStateNormal];
    [self.endRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.endRideButton addTarget:self action:@selector(endRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.endRideButton];
}
- (void)stopWatch {
    if (isPaused == false) {
        ++rideTime;
        minutes = rideTime / 60;
        seconds = rideTime % 60;
        self.timerLabel.text = [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)seconds];
        self.distanceLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
        
        if (rideTime % 3 == 0) {
            speed = 5.2;
            self.speedLabel.text = [NSString stringWithFormat:@"%0.2f", speed];
            distance = distance + .01;

        }
        else {
            speed = 5.3;
            self.speedLabel.text = [NSString stringWithFormat:@"%0.2f", speed];
        }
    }
}

- (void)showAlertView {
    NSString *message;
    if (rideTime < 60) {
        message = [NSString stringWithFormat:@"You rode %.02f miles over %02d seconds. This comes out to an average speed of %.02f miles per hour.", distance, seconds, speed];
    }
    else {
        message = [NSString stringWithFormat:@"You rode %.02f miles over %02d minutes and %02d seconds. This comes out to an average speed of %.02f miles per hour.", distance, minutes, seconds, speed];
    }
    _endRideAlert = [[UIAlertView alloc] initWithTitle:@"Great Ride!" message:message delegate:self cancelButtonTitle:@"Yay!" otherButtonTitles:nil];
    [_endRideAlert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // send ride data to MainViewController
        if (alertView == _endRideAlert) {
            if(_delegate && [_delegate respondsToSelector:@selector(bikingProgressDidDismissWithData:)])
            {
                [_delegate bikingProgressDidDismissWithData:self.ride];
            }
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

- (void)cancelRide {
    NSString *message;
    message = [NSString stringWithFormat:@"You canceled the ride."];
    _cancelRideAlert = [[UIAlertView alloc] initWithTitle:@"Ride Canceled" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [_cancelRideAlert show];
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
