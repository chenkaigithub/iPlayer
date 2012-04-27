//
//  AFSettingsViewController.h
//  iPlayer
//
//  Created by Adam Fraser on 26/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFSettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextbox;
- (IBAction)doneEditing:(id)sender;
-(void)refreshFields;
-(IBAction)backgroundTap:(id)sender;
@end