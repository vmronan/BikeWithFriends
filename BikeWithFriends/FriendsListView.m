//
//  FriendsListView.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "FriendsListView.h"

@implementation FriendsListView

- (id)initWithFrame:(CGRect)frame target:(id)target setupRequestAction:(SEL)action {
    self = [super initWithFrame:frame];
    if(self) {
        self.target = target;
        self.setupRequestAction = action;
        [self showRideRequestButton];
    }
    return self;
}

- (void)showRideRequestButton {
    UIButton *rideRequestButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 300, 100)];
    [rideRequestButton setTitle:@"Request ride with Vanessa" forState:UIControlStateNormal];
    [rideRequestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rideRequestButton addTarget:self.target action:self.setupRequestAction forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rideRequestButton];
}

@end
