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
//    [self showNavBarButtons];
    [self showButtons];
    
    if (self.rides == nil) {
        [self createRides];
    }
}

/***************************
    METHODS TO SETUP VIEW
 ***************************/

- (void)showNavBarButtons {
    UIBarButtonItem *sliderButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(slideSidebarOut)];
    [self.navigationItem setRightBarButtonItem:sliderButton];
}

- (void)showButtons {
    CGFloat screenWidth = CGRectGetWidth([[self view] frame]);
    CGFloat screenHeight = CGRectGetHeight([[self view] frame]);;
    
    // Level progress -----
    CGFloat progressXOffset = 0;
    CGFloat progressYOffset = screenHeight * 0.10;
    CGFloat progressWidth = screenWidth - (2 * progressXOffset);
    CGFloat progressHeight = screenHeight / 5.5;
    
    UIImageView* levelProgress = [[UIImageView alloc] initWithFrame:CGRectMake(progressXOffset, progressYOffset, progressWidth, progressHeight)];
    [levelProgress setImage:[UIImage imageNamed:@"level-progress"]];
    
    [self.view addSubview:levelProgress];
    
    // Screen size for other buttons
    CGFloat navSectionXOffset = progressWidth * 0.10;
    CGFloat navSectionYOffset = progressYOffset + progressHeight + (progressHeight * 0.25);
    CGFloat navSectionWidth = screenWidth - (2 * navSectionXOffset);
    CGFloat navSectionHeight = screenHeight - progressHeight - (2 * progressYOffset);
    
    CGFloat buttonXPadding = navSectionWidth * 0.02;
    CGFloat buttonYPadding = navSectionHeight * 0.02;
    
    // Start biking -----
    CGFloat buttonXOffset = navSectionXOffset;
    CGFloat buttonYOffset = navSectionYOffset;
    CGFloat buttonWidth = navSectionWidth;
    CGFloat buttonHeight = navSectionHeight / 4.5;
    CGRect buttonFrame = CGRectMake(buttonXOffset, buttonYOffset, buttonWidth, buttonHeight);
    [self displayStartBikingButtonWithFrame:buttonFrame];
    
    // Notifications -----
    buttonYOffset += buttonHeight + buttonYPadding;
    buttonWidth = (navSectionWidth / 2) - (buttonXPadding / 2);
    buttonFrame = CGRectMake(buttonXOffset, buttonYOffset, buttonWidth, buttonHeight);
    [self displayNotificationsButtonWithFrame:buttonFrame];
    
    // Friends -----
    buttonXOffset += buttonWidth + buttonXPadding;
    buttonFrame = CGRectMake(buttonXOffset, buttonYOffset, buttonWidth, buttonHeight);
    [self displayFriendsButtonWithFrame:buttonFrame];
    
    // Achievements -----
    buttonYOffset += buttonHeight + buttonYPadding;
    buttonFrame = CGRectMake(buttonXOffset, buttonYOffset, buttonWidth, buttonHeight);
    [self displayAchievementsButtonWithFrame:buttonFrame];
    
    // Statistics -----
    buttonXOffset -= buttonWidth + buttonXPadding;
    buttonFrame = CGRectMake(buttonXOffset, buttonYOffset, buttonWidth, buttonHeight);
    [self displayStatisticsButtonWithFrame:buttonFrame];
}

- (void)displayStartBikingButtonWithFrame:(CGRect)frame {
    self.startBikingButton = [[UIButton alloc] initWithFrame:frame];
    [self.startBikingButton setBackgroundImage:[UIImage imageNamed:@"btn-startbiking"] forState:UIControlStateNormal];
    [self.startBikingButton addTarget:self action:@selector(pushBikingProgressView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startBikingButton];
}

- (void)displayNotificationsButtonWithFrame:(CGRect)frame {
    self.notificationsButton = [[UIButton alloc] initWithFrame:frame];
    [self.notificationsButton setBackgroundImage:[UIImage imageNamed:@"btn-notifications"] forState:UIControlStateNormal];
    [self.notificationsButton addTarget:self action:@selector(pushNotificationsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.notificationsButton];
}

- (void)displayFriendsButtonWithFrame:(CGRect)frame {
    self.friendsButton = [[UIButton alloc] initWithFrame:frame];
    [self.friendsButton setBackgroundImage:[UIImage imageNamed:@"btn-friends"] forState:UIControlStateNormal];
    [self.friendsButton addTarget:self action:@selector(pushFriendsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.friendsButton];
}

- (void)displayStatisticsButtonWithFrame:(CGRect)frame {
    self.statisticsButton = [[UIButton alloc] initWithFrame:frame];
    [self.statisticsButton setBackgroundImage:[UIImage imageNamed:@"btn-statistics"] forState:UIControlStateNormal];
    [self.statisticsButton addTarget:self action:@selector(pushStatisticsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.statisticsButton];
}

- (void)displayAchievementsButtonWithFrame:(CGRect)frame {
    self.achievementsButton = [[UIButton alloc] initWithFrame:frame];
    [self.achievementsButton setBackgroundImage:[UIImage imageNamed:@"btn-achievements"] forState:UIControlStateNormal];
    [self.achievementsButton addTarget:self action:@selector(pushAchievementsView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.achievementsButton];
}

- (void)slideSidebarOut {
    // To do
}

/**************************************
    METHODS TO PUSH VIEW CONTROLLERS
 **************************************/

- (void)pushBikingProgressView {
    BikingProgressViewController *vc = [[BikingProgressViewController alloc] init];
    vc.delegate = self;
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
    vc.rides = self.rides;
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


/*****************************
    METHODS TO HANDLE RIDES
 *****************************/

// delegate method
- (void)bikingProgressDidDismissWithData: (Rides*)ride {
    [self.rides insertObject:ride atIndex:0];
}

// creates some fake rides
- (void)createRides {
    Rides *ride1 = [[Rides alloc] initWithDistance:2.0 rideSpeed:4.2 rideTime:200 dateOfRide:[NSDate date]];
    Rides *ride2 = [[Rides alloc] initWithDistance:3.0 rideSpeed:5.2 rideTime:400 dateOfRide:[NSDate date]];
    
    self.rides = [NSMutableArray arrayWithObjects:ride1, ride2, nil];
}


// transcribes this data for later? hopefully?
- (NSMutableArray*)createLogs {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"rides.txt"];
    
    NSMutableArray *myObject=[NSMutableArray array];
    [self.rides addObject:myObject];
    
    [NSKeyedArchiver archiveRootObject:myObject toFile:appFile];
    
    NSMutableArray* ridesArray = [NSKeyedUnarchiver unarchiveObjectWithFile:appFile];
    
    return ridesArray;
}

@end
