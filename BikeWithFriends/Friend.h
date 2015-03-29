//
//  Friend.h
//  BikeWithFriends
//
//  Created by Sarah Trisorus on 3/26/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

-(id)initWithName:(NSString*)name andLevel:(NSInteger)level;

-(NSString*)getName;
-(NSInteger)getLevel;

@end
