//
//  AchievementsViewController.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "AchievementsViewController.h"

@implementation AchievementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Achievements"];
    [self showAchievements];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAchievements {
    int navBarHeight = 64;
    int boxPadding = self.view.frame.size.width/23;
    int boxEdge = self.view.frame.size.width*10/23;
    
    NSArray *frames = @[[NSValue valueWithCGRect:CGRectMake(boxPadding, navBarHeight+boxPadding, boxEdge, boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake((2*boxPadding)+boxEdge, navBarHeight+boxPadding, boxEdge, boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake(boxPadding, navBarHeight+(2*boxPadding)+boxEdge, boxEdge, boxEdge)],
                        [NSValue valueWithCGRect:CGRectMake((2*boxPadding)+boxEdge, navBarHeight+(2*boxPadding)+boxEdge, boxEdge, boxEdge)]];
    
    NSArray *backgroundColors = @[[UIColor yellowColor], [UIColor greenColor], [UIColor magentaColor], [UIColor cyanColor]];
    NSArray *pointsEarneds = @[@11, @3, @2, @9];    // update when points are earned
    NSArray *maxPoints = @[@25, @10, @5, @10];      // update as achievements change
    NSArray *titles = @[[NSString stringWithFormat:@"Bike %@ miles", maxPoints[0]],
                        [NSString stringWithFormat:@"Bike %@ hours", maxPoints[0]],
                        [NSString stringWithFormat:@"Bike with %@ friends", maxPoints[0]],
                        [NSString stringWithFormat:@"Bike %@ times", maxPoints[0]]];
    
    for(int i = 0; i < 4; i++) {
        [self makeAchievementBoxWithFrame:[frames[i] CGRectValue] title:titles[i] backgroundColor:backgroundColors[i] pointsEarned:pointsEarneds[i] maxPoints:maxPoints[i]];
    }
}

- (void)makeAchievementBoxWithFrame:(CGRect) frame
                              title:(NSString *)title
                    backgroundColor:(UIColor *)backgroundColor
                       pointsEarned:(NSNumber *)pointsEarned
                          maxPoints:(NSNumber *)maxPoints
{
    // Colored square for background
    UIView *background = [[UIView alloc] initWithFrame:frame];
    [background setBackgroundColor:backgroundColor];
    [self.view addSubview:background];
    
    // Achievement name
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/3)];
    [titleLabel setText:title];
    [background addSubview:titleLabel];
    
    // Progress bar
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, frame.size.height/3, frame.size.width, frame.size.height/3)];
    [progressView setProgress:([pointsEarned floatValue]/[maxPoints floatValue])];
    [progressView setTintColor:[UIColor grayColor]];
    [background addSubview:progressView];
    
    // Progress fraction
    UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height*2/3, frame.size.width, frame.size.height/3)];
    [progressLabel setText:[NSString stringWithFormat:@"%@/%@", pointsEarned, maxPoints]];
    [background addSubview:progressLabel];
    
}

@end
