//
//  FriendsListView.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "FriendsListTableView.h"

@implementation FriendsListTableView


- (id)initWithTarget:(id)target setupRequestAction:(SEL)action {
    self = [super init];
    if(self) {
        self.target = target;
        self.setupRequestAction = action;

        // Get list of friends
        self.friends = [[Friends alloc] init];
        NSLog(@"friends #: %ld", (long)[self.friends getFriendCount]);
        NSLog(@"friend 0: %@", [[self.friends getFriendWithId:0] getName]);
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.friends getFriendCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    // Create new cell if necessary
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    // Set cell information
    cell.textLabel.text = [[self.friends getFriendWithId:(int)indexPath.row] getName];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
