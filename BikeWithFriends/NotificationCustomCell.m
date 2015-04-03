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
    if (self) {
        // configure layout
        
        // profile image
        self.profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50, 30)];
        [self.profileImage setContentMode: UIViewContentModeScaleToFill];
        [self.profileImage setImage:[UIImage imageNamed:@"profileImage.jpg"]];
        
        // get the layer of this image view
        CALayer * l = [self.profileImage layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:10.0];

        // add border
        //[l setBorderWidth:2.0];
        //[l setBorderColor:[[UIColor blueColor] CGColor]];
        
        [self addSubview:self.profileImage];
        
        // main label
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200, 20)];
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
            self.acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 20, 50, 30)];
            [self.acceptButton setImage:[UIImage imageNamed:@"acceptIcon.png"] forState: UIControlStateNormal];
            [self.acceptButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:self.acceptButton];
            
            // reject button image
            self.rejectButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 20, 50, 30)];
            [self.rejectButton setImage:[UIImage imageNamed:@"rejectIcon.png"] forState: UIControlStateNormal];
            [self.rejectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:self.rejectButton];
        }
        
        else {
            
            // cancel button image
            self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 20, 100, 30)];
            [self.cancelButton setImage:[UIImage imageNamed:@"cancelIcon.png"] forState: UIControlStateNormal];
            [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.cancelButton addTarget:self action:@selector(cancelRideRequest) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.cancelButton];
        }
        
        
    }
    return self;
}


@end
