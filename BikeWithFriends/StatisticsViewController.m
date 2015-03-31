//
//  StatisticsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "StatisticsViewController.h"
#import "Rides.h"


@implementation StatisticsViewController
{
    int _screenWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Statistics"];
    [self showLogsButton];
    [self setupView];
}

- (void)setupView {
    _screenWidth = self.view.frame.size.width;
    [self showGraph];
    [self setupSegmentedControl];
    [self showTotals];
}

- (void)setupSegmentedControl {
    _screenWidth = self.view.frame.size.width;
    
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:@[@"Week", @"Month", @"Year", @"Life"]];
    [segControl setFrame:CGRectMake(_screenWidth/20, 84, _screenWidth*9/10, 32)];
    [segControl setSelectedSegmentIndex:0];
    [self.view addSubview:segControl];
    
    // todo need to set targets to change graph for each option
}

- (void)showGraph {
    UIImageView *graph = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chart.png"]];
    [graph setFrame:CGRectMake(_screenWidth/20, 136, _screenWidth*9/10, _screenWidth*3/4)];
    [self.view addSubview:graph];
}

- (void)showTotals {
    UILabel *totalDistLabel = [[UILabel alloc] initWithFrame:CGRectMake(_screenWidth/20, self.view.frame.size.height/2+120, _screenWidth*9/10, 30)];
    [totalDistLabel setText:@"5.9 miles"];
    [self.view addSubview:totalDistLabel];
    
    UILabel *totalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_screenWidth/20, self.view.frame.size.height/2+170, _screenWidth*9/10, 30)];
    [totalTimeLabel setText:@"1 hour, 23 minutes"];
    [self.view addSubview:totalTimeLabel];
}

/*** LOGS ***/

- (void)showLogsButton {
    UIBarButtonItem *logsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(pushLogsView)];
    [self.navigationItem setRightBarButtonItem:logsButton];
}

- (void)pushLogsView {
    self.logsViewController = [[LogsViewController alloc] init];
    self.logsViewController.rides = self.rides;
    [self.navigationController pushViewController:self.logsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
