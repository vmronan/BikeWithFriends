//
//  AchievementsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "AchievementsViewController.h"
#import "Constants.h"

@implementation AchievementsViewController
{
    int _boxPadding;
    int _boxEdge;
    int _imgHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Achievements"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self showLevelProgress];
    [self showAchievements];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLevelProgress {
    int imgWidth = self.view.frame.size.width-20;
    UIImageView *levelProgressView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"level-progress"]];
    _imgHeight = imgWidth/levelProgressView.image.size.width*levelProgressView.image.size.height;
    [levelProgressView setFrame:CGRectMake(10, 74, imgWidth, imgWidth/levelProgressView.image.size.width*levelProgressView.image.size.height)];
    [self.view addSubview:levelProgressView];
}

- (void)showAchievements {
    int topHeight = 64 + _imgHeight;
    _boxPadding = self.view.frame.size.width/23;
    _boxEdge = self.view.frame.size.width*10/23;
    
    NSArray *frames = @[[NSValue valueWithCGRect:CGRectMake(_boxPadding, topHeight+_boxPadding, _boxEdge, _boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake((2*_boxPadding)+_boxEdge, topHeight+_boxPadding, _boxEdge, _boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake(_boxPadding, topHeight+(2*_boxPadding)+_boxEdge, _boxEdge, _boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake((2*_boxPadding)+_boxEdge, topHeight+(2*_boxPadding)+_boxEdge, _boxEdge, _boxEdge)]];
    
    NSArray *backgroundColors = @[kBlueColor, kRedColor, kOrangeColor, kGreenColor];
    NSArray *pointsEarneds = @[@11, @7, @1, @9];    // update when points are earned
    NSArray *maxPoints = @[@25, @10, @5, @10];      // update as achievements change
    NSArray *titles = @[[NSString stringWithFormat:@"Bike %@ miles", maxPoints[0]],
                        [NSString stringWithFormat:@"Bike %@ hours", maxPoints[1]],
                        [NSString stringWithFormat:@"Bike with %@ friends", maxPoints[2]],
                        [NSString stringWithFormat:@"Bike %@ times", maxPoints[3]]];
    NSArray *iconTitles = @[@"icon-bike", @"icon-hourglass", @"icon-friends", @"icon-calendar"];
    
    for(int i = 0; i < 4; i++) {
        [self makeAchievementBoxWithFrame:[frames[i] CGRectValue] title:titles[i] backgroundColor:backgroundColors[i] pointsEarned:pointsEarneds[i] maxPoints:maxPoints[i] icon:[UIImage imageNamed:iconTitles[i]]];
    }
}

- (void)makeAchievementBoxWithFrame:(CGRect) frame
                              title:(NSString *)title
                    backgroundColor:(UIColor *)backgroundColor
                       pointsEarned:(NSNumber *)pointsEarned
                          maxPoints:(NSNumber *)maxPoints
                               icon:(UIImage *)icon
{
    // Colored square for background
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:backgroundColor];
    [self.view addSubview:background];
    
    // Icon
    int iconSize = _boxEdge/2;
    UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
    [iconView setFrame:CGRectMake(_boxEdge/4, _boxEdge/20, iconSize, iconSize)];
    [background addSubview:iconView];
    
    // Achievement name
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, iconSize, _boxEdge, frame.size.height/3)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont fontWithName:kMainFont size:18]];
    [titleLabel setText:title];
    [background addSubview:titleLabel];
    
    // Progress bar
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, frame.size.height*4/5, frame.size.width, frame.size.height/3)];
    [progressView setProgress:([pointsEarned floatValue]/[maxPoints floatValue])];
    [progressView setTrackTintColor:[UIColor lightGrayColor]];
    [progressView setTintColor:[UIColor whiteColor]];
    [background addSubview:progressView];
    
    // Progress fraction
    UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height*3/4, _boxEdge, frame.size.height/3)];
    [progressLabel setTextAlignment:NSTextAlignmentCenter];
    [progressLabel setFont:[UIFont fontWithName:kMainFont size:16]];
    [progressLabel setText:[NSString stringWithFormat:@"%@/%@", pointsEarned, maxPoints]];
    [background addSubview:progressLabel];
    
}

@end
