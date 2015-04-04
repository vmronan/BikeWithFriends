//
//  AddFriendsView.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "AddFriendsView.h"

@implementation AddFriendsView

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  if (self) {
    // Create the static image
    // 7.5% border on each side
    CGFloat xOffset = CGRectGetWidth(frame) * 0.075;
    CGFloat yOffset = CGRectGetHeight(frame) * 0.075;
    CGFloat width = CGRectGetWidth(frame) - (2 * xOffset);
    CGFloat height = CGRectGetHeight(frame) - (2 * yOffset);
    
    // Set the image
    UIImageView* bumpToAdd = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset, yOffset, width, height)];
    [bumpToAdd setImage:[UIImage imageNamed:@"bump-phones"]];
    
    // Add it to the view
    [self addSubview:bumpToAdd];
  }
  
  return self;
}

@end
