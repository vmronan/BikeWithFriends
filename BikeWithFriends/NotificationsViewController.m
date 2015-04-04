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
        self.profilePictures = [NSMutableArray arrayWithArray:@[@"profilePicture1.jpg", @"profilePicture2.jpg", @"profilePicture3.jpg",@"profilePicture1.jpg", @"profilePicture2.jpg", @"profilePicture3.jpg"]];
        self.notifications = [NSMutableArray arrayWithArray:@[@"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm", @"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm", @"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm"]];
        self.descriptions = [NSMutableArray arrayWithArray:@[@"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation:Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd"]];
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
