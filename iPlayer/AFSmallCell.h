//
//  AFSmallCell.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFAsyncImageView.h"

@interface AFSmallCell : UITableViewCell
@property (strong, nonatomic) IBOutlet AFAsyncImageView *cellLeftImage;
@property (strong, nonatomic) IBOutlet UILabel *cellLeftLabel;
@property (strong, nonatomic) IBOutlet AFAsyncImageView *cellRightImage;
@property (strong, nonatomic) IBOutlet UILabel *cellRightLabel;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (nonatomic) int leftStory;
@property (nonatomic) int rightStory;

- (IBAction)leftButtonPressed:(id)sender;
- (IBAction)rightButtonPressed:(id)sender;

@end
