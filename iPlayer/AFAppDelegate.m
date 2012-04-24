//
//  AFAppDelegate.m
//  iPlayer
//
//  Created by Adam Fraser on 18/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFTableViewController.h"
#import "AFAppDelegate.h"

@class AFCategory;

#define feedURL @"http://203.202.17.214/VideoLibrary/SMH_MRSS.txt"
@implementation AFAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize categoryList;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
// Set up navigation controller
    AFTableViewController *tableView = [[AFTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:tableView];
    [self.window addSubview:_navigationController.view];
    self.window.rootViewController = _navigationController;
    _navigationController.navigationBar.tintColor = [[UIColor alloc] initWithHue:0.561 saturation:0.84 brightness:0.79 alpha:1.0];

//Set up model
    NSURL *url = [[NSURL alloc] initWithString:feedURL];
    AFCategory *newsFeed = [[AFCategory alloc] initWithName:@"newsFeed" andURL:url];
    categoryList = [[NSMutableDictionary alloc] initWithObjectsAndKeys:newsFeed, @"smhNews", nil];
    
    self.window.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
