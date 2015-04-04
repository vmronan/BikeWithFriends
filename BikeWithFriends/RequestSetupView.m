//
//  RideRequestView.m
//  BikeWithFriends
//
//  Created by Vanessa Ronan on 3/12/15.
//  Copyright (c) 2015 Jenner Felton, Vanessa Ronan, Sarah Trisorus. All rights reserved.
//

#import "RequestSetupView.h"

@interface RequestSetupView() {
  UIDatePicker* _datePicker;
  UITextField* _whereField;
  UITextField* _notesField;
}
@end

@implementation RequestSetupView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
  
    if(self) {
      NSInteger frameWidth = CGRectGetWidth(frame);
      NSInteger frameHeight = CGRectGetHeight(frame);
      
      // Create a label (when)
      [self createLabelWithText:@"When do you want to meet with Vanessa?"
                      andOffset:frameHeight * 0.12];
      
      // Create a full-width date picker that takes up half the height
      NSInteger pickerFrameWidth = frameWidth;
      NSInteger pickerFrameHeight = frameHeight * 0.30;
      [self initDatePickerWithFrame:CGRectMake(0, frameHeight * 0.15, pickerFrameWidth, pickerFrameHeight)];
      
      // Create a label (where)
      [self createLabelWithText:@"Where do you want to meet?"
                      andOffset:frameHeight * 0.50];
      
      // Create text field (where)
      _whereField = [[UITextField alloc]
                                 initWithFrame:CGRectMake(frameWidth * 0.05,
                                                          frameHeight * 0.55,
                                                          frameWidth * 0.90,
                                                          frameHeight * 0.05)];
      [_whereField setTextColor:[UIColor blackColor]];
      [_whereField setBorderStyle:UITextBorderStyleBezel];
      
      _whereField.delegate = self;
      [self addSubview:_whereField];
      
      // Create a label (notes)
      [self createLabelWithText:@"Anything else?"
                      andOffset:frameHeight * 0.65];
      
      // Create text field (notes)
      _notesField = [[UITextField alloc]
                     initWithFrame:CGRectMake(frameWidth * 0.05,
                                              frameHeight * 0.70,
                                              frameWidth * 0.90,
                                              frameHeight * 0.05)];
      [_notesField setTextColor:[UIColor blackColor]];
      [_notesField setBorderStyle:UITextBorderStyleBezel];
      
      _notesField.delegate = self;
      [self addSubview:_notesField];
      
      // Create a button to submit the request
      [self showSendRequestButton];
    }
  
    return self;
}

- (void)createLabelWithText:(NSString*)text andOffset:(NSInteger)offset
{
  NSInteger frameWidth = CGRectGetWidth([self frame]);
  NSInteger frameHeight = CGRectGetHeight([self frame]);
  
  // Initialize the label
  UILabel* label = [[UILabel alloc] initWithFrame:
                    CGRectMake(0, offset, frameWidth, frameHeight * 0.03)];
  
  // Set the properties
  [label setText:text];
  [label setTextColor:[UIColor blackColor]];
  [label setTextAlignment:NSTextAlignmentCenter];
  
  // Add it to the view
  [self addSubview:label];
}

- (void)initDatePickerWithFrame:(CGRect)frame
{
  // Create the date picker
  _datePicker = [[UIDatePicker alloc] initWithFrame:frame];
  
  // Set the mode to date and time
  [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
  
  // Set the time zone to system time and set current date/time
  [_datePicker setTimeZone:[NSTimeZone systemTimeZone]];
  [_datePicker setDate:[NSDate date]];
  
  // Add it to the view
  [self addSubview:_datePicker];
}

- (void)showSendRequestButton {
    UIButton *rideRequestButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 550, 300, 100)];
    [rideRequestButton setTitle:@"Send request" forState:UIControlStateNormal];
    [rideRequestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rideRequestButton setBackgroundColor:[UIColor colorWithRed:0.77 green:0.95 blue:0.39 alpha:1.0]];
    [rideRequestButton addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rideRequestButton];
}

- (void)sendRequest
{
  // Collect the inputted information
  NSDate* datetime = _datePicker.date;
  NSString* meeting = _whereField.text;
  NSString* notes = _notesField.text;
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"YYYY-MM-dd"];
  
  NSLog(@"Submitting request:");
  NSLog(@"Date/Time: %@", [formatter stringFromDate:datetime]);
  NSLog(@"Location: %@", meeting);
  NSLog(@"Notes: %@", notes);
  
  // Send the information to the delegate if desired
  [self.delegate sendRequestForTime:datetime atPlace:meeting withNotes:notes];
}

// Make the keyboard go away when "return" is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
