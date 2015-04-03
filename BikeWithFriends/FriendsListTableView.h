//
//  FriendsListView.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friends.h"

@interface FriendsListTableView : UITableViewController

@property id target;
@property SEL setupRequestAction;
@property (strong, nonatomic) Friends *friends;

- (id)initWithTarget:(id)target setupRequestAction:(SEL)action;

@end
