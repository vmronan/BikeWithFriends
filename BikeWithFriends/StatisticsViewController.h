//
//  StatisticsViewController.h
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogsViewController.h"

@interface StatisticsViewController : UIViewController

@property (strong, nonatomic) LogsViewController *logsViewController;
@property (strong, nonatomic) NSMutableArray *rides;

@property (strong, nonatomic) NSArray *segSections;
@property (strong, nonatomic) UISegmentedControl *segControl;
@property (strong, nonatomic) UIImageView *graph;

@end
