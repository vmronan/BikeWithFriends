//
//  NotificationsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "NotificationsViewController.h"
#import "NotificationCustomCell.h"

@implementation NotificationsViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.cellType = [NSMutableArray arrayWithArray:@[@"rideRequest", @"sentRequest",@"rideRequest", @"sentRequest",@"rideRequest", @"sentRequest"]];
        self.profilePictures = [NSMutableArray arrayWithArray:@[@"person-jenner.jpg",
                                                                @"person-vanessa.jpg",
                                                                @"person-sam.jpg",
                                                                @"person-jim.jpg",
                                                                @"person-george.jpg",
                                                                @"person-sarah.jpg"]];
        self.notifications = [NSMutableArray arrayWithArray:@[
                      @"Jenner wants to go biking with you!",
                      @"You invited Vanessa to go biking at 3pm",
                      @"Sam wants to go biking with you!",
                      @"You invited Jim to go biking at 7pm",
                      @"George wants to go biking with you!",
                      @"You invited Sarah to go biking at 2pm"]];
        self.descriptions = [NSMutableArray arrayWithArray:@[
                     @"Date: Today \nTime: 4:30 pm \nLocation: Mudd Cafe",
                     @"Date: Today \nTime: 3pm \nLocation: Atwood",
                     @"Date: Tomorrow \nTime: 1pm \nLocation: CrossFit",
                     @"Date: Wednesday \nTime: 7pm \nLocation: Hot Air Balloon Lab",
                     @"Date: Today \nTime: 11:11am \nLocation: Jim's House",
                     @"Date: Tomorrow \nTime: 2pm \nLocation: LAC"]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Notifications"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    // Create new cell if necessary
    if (cell == nil) {
        if ([self.cellType[indexPath.row]  isEqual: @"rideRequest"]) {
            cell = [[NotificationCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"rideRequest"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            // set up button behavior
            cell.acceptButton.tag = indexPath.row;
            cell.rejectButton.tag = indexPath.row;
            [cell.acceptButton addTarget:cell action:@selector(acceptRideRequest:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rejectButton addTarget:cell action:@selector(rejectRideRequest:) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            cell = [[NotificationCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"sentRequest"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            // set up button behavior
            cell.cancelButton.tag = indexPath.row;
            [cell.cancelButton addTarget:cell action:@selector(cancelRideRequest:) forControlEvents:UIControlEventTouchUpInside];
        }
    }

    // set cell information for ride request
    [cell.profileImage setImage:[UIImage imageNamed:[self.profilePictures objectAtIndex:indexPath.row]]];
    cell.mainLabel.text = [self.notifications objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [self.descriptions objectAtIndex:indexPath.row];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
