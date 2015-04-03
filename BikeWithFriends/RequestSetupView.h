//
//  RideRequestView.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@protocol RequestSetupProtocol <NSObject>
-(void)sendRequestForTime:(NSDate*)datetime atPlace:(NSString*)where withNotes:(NSString*)notes;
@end

@interface RequestSetupView : UIView <UITextFieldDelegate>

@property (assign, nonatomic) id <RequestSetupProtocol> delegate;

-(id)initWithFrame:(CGRect)frame friend:(Friend *)friend;
@end
