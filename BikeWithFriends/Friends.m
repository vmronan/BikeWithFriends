//
//  Friends.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "Friends.h"

@interface Friends()
{
  NSMutableArray* _friends;
}
@end

@implementation Friends

-(id)init
{
  self = [super init];
  
  if (self) {
    // Initialize the array
    _friends = [[NSMutableArray alloc] init];
    
    // Read in the file
    NSString* path;
    NSError* error;
    
    path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"txt"];
    
    NSString* friendsString = [[NSString alloc] initWithContentsOfFile:path
                                encoding:NSUTF8StringEncoding error:&error];
    
    [self parseFriendsFromString:friendsString];
  }
  
  return self;
}

// Helper method
// Parses the string into the friends array
-(void) parseFriendsFromString:(NSString*)friendsString
{
  // Each friend belongs to a new line
  NSArray* friends = [friendsString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
  
  // Get the properties from each friend and create a friend object
  // to store in the friends array
  for (NSString* friend in friends) {
    NSArray* properties = [friend componentsSeparatedByString:@"/"];
    NSString* name = [properties objectAtIndex:0];
    NSInteger level = [[properties objectAtIndex:1] integerValue];
    
    Friend* newFriend = [[Friend alloc] initWithName:name andLevel:level];
    [_friends addObject:newFriend];
  }
  
  return;
}

-(NSInteger) getFriendCount
{
  return [_friends count];
}

-(Friend*) getFriendWithId:(int)index
{
  if (index >= [_friends count]) {
    return NULL;
  }
  else {
    return [_friends objectAtIndex:index];
  }
}

@end

