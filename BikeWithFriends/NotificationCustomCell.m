//
//  NotificationCustomCell.m
//  BikeWithFriends
//
//  Created by JennerPerry on 4/2/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "NotificationCustomCell.h"

@implementation NotificationCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.acceptButtonOn = false;
    self.rejectButtonOn = false;
    
    if (self) {
        // configure layout
        
        // profile image
        self.profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
        [self.profileImage setContentMode: UIViewContentModeScaleToFill];
        [self addSubview:self.profileImage];
        
        // main label
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 230, 20)];
        [self.mainLabel setNumberOfLines:0];
        self.mainLabel.textColor = [UIColor blackColor];
        self.mainLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12.0f];
        [self addSubview:self.mainLabel];
        
        // description label
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 180, 50)];
        self.descriptionLabel.textColor = [UIColor blackColor];
        [self.descriptionLabel setNumberOfLines:0];
        self.descriptionLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [self addSubview:self.descriptionLabel];
        
        if ([reuseIdentifier  isEqual: @"rideRequest"]) {
            // accept button image
            self.acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 15, 40, 40)];
            [self.acceptButton setImage:[UIImage imageNamed:@"acceptIcon.png"] forState: UIControlStateNormal];
            [self.acceptButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:self.acceptButton];
            
            // reject button image
            self.rejectButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 15, 40, 40)];
            [self.rejectButton setImage:[UIImage imageNamed:@"rejectIcon.png"] forState: UIControlStateNormal];
            [self.rejectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:self.rejectButton];
        }
        
        else {
            // cancel button image
            self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 15, 40, 40)];
            [self.cancelButton setImage:[UIImage imageNamed:@"rejectIcon.png"] forState: UIControlStateNormal];
            [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:self.cancelButton];
        }
    }
    return self;
}

- (void) acceptRideRequest:(id)sender {
    if (!self.rejectButtonOn) {
        self.acceptButtonOn = true;
        [self.acceptButton setImage:[UIImage imageNamed:@"acceptIconGreen.png"] forState: UIControlStateNormal];
        [self.rejectButton setImage:[UIImage imageNamed:@"rejectIconGrey.png"] forState: UIControlStateNormal];
    }
}

-(void)rejectRideRequest:(id)sender
{
    if (!self.acceptButtonOn) {
        self.rejectButtonOn = true;
        [self.rejectButton setImage:[UIImage imageNamed:@"rejectIconRed.png"] forState: UIControlStateNormal];
        [self.acceptButton setImage:[UIImage imageNamed:@"acceptIconGrey.png"] forState: UIControlStateNormal];
    }
}

-(void)cancelRideRequest:(id)sender
{
    self.mainLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.descriptionLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    [self.cancelButton setImage:[UIImage imageNamed:@"rejectIconRed.png"] forState: UIControlStateNormal];
}

@end
