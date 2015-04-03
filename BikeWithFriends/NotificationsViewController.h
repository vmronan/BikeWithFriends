//
//  NotificationsViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationsViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *cellType;
@property (strong, nonatomic) NSMutableArray *notifications;
@property (strong, nonatomic) NSMutableArray *descriptions;
@property (strong, nonatomic) NSMutableArray *profilePictures;

@end
