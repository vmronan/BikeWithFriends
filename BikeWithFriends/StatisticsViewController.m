//
//  StatisticsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "StatisticsViewController.h"

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Statistics"];
    [self showLogsButton];
}

- (void)showLogsButton {
    UIBarButtonItem *logsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(pushLogsView)];
    [self.navigationItem setRightBarButtonItem:logsButton];
}

- (void)pushLogsView {
    self.logsViewController = [[LogsViewController alloc] init];
    [self.navigationController pushViewController:self.logsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
