//
//  FriendsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "FriendsViewController.h"

@implementation FriendsViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        // Get list of friends
        self.friends = [[Friends alloc] init];
        
        // Show tableview of friends
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [self.tableView setDataSource:self];
        [self.tableView setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showAddFriendsButton];
    [self showFriendsListView];
}

/***************************
    METHODS TO SETUP VIEW
 ***************************/

- (void)showAddFriendsButton {
    UIBarButtonItem *addFriendsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddFriendsView)];
    [self.navigationItem setRightBarButtonItem:addFriendsButton];
}

- (void)showAddFriendsView {
    // Not sure how we want this to work
}

- (void)showFriendsListView {
    [self setTitle:@"Friends"];
    [self setView:self.tableView];
    
    // Don't show cancel button if user cancels from ride request setup page
    [self.navigationItem setLeftBarButtonItem:nil];
    [self showAddFriendsButton];
}

- (void)showRideRequestViewWithFriend:(Friend *)friend {
    // Change back button to cancel button
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(showFriendsListView)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    [self.navigationItem setRightBarButtonItem:nil];
    
    // Show view
    [self setTitle:@"Send Ride Request"];
    self.requestSetupView = [[RequestSetupView alloc] initWithFrame:self.view.frame friend:friend];
    self.requestSetupView.delegate = self;
    [self setView:self.requestSetupView];
}

- (void)sendRequestForTime:(NSDate *)datetime atPlace:(NSString *)where withNotes:(NSString *)notes {
  NSLog(@"Request sent");
    // TODO: Save request data somewhere
    
    // Pop this view controller to return to home screen
    [self.navigationController popViewControllerAnimated:YES];
}


/************************
    TABLE VIEW METHODS
 ************************/

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
    
    // Show friend's name, level, and photo
    Friend *friend = [self.friends getFriendWithId:(int)indexPath.row];
    cell.textLabel.text = [friend getName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Level %ld",(long)[friend getLevel]];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"person-%@.jpg", [[friend getName] lowercaseString] ]];
    
    // Show bike icon on right of cell
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    if (self.bikeImage == nil) {
        self.bikeImage = [UIImage imageNamed:@"bike-icon.png"];
    }
    
    cell.accessoryView = (UIView *)[[UIImageView alloc] initWithImage:self.bikeImage];
    [cell.accessoryView setFrame:CGRectMake(0, 0, 36, 36)];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showRideRequestViewWithFriend:[self.friends getFriendWithId:(int)indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
