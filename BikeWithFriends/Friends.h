//
//  Friends.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "Friend.h"
#import <Foundation/Foundation.h>

@interface Friends : NSObject

-(NSInteger)getFriendCount;
-(Friend*) getFriendWithId:(int)index;

@end
