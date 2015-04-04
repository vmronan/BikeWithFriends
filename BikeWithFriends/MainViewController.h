//
//  ViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rides.h"
#import "BikingProgressDelegate.h"

@interface MainViewController : UIViewController <BikingProgressDelegate>

@property (strong, nonatomic) UIButton *startBikingButton;
@property (strong, nonatomic) UIButton *notificationsButton;
@property (strong, nonatomic) UIButton *friendsButton;
@property (strong, nonatomic) UIButton *statisticsButton;
@property (strong, nonatomic) UIButton *achievementsButton;

// Ride list for logs
@property(strong) NSMutableArray *rides;
- (void)bikingProgressDidDismissWithData: (Rides*)ride;



@end

