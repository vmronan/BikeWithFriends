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
    UILabel* _headerLabel;
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
            [_headerLabel setText:[NSString stringWithFormat:@"ACTIVITY SUMMARY THIS %@", [self.segSections[self.segControl.selectedSegmentIndex] uppercaseString]]];
            break;
        case 1:
            [self showGraphWithImageNamed:@"graph-month.png"];
            [_headerLabel setText:[NSString stringWithFormat:@"ACTIVITY SUMMARY THIS %@", [self.segSections[self.segControl.selectedSegmentIndex] uppercaseString]]];
            break;
        case 2:
            [self showGraphWithImageNamed:@"graph-year.png"];
            [_headerLabel setText:[NSString stringWithFormat:@"ACTIVITY SUMMARY THIS %@", [self.segSections[self.segControl.selectedSegmentIndex] uppercaseString]]];
            break;
        case 3:
            [self showGraphWithImageNamed:@"graph-life.png"];
            [_headerLabel setText:[NSString stringWithFormat:@"%@TIME ACTIVITY SUMMARY", [self.segSections[self.segControl.selectedSegmentIndex] uppercaseString]]];
            break;
        default:
            break;
    }
}

- (void)showTotals {
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(_screenWidth/20, self.view.frame.size.height/2+110, _screenWidth*9/10, 30)];
    [_headerLabel setTextAlignment:NSTextAlignmentCenter];
    [_headerLabel setFont:[UIFont fontWithName:kBoldFont size:20]];
    [_headerLabel setText:[NSString stringWithFormat:@"ACTIVITY SUMMARY THIS %@", [self.segSections[self.segControl.selectedSegmentIndex] uppercaseString]]];
    [self.view addSubview:_headerLabel];

    CGFloat xOffset = _screenWidth/6;
    CGFloat yOffset = self.view.frame.size.height/2+145;
    CGFloat labelWidth = _screenWidth - (3 * xOffset);
    
    UILabel *totalDistLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yOffset, labelWidth, 100)];
    [totalDistLabel setFont:[UIFont fontWithName:kBoldFont size:75]];
    [totalDistLabel setText:@"5.9"];
    totalDistLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:totalDistLabel];
    
    UILabel *textDistLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yOffset + 50, labelWidth, 100)];
    [textDistLabel setFont:[UIFont fontWithName:kMainFont size:18]];
    [textDistLabel setText:@"MILES BIKED"];
    [self.view addSubview:textDistLabel];
    
    UILabel *totalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset + labelWidth - (xOffset / 3), yOffset, labelWidth, 100)];
    [totalTimeLabel setFont:[UIFont fontWithName:kBoldFont size:75]];
    [totalTimeLabel setText:@"1.5"];
    totalDistLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:totalTimeLabel];
    
    UILabel *textTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset + labelWidth - (xOffset / 3) - 5, yOffset + 50, labelWidth, 100)];
    [textTimeLabel setFont:[UIFont fontWithName:kMainFont size:18]];
    [textTimeLabel setText:@"HOURS BIKED"];
    [self.view addSubview:textTimeLabel];
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
