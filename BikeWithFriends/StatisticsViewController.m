//
//  StatisticsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "StatisticsViewController.h"
#import "Rides.h"
#import "Constants.h"

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
    [self createGraph];
    [self showGraphWithImageNamed:@"graph-week.png"];
    [self setupSegmentedControl];
    [self showTotals];
}

- (void)setupSegmentedControl {
    _screenWidth = self.view.frame.size.width;
    
    self.segSections = @[@"Week", @"Month", @"Year", @"Life"];
    self.segControl = [[UISegmentedControl alloc] initWithItems:self.segSections];
    [self.segControl setFrame:CGRectMake(_screenWidth/20, 84, _screenWidth*9/10, 32)];
    [self.segControl setSelectedSegmentIndex:0];
    [self.segControl setTintColor:kRedColor];
    [self.segControl addTarget:self action:@selector(updateGraph) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segControl];
}

- (void)createGraph {
    // Create graph UIImageView the first time
    self.graph = [[UIImageView alloc] initWithFrame:CGRectMake(_screenWidth/20, 136, _screenWidth*9/10, _screenWidth*2/3)];
    [self.view addSubview:self.graph];
}

- (void)showGraphWithImageNamed:(NSString *)imageName {
    [self.graph setImage:[UIImage imageNamed:imageName]];
}

- (void)updateGraph {
    switch (self.segControl.selectedSegmentIndex) {
        case 0:
            [self showGraphWithImageNamed:@"graph-week.png"];
            break;
        case 1:
            [self showGraphWithImageNamed:@"graph-month.png"];
            break;
        case 2:
            [self showGraphWithImageNamed:@"graph-year.png"];
            break;
        case 3:
            [self showGraphWithImageNamed:@"graph-life.png"];
            break;
        default:
            break;
    }
}

- (void)showTotals {
    UILabel *totalDistLabel = [[UILabel alloc] initWithFrame:CGRectMake(_screenWidth/20, self.view.frame.size.height/2+120, _screenWidth*9/10, 30)];
    [totalDistLabel setTextAlignment:NSTextAlignmentCenter];
    [totalDistLabel setFont:[UIFont fontWithName:kMainFont size:22]];
    [totalDistLabel setText:[NSString stringWithFormat:@"5.9 miles this %@", [self.segSections[self.segControl.selectedSegmentIndex] lowercaseString]]];
    [self.view addSubview:totalDistLabel];
    
    UILabel *totalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_screenWidth/20, self.view.frame.size.height/2+170, _screenWidth*9/10, 30)];
    [totalTimeLabel setTextAlignment:NSTextAlignmentCenter];
     [totalTimeLabel setFont:[UIFont fontWithName:kMainFont size:22]];
    [totalTimeLabel setText:[NSString stringWithFormat:@"1 hour, 23 minutes this %@", [self.segSections[self.segControl.selectedSegmentIndex] lowercaseString]]];
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
