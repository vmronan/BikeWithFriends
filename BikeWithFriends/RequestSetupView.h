//
//  RideRequestView.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestSetupView : UIView

@property id target;
@property SEL sendRequestAction;

- (id)initWithFrame:(CGRect)frame target:(id)target sendRequestAction:(SEL)action;
@end
