//
//  FriendsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "FriendsViewController.h"

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showAddFriendsButton];
    [self showFriendsListView];
}

/***************************
    METHODS TO SETUP VIEW
 ***************************/

- (void)showAddFriendsButton {
    UIBarButtonItem *addFriendsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddFriendsView)];
    [self.navigationItem setRightBarButtonItem:addFriendsButton];
}

- (void)showAddFriendsView {
    // Not sure how we want this to work
}

- (void)showFriendsListView {
    [self setTitle:@"Friends"];
    self.friendsListView = [[FriendsListView alloc] initWithFrame:self.view.frame target:self setupRequestAction:@selector(showRideRequestView)];
    [self setView:self.friendsListView];
    
    // Don't show cancel button if user cancels from ride request setup page
    [self.navigationItem setLeftBarButtonItem:nil];
    [self showAddFriendsButton];
}

- (void)showRideRequestView {
    // Change back button to cancel button
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(showFriendsListView)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    [self.navigationItem setRightBarButtonItem:nil];
    
    // Show view
    [self setTitle:@"Send Ride Request"];
    self.requestSetupView = [[RequestSetupView alloc] initWithFrame:self.view.frame target:self sendRequestAction:@selector(sendRequest)];
    [self setView:self.requestSetupView];
}

- (void)sendRequest {
    // Send request data
    
    // Pop this view controller to return to home screen
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
