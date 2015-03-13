//
//  FriendsListView.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsListView : UIView

@property id target;
@property SEL setupRequestAction;

- (id)initWithFrame:(CGRect)frame target:(id)target setupRequestAction:(SEL)action;

@end
