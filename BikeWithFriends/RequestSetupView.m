//
//  RideRequestView.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "RequestSetupView.h"

@implementation RequestSetupView

- (id)initWithFrame:(CGRect)frame target:(id)target sendRequestAction:(SEL)action {
    self = [super initWithFrame:frame];
    if(self) {
        self.target = target;
        self.sendRequestAction = action;
        [self showSendRequestButton];
    }
    return self;
}

- (void)showSendRequestButton {
    UIButton *rideRequestButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 300, 100)];
    [rideRequestButton setTitle:@"Send request" forState:UIControlStateNormal];
    [rideRequestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rideRequestButton addTarget:self.target action:self.sendRequestAction forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rideRequestButton];
}

@end
