//
//  FriendsTests.m
//  BikeWithFriends
//
//  Created by Sarah Trisorus on 3/27/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "Friends.h"

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface FriendsTests : XCTestCase

@end

@implementation FriendsTests

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testFriendObject {
  // Make sure a new Friend object can be correctly created
  Friend* newFriend = [[Friend alloc] initWithName:@"Jim" andLevel:1];
  
  XCTAssertEqual([newFriend getName], @"Jim");
  XCTAssertEqual([newFriend getLevel], 1);
}

- (void)testFriendsModel {
  // Make sure the Model parses the correct friends
  Friends* friendModel = [[Friends alloc] init];
  
  // Check that the number of friends is correct
  XCTAssertEqual([friendModel getFriendCount], 4);
  
  // Check that the first and last friends are correct
  Friend* friend = [friendModel getFriendWithId:0];
  XCTAssertTrue([[friend getName] isEqualToString:@"Jim"]);
  XCTAssertEqual([friend getLevel], 20);
  
  friend = [friendModel getFriendWithId:3];
  XCTAssertTrue([[friend getName] isEqualToString:@"Vanessa"]);
  XCTAssertEqual([friend getLevel], 15);
}

@end
