//
//  AFTableViewController.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFScrollViewController.h"
#import "AFSettingsViewController.h"
@interface AFTableViewController : UITableViewController
@property(strong, nonatomic) AFSettingsViewController *settingsView;
@property (strong, nonatomic) NSMutableArray *data;
@end
