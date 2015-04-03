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
        self.notifications = [NSMutableArray arrayWithArray:@[@"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm", @"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm", @"Jenner wants to go biking with you!", @"You invited Vanessa to go biking at 3pm"]];
        self.descriptions = [NSMutableArray arrayWithArray:@[@"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date:1/1/2015 \nTime:4pm \nLocation:Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date:1/1/2015 \nTime:4pm \nLocation:Mudd", @"Date: 1/1/2015 \nTime: 4pm \nLocation: Mudd", @"Date:1/1/2015 \nTime:4pm \nLocation:Mudd"]];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Notifications"];
    // Do any additional setup after loading the view.
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
        cell = [[NotificationCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"rideRequest"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [self changeBackgroundColor:cell indexPath:indexPath];
        
    // set up button behavior
    cell.acceptButton.tag = indexPath.row;
    [cell.acceptButton addTarget:self action:@selector(acceptRideRequest:) forControlEvents:UIControlEventTouchUpInside];
    [cell.rejectButton addTarget:self action:@selector(rejectRideRequest:) forControlEvents:UIControlEventTouchUpInside];

    // Set cell information for ride request
    cell.mainLabel.text = [self.notifications objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [self.descriptions objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)acceptRideRequest:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    [self.notifications removeObjectAtIndex:senderButton.tag];
    [self.descriptions removeObjectAtIndex:senderButton.tag];
    [self.tableView reloadData];
}

-(void)rejectRideRequest:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    [self.notifications removeObjectAtIndex:senderButton.tag];
    [self.descriptions removeObjectAtIndex:senderButton.tag];
    [self.tableView reloadData];
}

-(void)changeBackgroundColor:(NotificationCustomCell *)cell indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 3 == 0) {
        UIColor *backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:107.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
        cell.backgroundColor = backgroundColor;
    }
    else if (indexPath.row % 3 == 1) {
        UIColor *backgroundColor = [UIColor colorWithRed:199.0f/255.0f green:244.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
        cell.backgroundColor = backgroundColor;
    }
    else {
        UIColor *backgroundColor = [UIColor colorWithRed:26==78.0f/255.0f green:205.0f/255.0f blue:196.0f/255.0f alpha:1.0f];
        cell.backgroundColor = backgroundColor;
    }
    
}









- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
