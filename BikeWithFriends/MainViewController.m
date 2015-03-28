//
//  ViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "MainViewController.h"
#import "BikingProgressViewController.h"
#import "NotificationsViewController.h"
#import "FriendsViewController.h"
#import "StatisticsViewController.h"
#import "AchievementsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Bike with Friends"];
    [self showNavBarButtons];
    [self showButtons];
}

/***************************
    METHODS TO SETUP VIEW
 ***************************/

- (void)showNavBarButtons {
    UIBarButtonItem *sliderButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(slideSidebarOut)];
    [self.navigationItem setRightBarButtonItem:sliderButton];
}

- (void)showButtons {
    int screenWidth = self.view.frame.size.width;
    int screenHeight = self.view.frame.size.height;
    
    // Temporary until we update button layout
    int buttonWidth = 0.75*screenWidth;
    int buttonHeight = 0.15*screenHeight;
    
    // Start biking
    self.startBikingButton = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-buttonWidth)/2, buttonHeight, buttonWidth, buttonHeight)];
    [self.startBikingButton setTitle:@"Start Biking" forState:UIControlStateNormal];
    [self.startBikingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startBikingButton addTarget:self action:@selector(pushBikingProgressView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startBikingButton];
    
    // Notifications
    self.notificationsButton = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-buttonWidth)/2, buttonHeight*2, buttonWidth, buttonHeight)];
    [self.notificationsButton setTitle:@"Notifications" forState:UIControlStateNormal];
    [self.notificationsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.notificationsButton addTarget:self action:@selector(pushNotificationsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.notificationsButton];
    
    // Friends
    self.friendsButton = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-buttonWidth)/2, buttonHeight*3, buttonWidth, buttonHeight)];
    [self.friendsButton setTitle:@"Friends" forState:UIControlStateNormal];
    [self.friendsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.friendsButton addTarget:self action:@selector(pushFriendsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.friendsButton];
    
    // Statistics
    self.statisticsButton = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-buttonWidth)/2, buttonHeight*4, buttonWidth, buttonHeight)];
    [self.statisticsButton setTitle:@"Statistics" forState:UIControlStateNormal];
    [self.statisticsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.statisticsButton addTarget:self action:@selector(pushStatisticsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.statisticsButton];
    
    // Achievements
    self.achievementsButton = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-buttonWidth)/2, buttonHeight*5, buttonWidth, buttonHeight)];
    [self.achievementsButton setTitle:@"Achievements" forState:UIControlStateNormal];
    [self.achievementsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.achievementsButton addTarget:self action:@selector(pushAchievementsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.achievementsButton];
}

- (void)slideSidebarOut {
    
}

/**************************************
    METHODS TO PUSH VIEW CONTROLLERS
 **************************************/

- (void)pushBikingProgressView {
    BikingProgressViewController *vc = [[BikingProgressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushNotificationsView {
    NotificationsViewController *vc = [[NotificationsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushFriendsView {
    FriendsViewController *vc = [[FriendsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushStatisticsView {
    StatisticsViewController *vc = [[StatisticsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushAchievementsView {
    AchievementsViewController *vc = [[AchievementsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO
- (NSMutableArray*)createLogs {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"rides.txt"];
    
    NSMutableArray *myObject=[NSMutableArray array];
    //[Rides addObject:self.];
    
    [NSKeyedArchiver archiveRootObject:myObject toFile:appFile];
    
    NSMutableArray* ridesArray = [NSKeyedUnarchiver unarchiveObjectWithFile:appFile];
    
    return ridesArray;
}













@end
