//
//  Friend.m
//  BikeWithFriends
//
//  Created by Sarah Trisorus on 3/26/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "Friend.h"

@interface Friend() {
  NSString* _name;
  NSInteger _level;
}
@end

@implementation Friend

// Constructor
- (id)initWithName:(NSString*)name andLevel:(NSInteger)level
{
  self = [super init];
  
  if (self) {
    // Initialize the member variables
    _name = name;
    _level = level;
  }
  
  return self;
}

// Accessor method for name
-(NSString*)getName
{
  return _name;
}

// Accessor method for level
-(NSInteger)getLevel
{
  return _level;
}

@end
