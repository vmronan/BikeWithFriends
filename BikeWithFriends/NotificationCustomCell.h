//
//  NotificationCustomCell.h
//  BikeWithFriends
//
//  Created by JennerPerry on 4/2/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellDelegate <NSObject>
- (void)didClickOnCellAtIndex:(NSInteger)cellIndex withData:(id)data;
@end

@interface NotificationCustomCell : UITableViewCell

@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImageView *profileImage;
@property (nonatomic, strong) UIButton *acceptButton;
@property (nonatomic, strong) UIButton *rejectButton;
@property (nonatomic, strong) UIButton *cancelButton;

// send button click information
@property (weak, nonatomic) id<CellDelegate>delegate;
@property (assign, nonatomic) NSInteger cellIndex;

@end

