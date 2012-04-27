//
//  AFAppDelegate.h
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFCategory.h"
#import "AFSettingsViewController.h"

@interface AFAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) NSMutableDictionary *categoryList;

@end
