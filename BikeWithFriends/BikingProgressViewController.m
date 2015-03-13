//
//  BikingProgressViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "BikingProgressViewController.h"

@implementation BikingProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Bike Ride in Progress"];
    [self.navigationItem setHidesBackButton:YES];
    [self showFinishRideButton];
}

- (void)showFinishRideButton {
    self.endRideButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, 200, 100)];
    [self.endRideButton setTitle:@"End Ride" forState:UIControlStateNormal];
    [self.endRideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.endRideButton addTarget:self action:@selector(endRide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.endRideButton];
}

- (void)endRide {
    // Save data
    
    // Pop view controller to return to home page
    [self.navigationController popViewControllerAnimated:YES];
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
