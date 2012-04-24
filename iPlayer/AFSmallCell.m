//
//  AFSmallCell.m
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFSmallCell.h"
#import "AFScrollViewController.h"

@implementation AFSmallCell
@synthesize leftButton;
@synthesize rightButton;
@synthesize cellLeftImage, cellLeftLabel;
@synthesize cellRightLabel, cellRightImage;
@synthesize leftStory;
@synthesize rightStory;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)leftButtonPressed:(id)sender {
    AFScrollViewController *scrollView = [[AFScrollViewController alloc] initWithNibName:@"AFScrollView" bundle:nil];
    scrollView.pageNumber = leftStory;
    UINavigationController *nav = self.window.rootViewController;
    [nav pushViewController:scrollView animated:YES];
    
}

- (IBAction)rightButtonPressed:(id)sender {
    AFScrollViewController *scrollView = [[AFScrollViewController alloc] initWithNibName:@"AFScrollView" bundle:nil];
    scrollView.pageNumber = rightStory;
    UINavigationController *nav = self.window.rootViewController;
    [nav pushViewController:scrollView animated:YES];
}
@end
