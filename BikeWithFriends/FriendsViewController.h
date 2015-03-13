//
//  FriendsViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsListView.h"
#import "RequestSetupView.h"

@interface FriendsViewController : UIViewController

@property (strong, nonatomic) FriendsListView *friendsListView;
@property (strong, nonatomic) RequestSetupView *requestSetupView;

@end
