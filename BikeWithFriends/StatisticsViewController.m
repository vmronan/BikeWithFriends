//
//  StatisticsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "StatisticsViewController.h"
#import "Rides.h"

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Statistics"];
    [self showLogsButton];
}

- (void)showLogsButton {
    UIBarButtonItem *logsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(pushLogsView)];
    [self.navigationItem setRightBarButtonItem:logsButton];
}

- (void)pushLogsView {
    self.logsViewController = [[LogsViewController alloc] init];
    self.logsViewController.rides = [self createRides];
    [self.navigationController pushViewController:self.logsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Make a few fake rides
// I'm not sure where we will want to do this. If we actually want to record rides,
// the rides will end up being in the MainViewController probably since we need to access them when we
// create a ride and the list should already be created by then. We can talk about this.
- (NSMutableArray*) createRides {
    Rides *ride1 = [[Rides alloc] initWithDistance:2.0 rideSpeed:4.2 rideTime:200 dateOfRide:[NSDate date]];
    Rides *ride2 = [[Rides alloc] initWithDistance:3.0 rideSpeed:5.2 rideTime:400 dateOfRide:[NSDate date]];
                    
    NSMutableArray *rides = [NSMutableArray arrayWithObjects:ride1, ride2, nil];
    return rides;
}

@end
