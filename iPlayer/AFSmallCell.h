//
//  AFSmallCell.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFSmallCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellLeftImage;
@property (strong, nonatomic) IBOutlet UILabel *cellLeftLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cellRightImage;
@property (strong, nonatomic) IBOutlet UILabel *cellRightLabel;

@end
