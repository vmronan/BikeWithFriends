//
//  FriendsViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddFriendsView.h"
#import "RequestSetupView.h"
#import "Friends.h"
#import "Friend.h"

@interface FriendsViewController : UIViewController <RequestSetupProtocol, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) AddFriendsView *addFriendsView;
@property (strong, nonatomic) RequestSetupView *requestSetupView;
@property (strong, nonatomic) Friends *friends;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImage *bikeImage;

@end
